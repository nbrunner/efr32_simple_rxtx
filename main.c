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

#define MAX_LENGTH 255
#define TIMEOUT_UART_RX 10000
#define TIMEOUT_RADIO_TX 10000

/* Private variables ---------------------------------------------------------*/

static uint8_t frame[MAX_LENGTH];

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
    radio_start_rx();

    while (1) {
        // Do not remove this call: Silicon Labs components process action routine
        // must be called from the super loop.
        sl_system_process_action();

#if defined(SL_CATALOG_POWER_MANAGER_PRESENT)
        // Let the CPU go to sleep if the system allows it.
        sl_power_manager_sleep();
#endif

        if (uart_get_rx_available() > 0) {
            sl_udelay_wait(TIMEOUT_UART_RX);
            uint8_t len = MAX_LENGTH;
            uart_rx(frame, &len);
            radio_tx(frame, len);
            sl_udelay_wait(TIMEOUT_RADIO_TX);
            radio_start_rx();
        }

        if (radio_is_rx_completed()) {
            uint8_t len = MAX_LENGTH;
            radio_get_rx_frame(frame, &len);
            uart_tx(frame, len);
            radio_start_rx();
        }
    }
}
