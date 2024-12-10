/**
 ******************************************************************************
 * @file    radio.c
 * @author  nicolas.brunner@heig-vd.ch
 * @date    04-December-2024
 * @brief   Radio driver
 ******************************************************************************
 * @copyright HEIG-VD
 *
 * License information
 *
 ******************************************************************************
 */

/* Includes ------------------------------------------------------------------*/

#include "rail.h"
#include "sl_rail_util_init.h"

#include "radio.h"

/* Private define ------------------------------------------------------------*/

#define BUFFER_SIZE 256
#define CHANNEL 0

/* Private variables ---------------------------------------------------------*/

static RAIL_Handle_t rail_handle;
static RAIL_Events_t events;
static uint8_t rx_buffer[BUFFER_SIZE];

/* Public functions ----------------------------------------------------------*/

void radio_init(void)
{
    rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST0);
}

void radio_tx(const uint8_t* data, uint8_t len)
{
    RAIL_Status_t rail_status = RAIL_STATUS_NO_ERROR;
    uint16_t bytes_writen_in_fifo = RAIL_WriteTxFifo(rail_handle, data, len, true);
    rail_status = RAIL_StartTx(rail_handle, CHANNEL, RAIL_TX_OPTIONS_DEFAULT, NULL);
}

void radio_rx(void)
{
    RAIL_Status_t rail_status = RAIL_STATUS_NO_ERROR;
    RAIL_RxPacketInfo_t packet_info;
    RAIL_RxPacketDetails_t packet_details;

    events = 0;
    RAIL_Status_t status = RAIL_StartRx(rail_handle, CHANNEL, NULL);
    if (status == RAIL_STATUS_NO_ERROR) {
        while ((events & RAIL_EVENTS_RX_COMPLETION) == 0);
        RAIL_RxPacketHandle_t packet_handle = RAIL_GetRxPacketInfo(rail_handle, RAIL_RX_PACKET_HANDLE_OLDEST_COMPLETE, &packet_info);
        if (packet_handle != RAIL_RX_PACKET_HANDLE_INVALID) {
            RAIL_CopyRxPacket(rx_buffer, &packet_info);
            RAIL_GetRxPacketDetails(rail_handle, packet_handle, &packet_details);
            RAIL_ReleaseRxPacket(rail_handle, packet_handle);
        }
    }
}

void sl_rail_util_on_event(RAIL_Handle_t rail_handle, RAIL_Events_t events_)
{
    events = events_;
    if (events & RAIL_EVENT_RX_PACKET_RECEIVED) {
        RAIL_HoldRxPacket(rail_handle);
    }
}
