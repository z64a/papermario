.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80240C44_ABBED4
/* ABBED4 80240C44 27BDFF98 */  addiu     $sp, $sp, -0x68
/* ABBED8 80240C48 AFB40058 */  sw        $s4, 0x58($sp)
/* ABBEDC 80240C4C 0080A02D */  daddu     $s4, $a0, $zero
/* ABBEE0 80240C50 AFBF0060 */  sw        $ra, 0x60($sp)
/* ABBEE4 80240C54 AFB5005C */  sw        $s5, 0x5c($sp)
/* ABBEE8 80240C58 AFB30054 */  sw        $s3, 0x54($sp)
/* ABBEEC 80240C5C AFB20050 */  sw        $s2, 0x50($sp)
/* ABBEF0 80240C60 AFB1004C */  sw        $s1, 0x4c($sp)
/* ABBEF4 80240C64 AFB00048 */  sw        $s0, 0x48($sp)
/* ABBEF8 80240C68 8E910148 */  lw        $s1, 0x148($s4)
/* ABBEFC 80240C6C 86240008 */  lh        $a0, 8($s1)
/* ABBF00 80240C70 0C00EABB */  jal       get_npc_unsafe
/* ABBF04 80240C74 00A0802D */   daddu    $s0, $a1, $zero
/* ABBF08 80240C78 8E83000C */  lw        $v1, 0xc($s4)
/* ABBF0C 80240C7C 0280202D */  daddu     $a0, $s4, $zero
/* ABBF10 80240C80 8C650000 */  lw        $a1, ($v1)
/* ABBF14 80240C84 0C0B1EAF */  jal       get_variable
/* ABBF18 80240C88 0040902D */   daddu    $s2, $v0, $zero
/* ABBF1C 80240C8C AFA00018 */  sw        $zero, 0x18($sp)
/* ABBF20 80240C90 8E2300D0 */  lw        $v1, 0xd0($s1)
/* ABBF24 80240C94 8C630094 */  lw        $v1, 0x94($v1)
/* ABBF28 80240C98 AFA3001C */  sw        $v1, 0x1c($sp)
/* ABBF2C 80240C9C 8E2300D0 */  lw        $v1, 0xd0($s1)
/* ABBF30 80240CA0 8C630080 */  lw        $v1, 0x80($v1)
/* ABBF34 80240CA4 AFA30020 */  sw        $v1, 0x20($sp)
/* ABBF38 80240CA8 8E2300D0 */  lw        $v1, 0xd0($s1)
/* ABBF3C 80240CAC 8C630088 */  lw        $v1, 0x88($v1)
/* ABBF40 80240CB0 AFA30024 */  sw        $v1, 0x24($sp)
/* ABBF44 80240CB4 8E2300D0 */  lw        $v1, 0xd0($s1)
/* ABBF48 80240CB8 8C63008C */  lw        $v1, 0x8c($v1)
/* ABBF4C 80240CBC 27B50018 */  addiu     $s5, $sp, 0x18
/* ABBF50 80240CC0 AFA30028 */  sw        $v1, 0x28($sp)
/* ABBF54 80240CC4 8E2300D0 */  lw        $v1, 0xd0($s1)
/* ABBF58 80240CC8 3C014282 */  lui       $at, 0x4282
/* ABBF5C 80240CCC 44810000 */  mtc1      $at, $f0
/* ABBF60 80240CD0 8C630090 */  lw        $v1, 0x90($v1)
/* ABBF64 80240CD4 0040982D */  daddu     $s3, $v0, $zero
/* ABBF68 80240CD8 E7A00030 */  swc1      $f0, 0x30($sp)
/* ABBF6C 80240CDC A7A00034 */  sh        $zero, 0x34($sp)
/* ABBF70 80240CE0 16000005 */  bnez      $s0, .L80240CF8
/* ABBF74 80240CE4 AFA3002C */   sw       $v1, 0x2c($sp)
/* ABBF78 80240CE8 8E2200B0 */  lw        $v0, 0xb0($s1)
/* ABBF7C 80240CEC 30420004 */  andi      $v0, $v0, 4
/* ABBF80 80240CF0 10400044 */  beqz      $v0, .L80240E04
/* ABBF84 80240CF4 00000000 */   nop      
.L80240CF8:
/* ABBF88 80240CF8 2404F7FF */  addiu     $a0, $zero, -0x801
/* ABBF8C 80240CFC AE800070 */  sw        $zero, 0x70($s4)
/* ABBF90 80240D00 A640008E */  sh        $zero, 0x8e($s2)
/* ABBF94 80240D04 8E2200CC */  lw        $v0, 0xcc($s1)
/* ABBF98 80240D08 8E430000 */  lw        $v1, ($s2)
/* ABBF9C 80240D0C 8C420000 */  lw        $v0, ($v0)
/* ABBFA0 80240D10 00641824 */  and       $v1, $v1, $a0
/* ABBFA4 80240D14 AE430000 */  sw        $v1, ($s2)
/* ABBFA8 80240D18 AE420028 */  sw        $v0, 0x28($s2)
/* ABBFAC 80240D1C 8E2200D0 */  lw        $v0, 0xd0($s1)
/* ABBFB0 80240D20 8C420098 */  lw        $v0, 0x98($v0)
/* ABBFB4 80240D24 54400005 */  bnel      $v0, $zero, .L80240D3C
/* ABBFB8 80240D28 2402FDFF */   addiu    $v0, $zero, -0x201
/* ABBFBC 80240D2C 34620200 */  ori       $v0, $v1, 0x200
/* ABBFC0 80240D30 2403FFF7 */  addiu     $v1, $zero, -9
/* ABBFC4 80240D34 08090351 */  j         .L80240D44
/* ABBFC8 80240D38 00431024 */   and      $v0, $v0, $v1
.L80240D3C:
/* ABBFCC 80240D3C 00621024 */  and       $v0, $v1, $v0
/* ABBFD0 80240D40 34420008 */  ori       $v0, $v0, 8
.L80240D44:
/* ABBFD4 80240D44 AE420000 */  sw        $v0, ($s2)
/* ABBFD8 80240D48 8E2200B0 */  lw        $v0, 0xb0($s1)
/* ABBFDC 80240D4C 30420004 */  andi      $v0, $v0, 4
/* ABBFE0 80240D50 10400008 */  beqz      $v0, .L80240D74
/* ABBFE4 80240D54 24020063 */   addiu    $v0, $zero, 0x63
/* ABBFE8 80240D58 AE820070 */  sw        $v0, 0x70($s4)
/* ABBFEC 80240D5C AE800074 */  sw        $zero, 0x74($s4)
/* ABBFF0 80240D60 8E2200B0 */  lw        $v0, 0xb0($s1)
/* ABBFF4 80240D64 2403FFFB */  addiu     $v1, $zero, -5
/* ABBFF8 80240D68 00431024 */  and       $v0, $v0, $v1
/* ABBFFC 80240D6C 08090368 */  j         .L80240DA0
/* ABC000 80240D70 AE2200B0 */   sw       $v0, 0xb0($s1)
.L80240D74:
/* ABC004 80240D74 8E220000 */  lw        $v0, ($s1)
/* ABC008 80240D78 3C034000 */  lui       $v1, 0x4000
/* ABC00C 80240D7C 00431024 */  and       $v0, $v0, $v1
/* ABC010 80240D80 10400007 */  beqz      $v0, .L80240DA0
/* ABC014 80240D84 3C03BFFF */   lui      $v1, 0xbfff
/* ABC018 80240D88 2402000C */  addiu     $v0, $zero, 0xc
/* ABC01C 80240D8C AE820070 */  sw        $v0, 0x70($s4)
/* ABC020 80240D90 8E220000 */  lw        $v0, ($s1)
/* ABC024 80240D94 3463FFFF */  ori       $v1, $v1, 0xffff
/* ABC028 80240D98 00431024 */  and       $v0, $v0, $v1
/* ABC02C 80240D9C AE220000 */  sw        $v0, ($s1)
.L80240DA0:
/* ABC030 80240DA0 27A50038 */  addiu     $a1, $sp, 0x38
/* ABC034 80240DA4 27A6003C */  addiu     $a2, $sp, 0x3c
/* ABC038 80240DA8 C6400038 */  lwc1      $f0, 0x38($s2)
/* ABC03C 80240DAC 864200A8 */  lh        $v0, 0xa8($s2)
/* ABC040 80240DB0 3C0142C8 */  lui       $at, 0x42c8
/* ABC044 80240DB4 44812000 */  mtc1      $at, $f4
/* ABC048 80240DB8 44823000 */  mtc1      $v0, $f6
/* ABC04C 80240DBC 00000000 */  nop       
/* ABC050 80240DC0 468031A0 */  cvt.s.w   $f6, $f6
/* ABC054 80240DC4 27A20044 */  addiu     $v0, $sp, 0x44
/* ABC058 80240DC8 E7A00038 */  swc1      $f0, 0x38($sp)
/* ABC05C 80240DCC C640003C */  lwc1      $f0, 0x3c($s2)
/* ABC060 80240DD0 C6420040 */  lwc1      $f2, 0x40($s2)
/* ABC064 80240DD4 46060000 */  add.s     $f0, $f0, $f6
/* ABC068 80240DD8 E7A40044 */  swc1      $f4, 0x44($sp)
/* ABC06C 80240DDC E7A20040 */  swc1      $f2, 0x40($sp)
/* ABC070 80240DE0 E7A0003C */  swc1      $f0, 0x3c($sp)
/* ABC074 80240DE4 AFA20010 */  sw        $v0, 0x10($sp)
/* ABC078 80240DE8 8E440080 */  lw        $a0, 0x80($s2)
/* ABC07C 80240DEC 0C0372DF */  jal       func_800DCB7C
/* ABC080 80240DF0 27A70040 */   addiu    $a3, $sp, 0x40
/* ABC084 80240DF4 10400003 */  beqz      $v0, .L80240E04
/* ABC088 80240DF8 00000000 */   nop      
/* ABC08C 80240DFC C7A0003C */  lwc1      $f0, 0x3c($sp)
/* ABC090 80240E00 E640003C */  swc1      $f0, 0x3c($s2)
.L80240E04:
/* ABC094 80240E04 8E830070 */  lw        $v1, 0x70($s4)
/* ABC098 80240E08 2C620064 */  sltiu     $v0, $v1, 0x64
/* ABC09C 80240E0C 10400042 */  beqz      $v0, .L80240F18
/* ABC0A0 80240E10 00031080 */   sll      $v0, $v1, 2
/* ABC0A4 80240E14 3C018025 */  lui       $at, %hi(D_80249D40)
/* ABC0A8 80240E18 00220821 */  addu      $at, $at, $v0
/* ABC0AC 80240E1C 8C229D40 */  lw        $v0, %lo(D_80249D40)($at)
/* ABC0B0 80240E20 00400008 */  jr        $v0
/* ABC0B4 80240E24 00000000 */   nop      
/* ABC0B8 80240E28 0280202D */  daddu     $a0, $s4, $zero
/* ABC0BC 80240E2C 0260282D */  daddu     $a1, $s3, $zero
/* ABC0C0 80240E30 0C09002C */  jal       func_802400B0_ABB340
/* ABC0C4 80240E34 02A0302D */   daddu    $a2, $s5, $zero
/* ABC0C8 80240E38 0280202D */  daddu     $a0, $s4, $zero
/* ABC0CC 80240E3C 0260282D */  daddu     $a1, $s3, $zero
/* ABC0D0 80240E40 0C090082 */  jal       func_80240208_ABB498
/* ABC0D4 80240E44 02A0302D */   daddu    $a2, $s5, $zero
/* ABC0D8 80240E48 080903C6 */  j         .L80240F18
/* ABC0DC 80240E4C 00000000 */   nop      
/* ABC0E0 80240E50 0280202D */  daddu     $a0, $s4, $zero
/* ABC0E4 80240E54 0260282D */  daddu     $a1, $s3, $zero
/* ABC0E8 80240E58 0C09012C */  jal       func_802404B0_ABB740
/* ABC0EC 80240E5C 02A0302D */   daddu    $a2, $s5, $zero
/* ABC0F0 80240E60 0280202D */  daddu     $a0, $s4, $zero
/* ABC0F4 80240E64 0260282D */  daddu     $a1, $s3, $zero
/* ABC0F8 80240E68 0C09015C */  jal       func_80240570_ABB800
/* ABC0FC 80240E6C 02A0302D */   daddu    $a2, $s5, $zero
/* ABC100 80240E70 080903C6 */  j         .L80240F18
/* ABC104 80240E74 00000000 */   nop      
/* ABC108 80240E78 0280202D */  daddu     $a0, $s4, $zero
/* ABC10C 80240E7C 0260282D */  daddu     $a1, $s3, $zero
/* ABC110 80240E80 0C0901CB */  jal       func_8024072C_ABB9BC
/* ABC114 80240E84 02A0302D */   daddu    $a2, $s5, $zero
/* ABC118 80240E88 080903C6 */  j         .L80240F18
/* ABC11C 80240E8C 00000000 */   nop      
/* ABC120 80240E90 0280202D */  daddu     $a0, $s4, $zero
/* ABC124 80240E94 0260282D */  daddu     $a1, $s3, $zero
/* ABC128 80240E98 0C0901F8 */  jal       func_802407E0_ABBA70
/* ABC12C 80240E9C 02A0302D */   daddu    $a2, $s5, $zero
/* ABC130 80240EA0 0280202D */  daddu     $a0, $s4, $zero
/* ABC134 80240EA4 0260282D */  daddu     $a1, $s3, $zero
/* ABC138 80240EA8 0C090215 */  jal       func_80240854_ABBAE4
/* ABC13C 80240EAC 02A0302D */   daddu    $a2, $s5, $zero
/* ABC140 80240EB0 080903C6 */  j         .L80240F18
/* ABC144 80240EB4 00000000 */   nop      
/* ABC148 80240EB8 0280202D */  daddu     $a0, $s4, $zero
/* ABC14C 80240EBC 0260282D */  daddu     $a1, $s3, $zero
/* ABC150 80240EC0 0C090233 */  jal       func_802408CC_ABBB5C
/* ABC154 80240EC4 02A0302D */   daddu    $a2, $s5, $zero
/* ABC158 80240EC8 0280202D */  daddu     $a0, $s4, $zero
/* ABC15C 80240ECC 0260282D */  daddu     $a1, $s3, $zero
/* ABC160 80240ED0 0C09027F */  jal       func_802409FC_ABBC8C
/* ABC164 80240ED4 02A0302D */   daddu    $a2, $s5, $zero
/* ABC168 80240ED8 080903C6 */  j         .L80240F18
/* ABC16C 80240EDC 00000000 */   nop      
/* ABC170 80240EE0 0280202D */  daddu     $a0, $s4, $zero
/* ABC174 80240EE4 0260282D */  daddu     $a1, $s3, $zero
/* ABC178 80240EE8 0C0902C7 */  jal       func_80240B1C_ABBDAC
/* ABC17C 80240EEC 02A0302D */   daddu    $a2, $s5, $zero
/* ABC180 80240EF0 080903C6 */  j         .L80240F18
/* ABC184 80240EF4 00000000 */   nop      
/* ABC188 80240EF8 0280202D */  daddu     $a0, $s4, $zero
/* ABC18C 80240EFC 0260282D */  daddu     $a1, $s3, $zero
/* ABC190 80240F00 0C0902E1 */  jal       func_80240B84_ABBE14
/* ABC194 80240F04 02A0302D */   daddu    $a2, $s5, $zero
/* ABC198 80240F08 080903C6 */  j         .L80240F18
/* ABC19C 80240F0C 00000000 */   nop      
/* ABC1A0 80240F10 0C0129CF */  jal       func_8004A73C
/* ABC1A4 80240F14 0280202D */   daddu    $a0, $s4, $zero
.L80240F18:
/* ABC1A8 80240F18 8FBF0060 */  lw        $ra, 0x60($sp)
/* ABC1AC 80240F1C 8FB5005C */  lw        $s5, 0x5c($sp)
/* ABC1B0 80240F20 8FB40058 */  lw        $s4, 0x58($sp)
/* ABC1B4 80240F24 8FB30054 */  lw        $s3, 0x54($sp)
/* ABC1B8 80240F28 8FB20050 */  lw        $s2, 0x50($sp)
/* ABC1BC 80240F2C 8FB1004C */  lw        $s1, 0x4c($sp)
/* ABC1C0 80240F30 8FB00048 */  lw        $s0, 0x48($sp)
/* ABC1C4 80240F34 0000102D */  daddu     $v0, $zero, $zero
/* ABC1C8 80240F38 03E00008 */  jr        $ra
/* ABC1CC 80240F3C 27BD0068 */   addiu    $sp, $sp, 0x68
