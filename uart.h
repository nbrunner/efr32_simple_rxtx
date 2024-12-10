/**
 ******************************************************************************
 * @file    uart.h
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

#ifndef UART_H
#define UART_H

/* Includes ------------------------------------------------------------------*/

#include <stdint.h>

/* Exported functions --------------------------------------------------------*/

void uart_init(void);

void uart_tx(uint8_t* data, uint8_t len);

void uart_rx(void);

#endif
