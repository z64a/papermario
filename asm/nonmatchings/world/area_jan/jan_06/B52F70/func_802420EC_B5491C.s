.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_802420EC_B5491C
/* B5491C 802420EC 27BDFFB0 */  addiu     $sp, $sp, -0x50
/* B54920 802420F0 AFB20038 */  sw        $s2, 0x38($sp)
/* B54924 802420F4 0080902D */  daddu     $s2, $a0, $zero
/* B54928 802420F8 AFBF0048 */  sw        $ra, 0x48($sp)
/* B5492C 802420FC AFB50044 */  sw        $s5, 0x44($sp)
/* B54930 80242100 AFB40040 */  sw        $s4, 0x40($sp)
/* B54934 80242104 AFB3003C */  sw        $s3, 0x3c($sp)
/* B54938 80242108 AFB10034 */  sw        $s1, 0x34($sp)
/* B5493C 8024210C AFB00030 */  sw        $s0, 0x30($sp)
/* B54940 80242110 8E510148 */  lw        $s1, 0x148($s2)
/* B54944 80242114 86240008 */  lh        $a0, 8($s1)
/* B54948 80242118 0C00EABB */  jal       get_npc_unsafe
/* B5494C 8024211C 00A0802D */   daddu    $s0, $a1, $zero
/* B54950 80242120 8E43000C */  lw        $v1, 0xc($s2)
/* B54954 80242124 0240202D */  daddu     $a0, $s2, $zero
/* B54958 80242128 8C650000 */  lw        $a1, ($v1)
/* B5495C 8024212C 0C0B1EAF */  jal       get_variable
/* B54960 80242130 0040A82D */   daddu    $s5, $v0, $zero
/* B54964 80242134 AFA00010 */  sw        $zero, 0x10($sp)
/* B54968 80242138 8E2300D0 */  lw        $v1, 0xd0($s1)
/* B5496C 8024213C 8C630030 */  lw        $v1, 0x30($v1)
/* B54970 80242140 AFA30014 */  sw        $v1, 0x14($sp)
/* B54974 80242144 8E2300D0 */  lw        $v1, 0xd0($s1)
/* B54978 80242148 8C63001C */  lw        $v1, 0x1c($v1)
/* B5497C 8024214C AFA30018 */  sw        $v1, 0x18($sp)
/* B54980 80242150 8E2300D0 */  lw        $v1, 0xd0($s1)
/* B54984 80242154 8C630024 */  lw        $v1, 0x24($v1)
/* B54988 80242158 AFA3001C */  sw        $v1, 0x1c($sp)
/* B5498C 8024215C 8E2300D0 */  lw        $v1, 0xd0($s1)
/* B54990 80242160 8C630028 */  lw        $v1, 0x28($v1)
/* B54994 80242164 27B40010 */  addiu     $s4, $sp, 0x10
/* B54998 80242168 AFA30020 */  sw        $v1, 0x20($sp)
/* B5499C 8024216C 8E2300D0 */  lw        $v1, 0xd0($s1)
/* B549A0 80242170 3C014282 */  lui       $at, 0x4282
/* B549A4 80242174 44810000 */  mtc1      $at, $f0
/* B549A8 80242178 8C63002C */  lw        $v1, 0x2c($v1)
/* B549AC 8024217C 0040982D */  daddu     $s3, $v0, $zero
/* B549B0 80242180 E7A00028 */  swc1      $f0, 0x28($sp)
/* B549B4 80242184 A7A0002C */  sh        $zero, 0x2c($sp)
/* B549B8 80242188 16000005 */  bnez      $s0, .L802421A0
/* B549BC 8024218C AFA30024 */   sw       $v1, 0x24($sp)
/* B549C0 80242190 8E2200B0 */  lw        $v0, 0xb0($s1)
/* B549C4 80242194 30420004 */  andi      $v0, $v0, 4
/* B549C8 80242198 10400020 */  beqz      $v0, .L8024221C
/* B549CC 8024219C 00000000 */   nop      
.L802421A0:
/* B549D0 802421A0 2404F7FF */  addiu     $a0, $zero, -0x801
/* B549D4 802421A4 AE400070 */  sw        $zero, 0x70($s2)
/* B549D8 802421A8 A6A0008E */  sh        $zero, 0x8e($s5)
/* B549DC 802421AC 8E2200CC */  lw        $v0, 0xcc($s1)
/* B549E0 802421B0 8EA30000 */  lw        $v1, ($s5)
/* B549E4 802421B4 8C420000 */  lw        $v0, ($v0)
/* B549E8 802421B8 00641824 */  and       $v1, $v1, $a0
/* B549EC 802421BC AEA30000 */  sw        $v1, ($s5)
/* B549F0 802421C0 AEA20028 */  sw        $v0, 0x28($s5)
/* B549F4 802421C4 8E2200D0 */  lw        $v0, 0xd0($s1)
/* B549F8 802421C8 8C420034 */  lw        $v0, 0x34($v0)
/* B549FC 802421CC 54400005 */  bnel      $v0, $zero, .L802421E4
/* B54A00 802421D0 2402FDFF */   addiu    $v0, $zero, -0x201
/* B54A04 802421D4 34620200 */  ori       $v0, $v1, 0x200
/* B54A08 802421D8 2403FFF7 */  addiu     $v1, $zero, -9
/* B54A0C 802421DC 0809087B */  j         .L802421EC
/* B54A10 802421E0 00431024 */   and      $v0, $v0, $v1
.L802421E4:
/* B54A14 802421E4 00621024 */  and       $v0, $v1, $v0
/* B54A18 802421E8 34420008 */  ori       $v0, $v0, 8
.L802421EC:
/* B54A1C 802421EC AEA20000 */  sw        $v0, ($s5)
/* B54A20 802421F0 8E2200B0 */  lw        $v0, 0xb0($s1)
/* B54A24 802421F4 30420004 */  andi      $v0, $v0, 4
/* B54A28 802421F8 10400007 */  beqz      $v0, .L80242218
/* B54A2C 802421FC 24020063 */   addiu    $v0, $zero, 0x63
/* B54A30 80242200 AE420070 */  sw        $v0, 0x70($s2)
/* B54A34 80242204 AE400074 */  sw        $zero, 0x74($s2)
/* B54A38 80242208 8E2200B0 */  lw        $v0, 0xb0($s1)
/* B54A3C 8024220C 2403FFFB */  addiu     $v1, $zero, -5
/* B54A40 80242210 00431024 */  and       $v0, $v0, $v1
/* B54A44 80242214 AE2200B0 */  sw        $v0, 0xb0($s1)
.L80242218:
/* B54A48 80242218 AE20006C */  sw        $zero, 0x6c($s1)
.L8024221C:
/* B54A4C 8024221C 8E420070 */  lw        $v0, 0x70($s2)
/* B54A50 80242220 2842001E */  slti      $v0, $v0, 0x1e
/* B54A54 80242224 10400009 */  beqz      $v0, .L8024224C
/* B54A58 80242228 00000000 */   nop      
/* B54A5C 8024222C 8E22006C */  lw        $v0, 0x6c($s1)
/* B54A60 80242230 14400006 */  bnez      $v0, .L8024224C
/* B54A64 80242234 00000000 */   nop      
/* B54A68 80242238 0C090689 */  jal       func_80241A24_B54254
/* B54A6C 8024223C 0240202D */   daddu    $a0, $s2, $zero
/* B54A70 80242240 10400002 */  beqz      $v0, .L8024224C
/* B54A74 80242244 2402001E */   addiu    $v0, $zero, 0x1e
/* B54A78 80242248 AE420070 */  sw        $v0, 0x70($s2)
.L8024224C:
/* B54A7C 8024224C 8E430070 */  lw        $v1, 0x70($s2)
/* B54A80 80242250 2C620064 */  sltiu     $v0, $v1, 0x64
/* B54A84 80242254 10400048 */  beqz      $v0, .L80242378
/* B54A88 80242258 00031080 */   sll      $v0, $v1, 2
/* B54A8C 8024225C 3C018024 */  lui       $at, %hi(D_80246EA8)
/* B54A90 80242260 00220821 */  addu      $at, $at, $v0
/* B54A94 80242264 8C226EA8 */  lw        $v0, %lo(D_80246EA8)($at)
/* B54A98 80242268 00400008 */  jr        $v0
/* B54A9C 8024226C 00000000 */   nop      
/* B54AA0 80242270 0240202D */  daddu     $a0, $s2, $zero
/* B54AA4 80242274 0260282D */  daddu     $a1, $s3, $zero
/* B54AA8 80242278 0C012568 */  jal       func_800495A0
/* B54AAC 8024227C 0280302D */   daddu    $a2, $s4, $zero
/* B54AB0 80242280 0240202D */  daddu     $a0, $s2, $zero
/* B54AB4 80242284 0260282D */  daddu     $a1, $s3, $zero
/* B54AB8 80242288 0C0125AE */  jal       func_800496B8
/* B54ABC 8024228C 0280302D */   daddu    $a2, $s4, $zero
/* B54AC0 80242290 080908DE */  j         .L80242378
/* B54AC4 80242294 00000000 */   nop      
/* B54AC8 80242298 0240202D */  daddu     $a0, $s2, $zero
/* B54ACC 8024229C 0260282D */  daddu     $a1, $s3, $zero
/* B54AD0 802422A0 0C090582 */  jal       func_80241608_B53E38
/* B54AD4 802422A4 0280302D */   daddu    $a2, $s4, $zero
/* B54AD8 802422A8 0240202D */  daddu     $a0, $s2, $zero
/* B54ADC 802422AC 0260282D */  daddu     $a1, $s3, $zero
/* B54AE0 802422B0 0C090596 */  jal       func_80241658_B53E88
/* B54AE4 802422B4 0280302D */   daddu    $a2, $s4, $zero
/* B54AE8 802422B8 080908DE */  j         .L80242378
/* B54AEC 802422BC 00000000 */   nop      
/* B54AF0 802422C0 0240202D */  daddu     $a0, $s2, $zero
/* B54AF4 802422C4 0260282D */  daddu     $a1, $s3, $zero
/* B54AF8 802422C8 0C01278F */  jal       func_80049E3C
/* B54AFC 802422CC 0280302D */   daddu    $a2, $s4, $zero
/* B54B00 802422D0 0240202D */  daddu     $a0, $s2, $zero
/* B54B04 802422D4 0260282D */  daddu     $a1, $s3, $zero
/* B54B08 802422D8 0C0127B3 */  jal       func_80049ECC
/* B54B0C 802422DC 0280302D */   daddu    $a2, $s4, $zero
/* B54B10 802422E0 080908DE */  j         .L80242378
/* B54B14 802422E4 00000000 */   nop      
/* B54B18 802422E8 0240202D */  daddu     $a0, $s2, $zero
/* B54B1C 802422EC 0260282D */  daddu     $a1, $s3, $zero
/* B54B20 802422F0 0C0127DF */  jal       func_80049F7C
/* B54B24 802422F4 0280302D */   daddu    $a2, $s4, $zero
/* B54B28 802422F8 0240202D */  daddu     $a0, $s2, $zero
/* B54B2C 802422FC 0260282D */  daddu     $a1, $s3, $zero
/* B54B30 80242300 0C012849 */  jal       func_8004A124
/* B54B34 80242304 0280302D */   daddu    $a2, $s4, $zero
/* B54B38 80242308 080908DE */  j         .L80242378
/* B54B3C 8024230C 00000000 */   nop      
/* B54B40 80242310 0240202D */  daddu     $a0, $s2, $zero
/* B54B44 80242314 0260282D */  daddu     $a1, $s3, $zero
/* B54B48 80242318 0C0128FA */  jal       func_8004A3E8
/* B54B4C 8024231C 0280302D */   daddu    $a2, $s4, $zero
/* B54B50 80242320 080908DE */  j         .L80242378
/* B54B54 80242324 00000000 */   nop      
/* B54B58 80242328 0C090607 */  jal       func_8024181C_B5404C
/* B54B5C 8024232C 0240202D */   daddu    $a0, $s2, $zero
/* B54B60 80242330 0C090622 */  jal       func_80241888_B540B8
/* B54B64 80242334 0240202D */   daddu    $a0, $s2, $zero
/* B54B68 80242338 8E430070 */  lw        $v1, 0x70($s2)
/* B54B6C 8024233C 24020020 */  addiu     $v0, $zero, 0x20
/* B54B70 80242340 1462000D */  bne       $v1, $v0, .L80242378
/* B54B74 80242344 00000000 */   nop      
/* B54B78 80242348 0C09063E */  jal       func_802418F8_B54128
/* B54B7C 8024234C 0240202D */   daddu    $a0, $s2, $zero
/* B54B80 80242350 8E430070 */  lw        $v1, 0x70($s2)
/* B54B84 80242354 24020021 */  addiu     $v0, $zero, 0x21
/* B54B88 80242358 14620007 */  bne       $v1, $v0, .L80242378
/* B54B8C 8024235C 00000000 */   nop      
/* B54B90 80242360 0C090674 */  jal       func_802419D0_B54200
/* B54B94 80242364 0240202D */   daddu    $a0, $s2, $zero
/* B54B98 80242368 080908DE */  j         .L80242378
/* B54B9C 8024236C 00000000 */   nop      
/* B54BA0 80242370 0C0129CF */  jal       func_8004A73C
/* B54BA4 80242374 0240202D */   daddu    $a0, $s2, $zero
.L80242378:
/* B54BA8 80242378 8FBF0048 */  lw        $ra, 0x48($sp)
/* B54BAC 8024237C 8FB50044 */  lw        $s5, 0x44($sp)
/* B54BB0 80242380 8FB40040 */  lw        $s4, 0x40($sp)
/* B54BB4 80242384 8FB3003C */  lw        $s3, 0x3c($sp)
/* B54BB8 80242388 8FB20038 */  lw        $s2, 0x38($sp)
/* B54BBC 8024238C 8FB10034 */  lw        $s1, 0x34($sp)
/* B54BC0 80242390 8FB00030 */  lw        $s0, 0x30($sp)
/* B54BC4 80242394 0000102D */  daddu     $v0, $zero, $zero
/* B54BC8 80242398 03E00008 */  jr        $ra
/* B54BCC 8024239C 27BD0050 */   addiu    $sp, $sp, 0x50
