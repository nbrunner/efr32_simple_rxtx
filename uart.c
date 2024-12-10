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

#include "uartdrv.h"

#include "uart.h"

/* Private define ------------------------------------------------------------*/

#define VCOM_ENABLE_PORT gpioPortA
#define VCOM_ENABLE_PIN  11

#define QUEUE_SIZE 256

DEFINE_BUF_QUEUE(QUEUE_SIZE, rxQueue);
DEFINE_BUF_QUEUE(QUEUE_SIZE, txQueue);

/* Private variables ---------------------------------------------------------*/

static UARTDRV_HandleData_t handle_data;
static UARTDRV_Handle_t handle = &handle_data;

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

    UARTDRV_InitEuart(handle, &init_data);
}

void uart_tx(const uint8_t* data, uint8_t len)
{
    UARTDRV_Transmit(handle, (uint8_t*)data, len, NULL);
}

void uart_rx(void)
{

}
