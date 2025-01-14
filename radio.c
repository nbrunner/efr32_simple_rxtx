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

/* Public functions ----------------------------------------------------------*/

void radio_init(void)
{
    rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST0);
}

void radio_tx(const uint8_t* data, uint8_t len)
{
    events = 0;
    uint16_t bytes_writen_in_fifo = RAIL_WriteTxFifo(rail_handle, data, len, true);
    assert(bytes_writen_in_fifo == len);

    RAIL_Status_t status = RAIL_StartTx(rail_handle, CHANNEL, RAIL_TX_OPTIONS_DEFAULT, NULL);
    assert(status == RAIL_STATUS_NO_ERROR);
}

bool radio_is_tx_completed(void)
{
    return (events & RAIL_EVENTS_TX_COMPLETION) != 0;
}

void radio_start_rx(void)
{
    events = 0;
    RAIL_Status_t status = RAIL_StartRx(rail_handle, CHANNEL, NULL);
    assert(status == RAIL_STATUS_NO_ERROR);
}

bool radio_is_rx_completed(void)
{
    return (events & RAIL_EVENTS_RX_COMPLETION) != 0;
}

void radio_get_rx_frame(uint8_t* data, uint8_t* len)
{
    RAIL_RxPacketInfo_t packet_info;
    RAIL_RxPacketDetails_t packet_details;

    if ((events & RAIL_EVENTS_RX_COMPLETION) != 0) {
        RAIL_RxPacketHandle_t packet_handle = RAIL_GetRxPacketInfo(rail_handle, RAIL_RX_PACKET_HANDLE_OLDEST_COMPLETE, &packet_info);
        if ((packet_handle != RAIL_RX_PACKET_HANDLE_INVALID) && (packet_info.packetBytes <= *len)) {
            RAIL_CopyRxPacket(data, &packet_info);
            *len = packet_info.packetBytes;
            RAIL_Status_t status = RAIL_GetRxPacketDetails(rail_handle, packet_handle, &packet_details);
            assert(status == RAIL_STATUS_NO_ERROR);
            status = RAIL_ReleaseRxPacket(rail_handle, packet_handle);
            assert(status == RAIL_STATUS_NO_ERROR);
        } else {
            *len = 0;
        }
    } else {
        *len = 0;
    }
}

void radio_rx(uint8_t* data, uint8_t* len)
{
    RAIL_RxPacketInfo_t packet_info;
    RAIL_RxPacketDetails_t packet_details;

    events = 0;
    RAIL_Status_t status = RAIL_StartRx(rail_handle, CHANNEL, NULL);
    if (status == RAIL_STATUS_NO_ERROR) {
        while ((events & RAIL_EVENTS_RX_COMPLETION) == 0);
        RAIL_RxPacketHandle_t packet_handle = RAIL_GetRxPacketInfo(rail_handle, RAIL_RX_PACKET_HANDLE_OLDEST_COMPLETE, &packet_info);
        if ((packet_handle != RAIL_RX_PACKET_HANDLE_INVALID) && (packet_info.packetBytes <= *len)) {
            RAIL_CopyRxPacket(data, &packet_info);
            *len = packet_info.packetBytes;
            status = RAIL_GetRxPacketDetails(rail_handle, packet_handle, &packet_details);
            assert(status == RAIL_STATUS_NO_ERROR);
            status = RAIL_ReleaseRxPacket(rail_handle, packet_handle);
            assert(status == RAIL_STATUS_NO_ERROR);
        } else {
            *len = 0;
        }
    } else {
        *len = 0;
    }
}

void sl_rail_util_on_event(RAIL_Handle_t rail_handle, RAIL_Events_t events_)
{
    events = events_;
    if (events & RAIL_EVENT_RX_PACKET_RECEIVED) {
        RAIL_HoldRxPacket(rail_handle);
    }
}
