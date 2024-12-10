/**
 ******************************************************************************
 * @file    uart.c
 * @author  nicolas.brunner@heig-vd.ch
 * @date    09-December-2024
 * @brief   UART driver
 ******************************************************************************
 * @copyright HEIG-VD
 *
 * License information
 *
 ******************************************************************************
 */

/* Includes ------------------------------------------------------------------*/

#include <assert.h>
#include <inttypes.h>
#include <string.h>

#include "uartdrv.h"

#include "uart.h"

/* Private define ------------------------------------------------------------*/

#define VCOM_ENABLE_PORT gpioPortA
#define VCOM_ENABLE_PIN  11

#define QUEUE_SIZE 8
#define RX_BUFFER_SIZE 256

DEFINE_BUF_QUEUE(QUEUE_SIZE, rxQueue);
DEFINE_BUF_QUEUE(QUEUE_SIZE, txQueue);

/* Private variables ---------------------------------------------------------*/

static UARTDRV_HandleData_t handle_data;
static UARTDRV_Handle_t handle = &handle_data;

static uint8_t rx_buffer[RX_BUFFER_SIZE];
static uint8_t rx_buffer_read_index;

/* Private functions declaration ---------------------------------------------*/

static void rx_complete(struct UARTDRV_HandleData *handle,
        Ecode_t transfer_status,
        uint8_t *data,
        UARTDRV_Count_t transfer_count);
static uint8_t get_rx_buffer_write_index(void);

/* Public functions ----------------------------------------------------------*/

void uart_init(void)
{
#ifdef VCOM_ENABLE_PORT
    GPIO_PinModeSet(VCOM_ENABLE_PORT,
            VCOM_ENABLE_PIN,
            gpioModePushPull,
            1);
#endif

    UARTDRV_InitEuart_t init_data;
    init_data.port = EUSART0;
    init_data.useLowFrequencyMode = false;
    init_data.baudRate = 115200;
    init_data.txPort = gpioPortA;
    init_data.rxPort = gpioPortA;
    init_data.txPin = 8;
    init_data.rxPin = 9;
    init_data.uartNum = 0;
    init_data.stopBits = eusartStopbits1;
    init_data.parity = eusartNoParity;
    init_data.oversampling = eusartOVS16;
    init_data.mvdis = eusartMajorityVoteEnable;
    init_data.fcType = uartdrvFlowControlNone;
    init_data.rxQueue = (UARTDRV_Buffer_FifoQueue_t*) &rxQueue;
    init_data.txQueue = (UARTDRV_Buffer_FifoQueue_t*) &txQueue;

    Ecode_t err = UARTDRV_InitEuart(handle, &init_data);
    assert(err == ECODE_EMDRV_UARTDRV_OK);

    err = UARTDRV_Receive(handle, rx_buffer, RX_BUFFER_SIZE, rx_complete);
    assert(err == ECODE_EMDRV_UARTDRV_OK);
}

void uart_tx(const uint8_t* data, uint8_t len)
{
    Ecode_t err = UARTDRV_Transmit(handle, (uint8_t*)data, len, NULL);
    assert(err == ECODE_EMDRV_UARTDRV_OK);
}

void uart_rx(uint8_t* data, uint8_t* len)
{
    uint8_t effective_len = uart_get_rx_available();
    if (effective_len > *len) {
        effective_len = *len;
    } else {
        *len = effective_len;
    }

    if (effective_len > UINT8_MAX - rx_buffer_read_index) {
        uint8_t first_part = -rx_buffer_read_index;
        memcpy(data, &rx_buffer[rx_buffer_read_index], first_part);
        memcpy(&data[first_part], rx_buffer, effective_len - first_part);
    } else {
        memcpy(data, &rx_buffer[rx_buffer_read_index], effective_len);
    }
    rx_buffer_read_index += effective_len;
}

uint8_t uart_get_rx_available(void)
{
    return get_rx_buffer_write_index() - rx_buffer_read_index;
}

/* Private functions implementation ------------------------------------------*/

static void rx_complete(struct UARTDRV_HandleData *handle,
        Ecode_t transfer_status,
        uint8_t *data,
        UARTDRV_Count_t transfer_count)
{
    Ecode_t err = UARTDRV_Receive(handle, rx_buffer, RX_BUFFER_SIZE, rx_complete);
    assert(err == ECODE_EMDRV_UARTDRV_OK);
}

static uint8_t get_rx_buffer_write_index(void)
{
    uint8_t *buffer;
    UARTDRV_Count_t received;
    UARTDRV_Count_t remaining;
    UARTDRV_GetReceiveStatus(handle, &buffer, &received, &remaining);
    return received;
}
