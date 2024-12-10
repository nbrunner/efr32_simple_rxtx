/**
 ******************************************************************************
 * @file    main.c
 * @author  nicolas.brunner@heig-vd.ch
 * @date    05-December-2024
 * @brief   Main of silabs_simple_rxtx
 *          based on rail_soc_empty
 ******************************************************************************
 * @copyright HEIG-VD
 *
 * License information
 *
 ******************************************************************************
 */

/* Includes ------------------------------------------------------------------*/

#include <stdbool.h>
#include <string.h>

#include "sl_component_catalog.h"
#include "sl_system_init.h"
#if defined(SL_CATALOG_POWER_MANAGER_PRESENT)
  #include "sl_power_manager.h"
#endif
#include "sl_udelay.h"
#include "sl_system_process_action.h"

#include "radio.h"
#include "uart.h"

/* Private define ------------------------------------------------------------*/

#define TX true

#define RX_MESSAGE "Frame received\n"
#define TX_LENGTH 16

/* Private variables ---------------------------------------------------------*/

static uint8_t tx_frame[TX_LENGTH] = {
    0x0F, 0x16, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66,
    0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE,
};

/* Public functions ----------------------------------------------------------*/

int main(void)
{
    // Initialize Silicon Labs device, system, service(s) and protocol stack(s).
    // Note that if the kernel is present, processing task(s) will be created by
    // this call.
    sl_system_init();

    // Initialize the application.
    radio_init();
    uart_init();

    while (1) {
        // Do not remove this call: Silicon Labs components process action routine
        // must be called from the super loop.
        sl_system_process_action();

#if defined(SL_CATALOG_POWER_MANAGER_PRESENT)
        // Let the CPU go to sleep if the system allows it.
        sl_power_manager_sleep();
#endif

#if TX
        sl_udelay_wait(1000000);
        radio_tx(tx_frame, TX_LENGTH);
#else
        radio_rx();
        uart_tx((uint8_t*)RX_MESSAGE, strlen(RX_MESSAGE));
#endif
    }
}
