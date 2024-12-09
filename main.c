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

#include "sl_component_catalog.h"
#include "sl_system_init.h"
#if defined(SL_CATALOG_POWER_MANAGER_PRESENT)
  #include "sl_power_manager.h"
#endif
#include "sl_udelay.h"
#include "sl_system_process_action.h"

#include "radio.h"

/* Private define ------------------------------------------------------------*/

#define TX true

/* Public functions ----------------------------------------------------------*/

int main(void)
{
    // Initialize Silicon Labs device, system, service(s) and protocol stack(s).
    // Note that if the kernel is present, processing task(s) will be created by
    // this call.
    sl_system_init();

    // Initialize the application. For example, create periodic timer(s) or
    // task(s) if the kernel is present.
    radio_init();

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
        radio_tx();
#else
        radio_rx();
#endif
    }
}
