/**
 ******************************************************************************
 * @file    radio.h
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

#ifndef RADIO_H
#define RADIO_H

/* Includes ------------------------------------------------------------------*/

#include <stdbool.h>
#include <stdint.h>

/* Exported functions --------------------------------------------------------*/

void radio_init(void);

void radio_tx(const uint8_t* data, uint8_t len);

void radio_start_rx(void);

bool radio_is_rx_completed(void);

void radio_get_rx_frame(uint8_t* data, uint8_t* len);

void radio_rx(uint8_t* data, uint8_t* len);

#endif
