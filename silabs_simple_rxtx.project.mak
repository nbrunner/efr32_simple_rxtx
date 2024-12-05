BASE_SDK_PATH = C:/Users/nbrun/SimplicityStudio/SDKs/simplicity_sdk
UNAME:=$(shell $(POSIX_TOOL_PATH)uname -s | $(POSIX_TOOL_PATH)sed -e 's/^\(CYGWIN\).*/\1/' | $(POSIX_TOOL_PATH)sed -e 's/^\(MINGW\).*/\1/')
ifeq ($(UNAME),MINGW)
# Translate "C:/super" into "/C/super" for MinGW make.
SDK_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_SDK_PATH) | sed s/://)
endif
SDK_PATH ?= $(BASE_SDK_PATH)
COPIED_SDK_PATH ?= simplicity_sdk_2024.6.2

# This uses the explicit build rules below
PROJECT_SOURCE_FILES = \
 $(SDK_PATH)/hardware/board/src/sl_board_control_gpio.c \
 $(SDK_PATH)/hardware/board/src/sl_board_init.c \
 $(SDK_PATH)/hardware/driver/configuration_over_swo/src/sl_cos.c \
 $(SDK_PATH)/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_eusart/sl_mx25_flash_shutdown.c \
 $(SDK_PATH)/platform/common/src/sl_assert.c \
 $(SDK_PATH)/platform/common/src/sl_core_cortexm.c \
 $(SDK_PATH)/platform/common/src/sl_syscalls.c \
 $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG25/Source/startup_efr32fg25.c \
 $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG25/Source/system_efr32fg25.c \
 $(SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c \
 $(SDK_PATH)/platform/emlib/src/em_acmp.c \
 $(SDK_PATH)/platform/emlib/src/em_cmu.c \
 $(SDK_PATH)/platform/emlib/src/em_core.c \
 $(SDK_PATH)/platform/emlib/src/em_emu.c \
 $(SDK_PATH)/platform/emlib/src/em_eusart.c \
 $(SDK_PATH)/platform/emlib/src/em_gpio.c \
 $(SDK_PATH)/platform/emlib/src/em_msc.c \
 $(SDK_PATH)/platform/emlib/src/em_prs.c \
 $(SDK_PATH)/platform/emlib/src/em_system.c \
 $(SDK_PATH)/platform/emlib/src/em_vdac.c \
 $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c \
 $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c \
 $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c \
 $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c \
 $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.c \
 $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_sfm_sequencer/sl_rail_util_sfm_sequencer.c \
 $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c \
 $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c \
 $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c \
 $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c \
 $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c \
 $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c \
 $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg25.c \
 $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c \
 $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c \
 $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c \
 $(SDK_PATH)/platform/service/mpu/src/sl_mpu.c \
 $(SDK_PATH)/platform/service/system/src/sl_system_init.c \
 $(SDK_PATH)/platform/service/system/src/sl_system_process_action.c \
 $(SDK_PATH)/platform/service/udelay/src/sl_udelay.c \
 $(SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S \
 app_init.c \
 app_process.c \
 autogen/rail_config.c \
 autogen/sl_board_default_init.c \
 autogen/sl_event_handler.c \
 autogen/sl_rail_util_callbacks.c \
 autogen/sl_rail_util_init.c \
 main.c

C_SOURCE_FILES   += $(filter %.c, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cpp, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cc, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.s, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.S, $(PROJECT_SOURCE_FILES))
LIB_FILES        += $(filter %.a, $(PROJECT_SOURCE_FILES))

C_DEFS += \
 '-DEFR32FG25B222F1920IM56=1' \
 '-DSL_BOARD_NAME="BRD4271A"' \
 '-DSL_BOARD_REV="A06"' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_1_RF_BAND=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHFXO_FREQ=39000000' \
 '-DSL_CLOCK_MANAGER_AUTO_BAND_VALID=1' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_CORE=core'

ASM_DEFS += \
 '-DEFR32FG25B222F1920IM56=1' \
 '-DSL_BOARD_NAME="BRD4271A"' \
 '-DSL_BOARD_REV="A06"' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_1_RF_BAND=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHFXO_FREQ=39000000' \
 '-DSL_CLOCK_MANAGER_AUTO_BAND_VALID=1' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DCMSIS_NVIC_VIRTUAL=1' \
 '-DCMSIS_NVIC_VIRTUAL_HEADER_FILE="cmsis_nvic_virtual.h"' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DSL_CODE_COMPONENT_CORE=core'

INCLUDES += \
 -Iautogen \
 -Iconfig \
 -Iconfig/rail \
 -I. \
 -I$(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG25/Include \
 -I$(SDK_PATH)/hardware/board/inc \
 -I$(SDK_PATH)/platform/service/clock_manager/inc \
 -I$(SDK_PATH)/platform/service/clock_manager/src \
 -I$(SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(SDK_PATH)/platform/common/inc \
 -I$(SDK_PATH)/hardware/driver/configuration_over_swo/inc \
 -I$(SDK_PATH)/platform/driver/debug/inc \
 -I$(SDK_PATH)/platform/service/device_manager/inc \
 -I$(SDK_PATH)/platform/service/device_init/inc \
 -I$(SDK_PATH)/platform/emlib/inc \
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc \
 -I$(SDK_PATH)/platform/service/interrupt_manager/inc/arm \
 -I$(SDK_PATH)/platform/service/memory_manager/inc \
 -I$(SDK_PATH)/platform/service/mpu/inc \
 -I$(SDK_PATH)/hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_eusart \
 -I$(SDK_PATH)/platform/radio/rail_lib/common \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/ble \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/ieee802154 \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/wmbus \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/zwave \
 -I$(SDK_PATH)/platform/radio/rail_lib/chip/efr32/efr32xg2x \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/sidewalk \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_callbacks \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/efr32xg25 \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi \
 -I$(SDK_PATH)/platform/common/toolchain/inc \
 -I$(SDK_PATH)/platform/service/system/inc \
 -I$(SDK_PATH)/platform/service/udelay/inc

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys \
 $(SDK_PATH)/platform/radio/rail_lib/autogen/librail_release/librail_efr32xg25_gcc_release.a

LIBS += $(GROUP_START) $(PROJECT_LIBS) $(GROUP_END)

LIB_FILES += $(filter %.a, $(PROJECT_LIBS))

C_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -std=c18 \
 -Wall \
 -Wextra \
 -Og \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -imacros sl_gcc_preinclude.h \
 -mcmse \
 --specs=nano.specs \
 -g

CXX_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -std=c++17 \
 -fno-rtti \
 -fno-exceptions \
 -Wall \
 -Wextra \
 -Og \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -imacros sl_gcc_preinclude.h \
 -mcmse \
 --specs=nano.specs \
 -g

ASM_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -imacros sl_gcc_preinclude.h \
 -x assembler-with-cpp

LD_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -T"autogen/linkerfile.ld" \
 --specs=nano.specs \
 -Xlinker -Map=$(OUTPUT_DIR)/$(PROJECTNAME).map \
 -Wl,--gc-sections \
 -Wl,--no-warn-rwx-segments


####################################################################
# Pre/Post Build Rules                                             #
####################################################################
pre-build:
	# No pre-build defined

post-build: $(OUTPUT_DIR)/$(PROJECTNAME).out
	# No post-build defined
