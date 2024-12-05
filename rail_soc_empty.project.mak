####################################################################
# Automatically-generated file. Do not edit!                       #
# Makefile Version 15                                              #
####################################################################

BASE_SDK_PATH = C:/Users/nbrun/SimplicityStudio/SDKs/simplicity_sdk
UNAME:=$(shell $(POSIX_TOOL_PATH)uname -s | $(POSIX_TOOL_PATH)sed -e 's/^\(CYGWIN\).*/\1/' | $(POSIX_TOOL_PATH)sed -e 's/^\(MINGW\).*/\1/')
ifeq ($(UNAME),MINGW)
# Translate "C:/super" into "/C/super" for MinGW make.
SDK_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_SDK_PATH) | sed s/://)
endif
SDK_PATH ?= $(BASE_SDK_PATH)
COPIED_SDK_PATH ?= simplicity_sdk_2024.6.2

# This uses the explicit build rules below
PROJECT_SOURCE_FILES =

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

####################################################################
# SDK Build Rules                                                  #
####################################################################
$(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.o: $(SDK_PATH)/hardware/board/src/sl_board_control_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/hardware/board/src/sl_board_control_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/hardware/board/src/sl_board_control_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_control_gpio.o

$(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.o: $(SDK_PATH)/hardware/board/src/sl_board_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/hardware/board/src/sl_board_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/hardware/board/src/sl_board_init.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/board/src/sl_board_init.o

$(OUTPUT_DIR)/sdk/hardware/driver/configuration_over_swo/src/sl_cos.o: $(SDK_PATH)/hardware/driver/configuration_over_swo/src/sl_cos.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/hardware/driver/configuration_over_swo/src/sl_cos.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/hardware/driver/configuration_over_swo/src/sl_cos.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/driver/configuration_over_swo/src/sl_cos.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/driver/configuration_over_swo/src/sl_cos.o

$(OUTPUT_DIR)/sdk/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_eusart/sl_mx25_flash_shutdown.o: $(SDK_PATH)/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_eusart/sl_mx25_flash_shutdown.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_eusart/sl_mx25_flash_shutdown.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_eusart/sl_mx25_flash_shutdown.c
CDEPS += $(OUTPUT_DIR)/sdk/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_eusart/sl_mx25_flash_shutdown.d
OBJS += $(OUTPUT_DIR)/sdk/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_eusart/sl_mx25_flash_shutdown.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o: $(SDK_PATH)/platform/common/src/sl_assert.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_assert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_assert.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.o: $(SDK_PATH)/platform/common/src/sl_core_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_core_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_core_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_core_cortexm.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o: $(SDK_PATH)/platform/common/src/sl_syscalls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_syscalls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_syscalls.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG25/Source/startup_efr32fg25.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG25/Source/startup_efr32fg25.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG25/Source/startup_efr32fg25.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG25/Source/startup_efr32fg25.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG25/Source/startup_efr32fg25.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG25/Source/startup_efr32fg25.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG25/Source/system_efr32fg25.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG25/Source/system_efr32fg25.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG25/Source/system_efr32fg25.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/Device/SiliconLabs/EFR32FG25/Source/system_efr32fg25.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG25/Source/system_efr32fg25.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32FG25/Source/system_efr32fg25.o

$(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.o: $(SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/driver/debug/src/sl_debug_swo.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.d
OBJS += $(OUTPUT_DIR)/sdk/platform/driver/debug/src/sl_debug_swo.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_acmp.o: $(SDK_PATH)/platform/emlib/src/em_acmp.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_acmp.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_acmp.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_acmp.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_acmp.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o: $(SDK_PATH)/platform/emlib/src/em_cmu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_cmu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_cmu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.o: $(SDK_PATH)/platform/emlib/src/em_core.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_core.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_core.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o: $(SDK_PATH)/platform/emlib/src/em_emu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_emu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_emu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_eusart.o: $(SDK_PATH)/platform/emlib/src/em_eusart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_eusart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_eusart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_eusart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_eusart.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o: $(SDK_PATH)/platform/emlib/src/em_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o: $(SDK_PATH)/platform/emlib/src/em_msc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_msc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_msc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o: $(SDK_PATH)/platform/emlib/src/em_prs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_prs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_prs.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o: $(SDK_PATH)/platform/emlib/src/em_system.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_system.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_system.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_vdac.o: $(SDK_PATH)/platform/emlib/src/em_vdac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_vdac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_vdac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_vdac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_vdac.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_protocol/sl_rail_util_protocol.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_rssi/sl_rail_util_rssi.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_sfm_sequencer/sl_rail_util_sfm_sequencer.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_sfm_sequencer/sl_rail_util_sfm_sequencer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_sfm_sequencer/sl_rail_util_sfm_sequencer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_sfm_sequencer/sl_rail_util_sfm_sequencer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_sfm_sequencer/sl_rail_util_sfm_sequencer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_sfm_sequencer/sl_rail_util_sfm_sequencer.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init.o

$(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.o: $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.o: $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.o: $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s2.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s2.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg25.o: $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg25.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg25.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/clocks/sl_device_clock_efr32xg25.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg25.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/clocks/sl_device_clock_efr32xg25.o

$(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.o: $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_manager/src/sl_device_clock.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_manager/src/sl_device_clock.o

$(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o: $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.o

$(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o: $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/memory_manager/src/sl_memory_manager_region.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/memory_manager/src/sl_memory_manager_region.o

$(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu.o: $(SDK_PATH)/platform/service/mpu/src/sl_mpu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/mpu/src/sl_mpu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/mpu/src/sl_mpu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/mpu/src/sl_mpu.o

$(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.o: $(SDK_PATH)/platform/service/system/src/sl_system_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/system/src/sl_system_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/system/src/sl_system_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.o

$(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_process_action.o: $(SDK_PATH)/platform/service/system/src/sl_system_process_action.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/system/src/sl_system_process_action.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/system/src/sl_system_process_action.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_process_action.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_process_action.o

$(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.o: $(SDK_PATH)/platform/service/udelay/src/sl_udelay.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/udelay/src/sl_udelay.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/udelay/src/sl_udelay.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay.o

$(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.o: $(SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(ASMFLAGS) -c -o $@ $(SDK_PATH)/platform/service/udelay/src/sl_udelay_armv6m_gcc.S
ASMDEPS_S += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/udelay/src/sl_udelay_armv6m_gcc.o

$(OUTPUT_DIR)/project/app_init.o: app_init.c
	@$(POSIX_TOOL_PATH)echo 'Building app_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app_init.c
CDEPS += $(OUTPUT_DIR)/project/app_init.d
OBJS += $(OUTPUT_DIR)/project/app_init.o

$(OUTPUT_DIR)/project/app_process.o: app_process.c
	@$(POSIX_TOOL_PATH)echo 'Building app_process.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app_process.c
CDEPS += $(OUTPUT_DIR)/project/app_process.d
OBJS += $(OUTPUT_DIR)/project/app_process.o

$(OUTPUT_DIR)/project/autogen/rail_config.o: autogen/rail_config.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/rail_config.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/rail_config.c
CDEPS += $(OUTPUT_DIR)/project/autogen/rail_config.d
OBJS += $(OUTPUT_DIR)/project/autogen/rail_config.o

$(OUTPUT_DIR)/project/autogen/sl_board_default_init.o: autogen/sl_board_default_init.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_board_default_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_board_default_init.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_board_default_init.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_board_default_init.o

$(OUTPUT_DIR)/project/autogen/sl_event_handler.o: autogen/sl_event_handler.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_event_handler.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_event_handler.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.o

$(OUTPUT_DIR)/project/autogen/sl_rail_util_callbacks.o: autogen/sl_rail_util_callbacks.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_rail_util_callbacks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_rail_util_callbacks.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_callbacks.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_callbacks.o

$(OUTPUT_DIR)/project/autogen/sl_rail_util_init.o: autogen/sl_rail_util_init.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_rail_util_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_rail_util_init.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_init.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_init.o

$(OUTPUT_DIR)/project/main.o: main.c
	@$(POSIX_TOOL_PATH)echo 'Building main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ main.c
CDEPS += $(OUTPUT_DIR)/project/main.d
OBJS += $(OUTPUT_DIR)/project/main.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA