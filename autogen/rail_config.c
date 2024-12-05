/***************************************************************************//**
 * @brief RAIL Configuration
 * @details
 *   WARNING: Auto-Generated Radio Config  -  DO NOT EDIT
 *   Radio Configurator Version: 2402.6.1
 *   RAIL Adapter Version: 2.4.33
 *   RAIL Compatibility: 2.x
 *******************************************************************************
 * # License
 * <b>Copyright 2019 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * SPDX-License-Identifier: Zlib
 *
 * The licensor of this software is Silicon Laboratories Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 ******************************************************************************/
#include "em_device.h"
#include "rail_config.h"

uint32_t RAILCb_CalcSymbolRate(RAIL_Handle_t railHandle)
{
  (void) railHandle;
  return 0U;
}

uint32_t RAILCb_CalcBitRate(RAIL_Handle_t railHandle)
{
  (void) railHandle;
  return 0U;
}

void RAILCb_ConfigFrameTypeLength(RAIL_Handle_t railHandle,
                                  const RAIL_FrameType_t *frameType)
{
  (void) railHandle;
  (void) frameType;
}

static const uint8_t irCalConfig[] = {
  20, 41, 2, 0, 0, 57, 19, 0, 0, 0, 1, 0, 2, 100, 0, 1, 1, 47, 0, 0, 7
};

static const uint8_t txIrCalConfig[5] = {
  0x00, 0x03, 5, 5, 5
};

static const uint32_t rffpllConfig[] = {
  6558726, 325000000, 97500000
};

const RAIL_RffpllConfig_t *radioConfigRffpllConfig = (RAIL_RffpllConfig_t *) rffpllConfig;

#if RAIL_SUPPORTS_HFXO_COMPENSATION
static const uint16_t modemTxCompensation[33] = {
  0x2819, 0xce04, 0x27, 0x2419, 0xd804, 0x27, 0x2019, 0xe204, 0x27, 0x1c19, 0xec04, 0x27, 0x1819, 0xf604, 0x27, 0x17d9, 0x00fc, 0x999, 0x1018, 0x0a04, 0x27, 0xc18, 0x1404, 0x27, 0x818, 0x1e04, 0x27, 0x418, 0x2804, 0x27, 0x18, 0x3204, 0x27
};
#endif

static const int32_t timingConfig[] = {
  18537, 18537, 2000, 0
};

static const uint8_t hfxoRetimingConfigEntries[] = {
  1, 0, 0, 0, 0xc0, 0x17, 0x53, 0x02, 4, 12, 0, 0, 0xe0, 0x02, 0, 0, 0, 0, 0x3c, 0x03, 1, 2, 5, 4, 0x98, 0x03, 1, 2, 5, 5, 0xf4, 0x03, 1, 2, 6, 5
};

static RAIL_ChannelConfigEntryAttr_t channelConfigEntryAttr = {
#if RAIL_SUPPORTS_OFDM_PA
  {
#ifdef RADIO_CONFIG_ENABLE_IRCAL_MULTIPLE_RF_PATHS
    { 0xFFFFFFFFUL, 0xFFFFFFFFUL, },
#else
    { 0xFFFFFFFFUL },
#endif // RADIO_CONFIG_ENABLE_IRCAL_MULTIPLE_RF_PATHS
    { 0xFFFFFFFFUL, 0xFFFFFFFFUL }
  }
#else // RAIL_SUPPORTS_OFDM_PA
#ifdef RADIO_CONFIG_ENABLE_IRCAL_MULTIPLE_RF_PATHS
  { 0xFFFFFFFFUL, 0xFFFFFFFFUL, },
#else
  { 0xFFFFFFFFUL },
#endif // RADIO_CONFIG_ENABLE_IRCAL_MULTIPLE_RF_PATHS
#endif // RAIL_SUPPORTS_OFDM_PA
};

static const uint32_t phyInfo[] = {
  17UL,
  0x005B6DB6UL, // 91.42857142857143
  (uint32_t) NULL,
  (uint32_t) irCalConfig,
  (uint32_t) timingConfig,
  0x00000000UL,
  0UL,
  0UL,
  500000UL,
  0x00F40101UL,
  0x071042F4UL,
  (uint32_t) NULL,
  (uint32_t) hfxoRetimingConfigEntries,
  (uint32_t) NULL,
  0UL,
  0UL,
  500000UL,
  (uint32_t) rffpllConfig,
  (uint32_t) txIrCalConfig,
#if RAIL_SUPPORTS_HFXO_COMPENSATION
  (uint32_t) modemTxCompensation,
#else
  (uint32_t) NULL,
#endif
};

const uint32_t Protocol_Configuration_modemConfigBase[] = {
  0x10018058UL, 0xBF1FF07FUL,
  0x30018058UL, 0x40000000UL,
  0x080101D4UL, 0x00000000UL,
  0x0102400CUL, 0x00000000UL,
  /*    4010 */ 0x00004000UL,
  0x01024020UL, 0x0000000FUL,
  /*    4024 */ 0x00000000UL,
  0x01074030UL, 0x00000000UL,
  /*    4034 */ 0x00000000UL,
  /*    4038 */ 0x00000000UL,
  /*    403C */ 0x00000000UL,
  /*    4040 */ 0x00000000UL,
  /*    4044 */ 0x00006000UL,
  /*    4048 */ 0x03000700UL,
  0x01014050UL, 0x00000000UL,
  0x0102405CUL, 0x00000000UL,
  /*    4060 */ 0x00000000UL,
  0x010140A8UL, 0x00000007UL,
  0x010440BCUL, 0x00000000UL,
  /*    40C0 */ 0x00000000UL,
  /*    40C4 */ 0x00000000UL,
  /*    40C8 */ 0x00000000UL,
  0x01044108UL, 0x00004CFFUL,
  /*    410C */ 0x00000000UL,
  /*    4110 */ 0x00004DFFUL,
  /*    4114 */ 0x00000000UL,
  0x01014184UL, 0x00000000UL,
  0x1101C020UL, 0x0007F800UL,
  0x3101C020UL, 0x002801FEUL,
  0x1101C024UL, 0x000000FFUL,
  0x3101C024UL, 0x00001300UL,
  0x0108C028UL, 0x03B380ECUL,
  /*    C02C */ 0x51407543UL,
  /*    C030 */ 0xF8000FA0UL,
  /*    C034 */ 0x00004030UL,
  /*    C038 */ 0x0007AAA8UL,
  /*    C03C */ 0x00000000UL,
  /*    C040 */ 0x00000000UL,
  /*    C044 */ 0x00000000UL,
  0x0114C054UL, 0x00302187UL,
  /*    C058 */ 0xE62D0030UL,
  /*    C05C */ 0x00000090UL,
  /*    C060 */ 0x2B29241AUL,
  /*    C064 */ 0x0000002DUL,
  /*    C068 */ 0x0002C688UL,
  /*    C06C */ 0x00000500UL,
  /*    C070 */ 0x000010BAUL,
  /*    C074 */ 0x003F0000UL,
  /*    C078 */ 0x00EE008DUL,
  /*    C07C */ 0x03AC01F6UL,
  /*    C080 */ 0x079604F5UL,
  /*    C084 */ 0x0D9C09DEUL,
  /*    C088 */ 0x179311C3UL,
  /*    C08C */ 0x26F51DFEUL,
  /*    C090 */ 0x3FFF32BDUL,
  /*    C094 */ 0x1BF815FEUL,
  /*    C098 */ 0x2DB423DCUL,
  /*    C09C */ 0x3FFF39D0UL,
  /*    C0A0 */ 0x00003FFFUL,
  0x0105C0A8UL, 0x15724BBDUL,
  /*    C0AC */ 0x0518A311UL,
  /*    C0B0 */ 0x76543210UL,
  /*    C0B4 */ 0x00000A98UL,
  /*    C0B8 */ 0x00000000UL,
  0x0104C0CCUL, 0x00000066UL,
  /*    C0D0 */ 0x00000000UL,
  /*    C0D4 */ 0x000A0001UL,
  /*    C0D8 */ 0x00280001UL,
  0x0101C100UL, 0x00002800UL,
  0x0102C110UL, 0x00010100UL,
  /*    C114 */ 0x000000C8UL,
  0x02010008UL, 0x00000744UL,
  0x02010018UL, 0x00000000UL,
  0x02010020UL, 0x0000A001UL,
  0x02024040UL, 0x50F00000UL,
  /*    4044 */ 0x00000000UL,
  0x0209404CUL, 0x04000000UL,
  /*    4050 */ 0x0082C00FUL,
  /*    4054 */ 0x20000000UL,
  /*    4058 */ 0x00000000UL,
  /*    405C */ 0x03000000UL,
  /*    4060 */ 0x40001000UL,
  /*    4064 */ 0x00000000UL,
  /*    4068 */ 0x00FC0999UL,
  /*    406C */ 0x00000840UL,
  0x02194074UL, 0x00140012UL,
  /*    4078 */ 0x0000B16FUL,
  /*    407C */ 0x00000000UL,
  /*    4080 */ 0x00000D79UL,
  /*    4084 */ 0x00000000UL,
  /*    4088 */ 0x003A03D9UL,
  /*    408C */ 0x62050000UL,
  /*    4090 */ 0x00000000UL,
  /*    4094 */ 0x22140A04UL,
  /*    4098 */ 0x4F4A4132UL,
  /*    409C */ 0x00000000UL,
  /*    40A0 */ 0x00000000UL,
  /*    40A4 */ 0x00000000UL,
  /*    40A8 */ 0x00000000UL,
  /*    40AC */ 0x00000000UL,
  /*    40B0 */ 0x00000000UL,
  /*    40B4 */ 0x00000000UL,
  /*    40B8 */ 0x00000000UL,
  /*    40BC */ 0x00000000UL,
  /*    40C0 */ 0x00000000UL,
  /*    40C4 */ 0x00000000UL,
  /*    40C8 */ 0x00000000UL,
  /*    40CC */ 0x00000000UL,
  /*    40D0 */ 0x00000000UL,
  /*    40D4 */ 0x00000000UL,
  0x120140E0UL, 0x000001F8UL,
  0x320140E0UL, 0x00000201UL,
  0x02074120UL, 0x00000000UL,
  /*    4124 */ 0x078304FFUL,
  /*    4128 */ 0x3AC81388UL,
  /*    412C */ 0x0C6606FFUL,
  /*    4130 */ 0x078304FFUL,
  /*    4134 */ 0x03FF1388UL,
  /*    4138 */ 0xF00A20BCUL,
  0x02054140UL, 0x409E5D01UL,
  /*    4144 */ 0x55F68D00UL,
  /*    4148 */ 0x41C829A1UL,
  /*    414C */ 0x00403B89UL,
  /*    4150 */ 0x800003C0UL,
  0x02024158UL, 0x00000000UL,
  /*    415C */ 0x0000FDFFUL,
  0x02014164UL, 0x0000010CUL,
  0x020B416CUL, 0x40000000UL,
  /*    4170 */ 0x00000000UL,
  /*    4174 */ 0x00000000UL,
  /*    4178 */ 0x00000000UL,
  /*    417C */ 0x00000000UL,
  /*    4180 */ 0x00000000UL,
  /*    4184 */ 0x00000101UL,
  /*    4188 */ 0x00000000UL,
  /*    418C */ 0x00000000UL,
  /*    4190 */ 0x00000000UL,
  /*    4194 */ 0x00000000UL,
  0x020141A4UL, 0x00000000UL,
  0x020C41B0UL, 0x00000000UL,
  /*    41B4 */ 0xC03795E0UL,
  /*    41B8 */ 0x00000000UL,
  /*    41BC */ 0x00000000UL,
  /*    41C0 */ 0x003C0000UL,
  /*    41C4 */ 0x0006AAAAUL,
  /*    41C8 */ 0x00000000UL,
  /*    41CC */ 0x00000000UL,
  /*    41D0 */ 0x55555555UL,
  /*    41D4 */ 0x805400E5UL,
  /*    41D8 */ 0x00220004UL,
  /*    41DC */ 0x00000000UL,
  0x02054224UL, 0x00000040UL,
  /*    4228 */ 0x00000000UL,
  /*    422C */ 0x00000000UL,
  /*    4230 */ 0x00000000UL,
  /*    4234 */ 0x00000000UL,
  0x0201423CUL, 0x00000000UL,
  0x02034244UL, 0x90000014UL,
  /*    4248 */ 0x00000000UL,
  /*    424C */ 0x04030008UL,
  0x020F4330UL, 0x00000000UL,
  /*    4334 */ 0x00000000UL,
  /*    4338 */ 0x00000000UL,
  /*    433C */ 0x00000000UL,
  /*    4340 */ 0x00000000UL,
  /*    4344 */ 0x00000000UL,
  /*    4348 */ 0x00000000UL,
  /*    434C */ 0x00000000UL,
  /*    4350 */ 0x00000000UL,
  /*    4354 */ 0x00000000UL,
  /*    4358 */ 0x00000000UL,
  /*    435C */ 0x38000000UL,
  /*    4360 */ 0x00000000UL,
  /*    4364 */ 0x00000000UL,
  /*    4368 */ 0x58FF0000UL,
  0x02014400UL, 0x00000040UL,
  0x02018010UL, 0x00000003UL,
  0x02028038UL, 0x001042F4UL,
  /*    803C */ 0x00000003UL,
  0x0203809CUL, 0x00000000UL,
  /*    80A0 */ 0x0003B870UL,
  /*    80A4 */ 0x000000D0UL,
  0x120180A8UL, 0x000001F6UL,
  0x320180A8UL, 0x01014201UL,
  0x120180ACUL, 0x000001F6UL,
  0x320180ACUL, 0x00FD3E01UL,
  0x020280B0UL, 0x02000300UL,
  /*    80B4 */ 0x01000037UL,
  0x03030098UL, 0x00000000UL,
  /*    009C */ 0x04000C00UL,
  /*    00A0 */ 0x0000044CUL,
  0x030200D8UL, 0xAA400005UL,
  /*    00DC */ 0x00000188UL,
  0x130100ECUL, 0x00000FE0UL,
  0x330100ECUL, 0x5351200DUL,
  0x030100F0UL, 0x0000052BUL,
  0x03010100UL, 0x00000110UL,
  0x13010104UL, 0x00000000UL,
  0x33010104UL, 0x00000110UL,
  0x13010110UL, 0x000FFF00UL,
  0x33010110UL, 0x42000002UL,
  0x1301012CUL, 0x001FFC00UL,
  0x3301012CUL, 0x008002E9UL,
  0x03010140UL, 0x0000003FUL,
  0x13010150UL, 0x0001C000UL,
  0x33010150UL, 0x00A200C2UL,
  0x03010168UL, 0x00060010UL,
  0x1301016CUL, 0x00200820UL,
  0x3301016CUL, 0x00020000UL,
  0x03010174UL, 0x0C1B8169UL,
  0x13010178UL, 0x001C0000UL,
  0x33010178UL, 0xCFE00440UL,
  0x13010180UL, 0x00000779UL,
  0x33010180UL, 0x00000002UL,
  0x03020188UL, 0x00000050UL,
  /*    018C */ 0x00000000UL,
  0x030101E4UL, 0x00045220UL,
  0x03010208UL, 0x00200008UL,
  0x03010210UL, 0x00001100UL,
  0x13010400UL, 0x00000008UL,
  0x05120100UL, 0x0000000DUL,
  /*    0104 */ 0x08082000UL,
  /*    0108 */ 0x00000000UL,
  /*    010C */ 0x15928C1DUL,
  /*    0110 */ 0x003C1138UL,
  /*    0114 */ 0x0075CDB4UL,
  /*    0118 */ 0x004812ACUL,
  /*    011C */ 0x0DE3FF6FUL,
  /*    0120 */ 0x02ED3940UL,
  /*    0124 */ 0x31122518UL,
  /*    0128 */ 0x365E63DEUL,
  /*    012C */ 0x00076FBFUL,
  /*    0130 */ 0x0016EA6FUL,
  /*    0134 */ 0x00CE30E5UL,
  /*    0138 */ 0x0494844BUL,
  /*    013C */ 0x0ED9B9B2UL,
  /*    0140 */ 0x24A91F5AUL,
  /*    0144 */ 0x80000000UL,
  0x05010180UL, 0x0051AC80UL,
  0x05020200UL, 0x00145463UL,
  /*    0204 */ 0x00000000UL,
  0x05124100UL, 0x00000000UL,
  /*    4104 */ 0x00000000UL,
  /*    4108 */ 0x00000000UL,
  /*    410C */ 0x00000000UL,
  /*    4110 */ 0x00000000UL,
  /*    4114 */ 0x00000000UL,
  /*    4118 */ 0x00000000UL,
  /*    411C */ 0x00000000UL,
  /*    4120 */ 0x00000000UL,
  /*    4124 */ 0x00000000UL,
  /*    4128 */ 0x00000000UL,
  /*    412C */ 0x00000000UL,
  /*    4130 */ 0x00000000UL,
  /*    4134 */ 0x00000000UL,
  /*    4138 */ 0x00000000UL,
  /*    413C */ 0x00000000UL,
  /*    4140 */ 0x00000000UL,
  /*    4144 */ 0x00000000UL,
  0x05014154UL, 0x00000000UL,
  0x05014180UL, 0x00000000UL,
  0x05024200UL, 0x00000030UL,
  /*    4204 */ 0x00000000UL,
  0x050B8100UL, 0x00000000UL,
  /*    8104 */ 0x00000000UL,
  /*    8108 */ 0x00000000UL,
  /*    810C */ 0x00000000UL,
  /*    8110 */ 0x00000000UL,
  /*    8114 */ 0x00000000UL,
  /*    8118 */ 0x00000000UL,
  /*    811C */ 0x00000000UL,
  /*    8120 */ 0x00000000UL,
  /*    8124 */ 0x00000000UL,
  /*    8128 */ 0x00000000UL,
  0x06016FF4UL, 0x00000004UL,
  0x06016FFCUL, (uint32_t) &phyInfo,
  0x0701FC00UL, 0x00000000UL,
  0x0701FC00UL, 0x00000000UL,
  0x0701FC00UL, 0x00000000UL,
  0x0701FC00UL, 0x00000000UL,
  0x0702FC00UL, 0x00000000UL,
  /*    FC04 */ 0x00000000UL,
  0x0701FC04UL, 0x00000000UL,
  0x0701FC04UL, 0x00000000UL,
  0x0701FC04UL, 0x00000000UL,
  0x0702FC04UL, 0x00000000UL,
  /*    FC08 */ 0x00000000UL,
  0x0701FC08UL, 0x00000000UL,
  0x0701FC08UL, 0x00000000UL,
  0x0701FC08UL, 0x00000000UL,
  0x0704FC08UL, 0x00000000UL,
  /*    FC0C */ 0x00000000UL,
  /*    FC10 */ 0x00000000UL,
  /*    FC14 */ 0x00000014UL,
  0x0702FC14UL, 0x00000014UL,
  /*    FC18 */ 0x00000000UL,
  0x0702FC18UL, 0x00000000UL,
  /*    FC1C */ 0x00000000UL,
  0x0702FC1CUL, 0x00000000UL,
  /*    FC20 */ 0x00000000UL,
  0x0701FC20UL, 0x00000000UL,
  0x0701FC30UL, 0x00000000UL,
  0x0701FC30UL, 0x00000000UL,
  0x0702FC30UL, 0x00000000UL,
  /*    FC34 */ 0x00000000UL,
  0x0702FC34UL, 0x00000000UL,
  /*    FC38 */ 0x00000000UL,
  0x0702FC38UL, 0x00000000UL,
  /*    FC3C */ 0x00000000UL,
  0x0702FC3CUL, 0x00000000UL,
  /*    FC40 */ 0x00000000UL,
  0x0702FC40UL, 0x00000000UL,
  /*    FC44 */ 0x00000000UL,
  0x0702FC44UL, 0x00000000UL,
  /*    FC48 */ 0x00000000UL,
  0x0702FC48UL, 0x00000000UL,
  /*    FC4C */ 0x00000000UL,
  0x0702FC4CUL, 0x00000000UL,
  /*    FC50 */ 0x00000000UL,
  0x0702FC50UL, 0x00000000UL,
  /*    FC54 */ 0x00000000UL,
  0x0702FC54UL, 0x00000000UL,
  /*    FC58 */ 0x00000080UL,
  0x0702FC58UL, 0x00000080UL,
  /*    FC5C */ 0x00000000UL,
  0x0702FC5CUL, 0x00000000UL,
  /*    FC60 */ 0x00000000UL,
  0x0702FC60UL, 0x00000000UL,
  /*    FC64 */ 0x00000000UL,
  0x0706FC64UL, 0x00000000UL,
  /*    FC68 */ 0x00000000UL,
  /*    FC6C */ 0x00000000UL,
  /*    FC70 */ 0x00000000UL,
  /*    FC74 */ 0x00000000UL,
  /*    FC78 */ 0x00000000UL,
  0x071AFC80UL, 0x10001000UL,
  /*    FC84 */ 0x00000080UL,
  /*    FC88 */ 0x00000000UL,
  /*    FC8C */ 0x00000000UL,
  /*    FC90 */ 0x00000000UL,
  /*    FC94 */ 0x00000000UL,
  /*    FC98 */ 0x00000000UL,
  /*    FC9C */ 0x00000000UL,
  /*    FCA0 */ 0x00000000UL,
  /*    FCA4 */ 0x00000000UL,
  /*    FCA8 */ 0x00000000UL,
  /*    FCAC */ 0x00000000UL,
  /*    FCB0 */ 0x00000000UL,
  /*    FCB4 */ 0x00000000UL,
  /*    FCB8 */ 0x00000000UL,
  /*    FCBC */ 0x00000000UL,
  /*    FCC0 */ 0x00000000UL,
  /*    FCC4 */ 0x00000000UL,
  /*    FCC8 */ 0x00000000UL,
  /*    FCCC */ 0x00000000UL,
  /*    FCD0 */ 0x00000000UL,
  /*    FCD4 */ 0x00000000UL,
  /*    FCD8 */ 0x00000000UL,
  /*    FCDC */ 0x00000000UL,
  /*    FCE0 */ 0x00000000UL,
  /*    FCE4 */ 0x00000000UL,
  0xFFFFFFFFUL,
};

const RAIL_ChannelConfigEntry_t Protocol_Configuration_channels[] = {
  {
    .phyConfigDeltaAdd = NULL,
    .baseFrequency = 868000000,
    .channelSpacing = 1000000,
    .physicalChannelOffset = 0,
    .channelNumberStart = 0,
    .channelNumberEnd = 20,
    .maxPower = RAIL_TX_POWER_MAX,
    .attr = &channelConfigEntryAttr,
#ifdef RADIO_CONFIG_ENABLE_CONC_PHY
    .entryType = 0,
#endif
#ifdef RADIO_CONFIG_ENABLE_STACK_INFO
    .stackInfo = NULL,
#endif
    .alternatePhy = NULL,
  },
};

const RAIL_ChannelConfig_t Protocol_Configuration_channelConfig = {
  .phyConfigBase = Protocol_Configuration_modemConfigBase,
  .phyConfigDeltaSubtract = NULL,
  .configs = Protocol_Configuration_channels,
  .length = 1U,
  .signature = 0UL,
  .xtalFrequencyHz = 39000000UL,
};

const RAIL_ChannelConfig_t *channelConfigs[] = {
  &Protocol_Configuration_channelConfig,
  NULL
};

uint32_t protocolAccelerationBuffer[723];
