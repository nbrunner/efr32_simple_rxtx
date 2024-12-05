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
#include "sl_flex_rail_package_assistant.h"
#include "sl_rail_util_init.h"

#include "radio.h"

/* Private define ------------------------------------------------------------*/

#define TX_PAYLOAD_LENGTH 16
#define CHANNEL 0

/* Private variables ---------------------------------------------------------*/

static RAIL_Handle_t rail_handle;

static uint8_t out_packet[TX_PAYLOAD_LENGTH] = {
    0x0F, 0x16, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66,
    0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE,
};

/* Public functions ----------------------------------------------------------*/

void radio_init(void)
{
    rail_handle = sl_rail_util_get_handle(SL_RAIL_UTIL_HANDLE_INST0);
}

void radio_tx(void)
{
    RAIL_Status_t rail_status = RAIL_STATUS_NO_ERROR;
    prepare_package(rail_handle, out_packet, sizeof(out_packet));
    rail_status = RAIL_StartTx(rail_handle, CHANNEL, RAIL_TX_OPTIONS_DEFAULT, NULL);
}
