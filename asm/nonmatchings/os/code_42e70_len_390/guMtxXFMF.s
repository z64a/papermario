.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel guMtxXFMF
/* 42E70 80067A70 C4820000 */  lwc1      $f2, ($a0)
/* 42E74 80067A74 44853000 */  mtc1      $a1, $f6
/* 42E78 80067A78 00000000 */  nop
/* 42E7C 80067A7C 46061082 */  mul.s     $f2, $f2, $f6
/* 42E80 80067A80 C4840010 */  lwc1      $f4, 0x10($a0)
/* 42E84 80067A84 44864000 */  mtc1      $a2, $f8
/* 42E88 80067A88 00000000 */  nop
/* 42E8C 80067A8C 46082102 */  mul.s     $f4, $f4, $f8
/* 42E90 80067A90 C4800020 */  lwc1      $f0, 0x20($a0)
/* 42E94 80067A94 44875000 */  mtc1      $a3, $f10
/* 42E98 80067A98 00000000 */  nop
/* 42E9C 80067A9C 460A0002 */  mul.s     $f0, $f0, $f10
/* 42EA0 80067AA0 46041080 */  add.s     $f2, $f2, $f4
/* 42EA4 80067AA4 46001080 */  add.s     $f2, $f2, $f0
/* 42EA8 80067AA8 C4800030 */  lwc1      $f0, 0x30($a0)
/* 42EAC 80067AAC 8FA20010 */  lw        $v0, 0x10($sp)
/* 42EB0 80067AB0 8FA30014 */  lw        $v1, 0x14($sp)
/* 42EB4 80067AB4 46001080 */  add.s     $f2, $f2, $f0
/* 42EB8 80067AB8 8FA50018 */  lw        $a1, 0x18($sp)
/* 42EBC 80067ABC E4420000 */  swc1      $f2, ($v0)
/* 42EC0 80067AC0 C4800004 */  lwc1      $f0, 4($a0)
/* 42EC4 80067AC4 46060002 */  mul.s     $f0, $f0, $f6
/* 42EC8 80067AC8 C4840014 */  lwc1      $f4, 0x14($a0)
/* 42ECC 80067ACC 46082102 */  mul.s     $f4, $f4, $f8
/* 42ED0 80067AD0 C4820024 */  lwc1      $f2, 0x24($a0)
/* 42ED4 80067AD4 460A1082 */  mul.s     $f2, $f2, $f10
/* 42ED8 80067AD8 46040000 */  add.s     $f0, $f0, $f4
/* 42EDC 80067ADC 46020000 */  add.s     $f0, $f0, $f2
/* 42EE0 80067AE0 C4820034 */  lwc1      $f2, 0x34($a0)
/* 42EE4 80067AE4 46020000 */  add.s     $f0, $f0, $f2
/* 42EE8 80067AE8 E4600000 */  swc1      $f0, ($v1)
/* 42EEC 80067AEC C4800008 */  lwc1      $f0, 8($a0)
/* 42EF0 80067AF0 46060002 */  mul.s     $f0, $f0, $f6
/* 42EF4 80067AF4 C4840018 */  lwc1      $f4, 0x18($a0)
/* 42EF8 80067AF8 46082102 */  mul.s     $f4, $f4, $f8
/* 42EFC 80067AFC C4820028 */  lwc1      $f2, 0x28($a0)
/* 42F00 80067B00 460A1082 */  mul.s     $f2, $f2, $f10
/* 42F04 80067B04 46040000 */  add.s     $f0, $f0, $f4
/* 42F08 80067B08 46020000 */  add.s     $f0, $f0, $f2
/* 42F0C 80067B0C C4820038 */  lwc1      $f2, 0x38($a0)
/* 42F10 80067B10 46020000 */  add.s     $f0, $f0, $f2
/* 42F14 80067B14 03E00008 */  jr        $ra
/* 42F18 80067B18 E4A00000 */   swc1     $f0, ($a1)
/* 42F1C 80067B1C 00000000 */  nop
