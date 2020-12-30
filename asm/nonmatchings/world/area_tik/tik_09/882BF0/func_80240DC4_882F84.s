.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80240DC4_882F84
/* 882F84 80240DC4 27BDFF90 */  addiu     $sp, $sp, -0x70
/* 882F88 80240DC8 AFB3005C */  sw        $s3, 0x5c($sp)
/* 882F8C 80240DCC 0080982D */  daddu     $s3, $a0, $zero
/* 882F90 80240DD0 AFBF0068 */  sw        $ra, 0x68($sp)
/* 882F94 80240DD4 AFB50064 */  sw        $s5, 0x64($sp)
/* 882F98 80240DD8 AFB40060 */  sw        $s4, 0x60($sp)
/* 882F9C 80240DDC AFB20058 */  sw        $s2, 0x58($sp)
/* 882FA0 80240DE0 AFB10054 */  sw        $s1, 0x54($sp)
/* 882FA4 80240DE4 AFB00050 */  sw        $s0, 0x50($sp)
/* 882FA8 80240DE8 8E710148 */  lw        $s1, 0x148($s3)
/* 882FAC 80240DEC 86240008 */  lh        $a0, 8($s1)
/* 882FB0 80240DF0 0C00EABB */  jal       get_npc_unsafe
/* 882FB4 80240DF4 00A0802D */   daddu    $s0, $a1, $zero
/* 882FB8 80240DF8 8E63000C */  lw        $v1, 0xc($s3)
/* 882FBC 80240DFC 0260202D */  daddu     $a0, $s3, $zero
/* 882FC0 80240E00 8C650000 */  lw        $a1, ($v1)
/* 882FC4 80240E04 0C0B1EAF */  jal       get_variable
/* 882FC8 80240E08 0040902D */   daddu    $s2, $v0, $zero
/* 882FCC 80240E0C AFA00028 */  sw        $zero, 0x28($sp)
/* 882FD0 80240E10 8E2300D0 */  lw        $v1, 0xd0($s1)
/* 882FD4 80240E14 8C630030 */  lw        $v1, 0x30($v1)
/* 882FD8 80240E18 AFA3002C */  sw        $v1, 0x2c($sp)
/* 882FDC 80240E1C 8E2300D0 */  lw        $v1, 0xd0($s1)
/* 882FE0 80240E20 8C63001C */  lw        $v1, 0x1c($v1)
/* 882FE4 80240E24 AFA30030 */  sw        $v1, 0x30($sp)
/* 882FE8 80240E28 8E2300D0 */  lw        $v1, 0xd0($s1)
/* 882FEC 80240E2C 8C630024 */  lw        $v1, 0x24($v1)
/* 882FF0 80240E30 AFA30034 */  sw        $v1, 0x34($sp)
/* 882FF4 80240E34 8E2300D0 */  lw        $v1, 0xd0($s1)
/* 882FF8 80240E38 8C630028 */  lw        $v1, 0x28($v1)
/* 882FFC 80240E3C 27B50028 */  addiu     $s5, $sp, 0x28
/* 883000 80240E40 AFA30038 */  sw        $v1, 0x38($sp)
/* 883004 80240E44 8E2300D0 */  lw        $v1, 0xd0($s1)
/* 883008 80240E48 3C0142C8 */  lui       $at, 0x42c8
/* 88300C 80240E4C 44810000 */  mtc1      $at, $f0
/* 883010 80240E50 8C63002C */  lw        $v1, 0x2c($v1)
/* 883014 80240E54 0040A02D */  daddu     $s4, $v0, $zero
/* 883018 80240E58 E7A00040 */  swc1      $f0, 0x40($sp)
/* 88301C 80240E5C A7A00044 */  sh        $zero, 0x44($sp)
/* 883020 80240E60 12000009 */  beqz      $s0, .L80240E88
/* 883024 80240E64 AFA3003C */   sw       $v1, 0x3c($sp)
/* 883028 80240E68 864300A8 */  lh        $v1, 0xa8($s2)
/* 88302C 80240E6C 8E2200B0 */  lw        $v0, 0xb0($s1)
/* 883030 80240E70 AE20008C */  sw        $zero, 0x8c($s1)
/* 883034 80240E74 A22000B5 */  sb        $zero, 0xb5($s1)
/* 883038 80240E78 34420008 */  ori       $v0, $v0, 8
/* 88303C 80240E7C AE230084 */  sw        $v1, 0x84($s1)
/* 883040 80240E80 080903A6 */  j         .L80240E98
/* 883044 80240E84 AE2200B0 */   sw       $v0, 0xb0($s1)
.L80240E88:
/* 883048 80240E88 8E2200B0 */  lw        $v0, 0xb0($s1)
/* 88304C 80240E8C 30420004 */  andi      $v0, $v0, 4
/* 883050 80240E90 10400047 */  beqz      $v0, .L80240FB0
/* 883054 80240E94 00000000 */   nop
.L80240E98:
/* 883058 80240E98 AE600070 */  sw        $zero, 0x70($s3)
/* 88305C 80240E9C A640008E */  sh        $zero, 0x8e($s2)
/* 883060 80240EA0 8E2300CC */  lw        $v1, 0xcc($s1)
/* 883064 80240EA4 2404F7FF */  addiu     $a0, $zero, -0x801
/* 883068 80240EA8 A2200007 */  sb        $zero, 7($s1)
/* 88306C 80240EAC 8E420000 */  lw        $v0, ($s2)
/* 883070 80240EB0 8C630000 */  lw        $v1, ($v1)
/* 883074 80240EB4 00441024 */  and       $v0, $v0, $a0
/* 883078 80240EB8 AE420000 */  sw        $v0, ($s2)
/* 88307C 80240EBC AE430028 */  sw        $v1, 0x28($s2)
/* 883080 80240EC0 96220086 */  lhu       $v0, 0x86($s1)
/* 883084 80240EC4 A64200A8 */  sh        $v0, 0xa8($s2)
/* 883088 80240EC8 8E2200D0 */  lw        $v0, 0xd0($s1)
/* 88308C 80240ECC AE200090 */  sw        $zero, 0x90($s1)
/* 883090 80240ED0 8C420034 */  lw        $v0, 0x34($v0)
/* 883094 80240ED4 14400006 */  bnez      $v0, .L80240EF0
/* 883098 80240ED8 2403FDFF */   addiu    $v1, $zero, -0x201
/* 88309C 80240EDC 8E420000 */  lw        $v0, ($s2)
/* 8830A0 80240EE0 2403FFF7 */  addiu     $v1, $zero, -9
/* 8830A4 80240EE4 34420200 */  ori       $v0, $v0, 0x200
/* 8830A8 80240EE8 080903BF */  j         .L80240EFC
/* 8830AC 80240EEC 00431024 */   and      $v0, $v0, $v1
.L80240EF0:
/* 8830B0 80240EF0 8E420000 */  lw        $v0, ($s2)
/* 8830B4 80240EF4 00431024 */  and       $v0, $v0, $v1
/* 8830B8 80240EF8 34420008 */  ori       $v0, $v0, 8
.L80240EFC:
/* 8830BC 80240EFC AE420000 */  sw        $v0, ($s2)
/* 8830C0 80240F00 8E2200B0 */  lw        $v0, 0xb0($s1)
/* 8830C4 80240F04 30420004 */  andi      $v0, $v0, 4
/* 8830C8 80240F08 1040001E */  beqz      $v0, .L80240F84
/* 8830CC 80240F0C 24040002 */   addiu    $a0, $zero, 2
/* 8830D0 80240F10 0240282D */  daddu     $a1, $s2, $zero
/* 8830D4 80240F14 0000302D */  daddu     $a2, $zero, $zero
/* 8830D8 80240F18 24020063 */  addiu     $v0, $zero, 0x63
/* 8830DC 80240F1C AE620070 */  sw        $v0, 0x70($s3)
/* 8830E0 80240F20 AE600074 */  sw        $zero, 0x74($s3)
/* 8830E4 80240F24 864300A8 */  lh        $v1, 0xa8($s2)
/* 8830E8 80240F28 3C013F80 */  lui       $at, 0x3f80
/* 8830EC 80240F2C 44810000 */  mtc1      $at, $f0
/* 8830F0 80240F30 3C014000 */  lui       $at, 0x4000
/* 8830F4 80240F34 44811000 */  mtc1      $at, $f2
/* 8830F8 80240F38 3C01C1A0 */  lui       $at, 0xc1a0
/* 8830FC 80240F3C 44812000 */  mtc1      $at, $f4
/* 883100 80240F40 24020028 */  addiu     $v0, $zero, 0x28
/* 883104 80240F44 AFA2001C */  sw        $v0, 0x1c($sp)
/* 883108 80240F48 44833000 */  mtc1      $v1, $f6
/* 88310C 80240F4C 00000000 */  nop
/* 883110 80240F50 468031A0 */  cvt.s.w   $f6, $f6
/* 883114 80240F54 44073000 */  mfc1      $a3, $f6
/* 883118 80240F58 27A20048 */  addiu     $v0, $sp, 0x48
/* 88311C 80240F5C AFA20020 */  sw        $v0, 0x20($sp)
/* 883120 80240F60 E7A00010 */  swc1      $f0, 0x10($sp)
/* 883124 80240F64 E7A20014 */  swc1      $f2, 0x14($sp)
/* 883128 80240F68 0C01BFA4 */  jal       fx_emote
/* 88312C 80240F6C E7A40018 */   swc1     $f4, 0x18($sp)
/* 883130 80240F70 8E2200B0 */  lw        $v0, 0xb0($s1)
/* 883134 80240F74 2403FFFB */  addiu     $v1, $zero, -5
/* 883138 80240F78 00431024 */  and       $v0, $v0, $v1
/* 88313C 80240F7C 080903EC */  j         .L80240FB0
/* 883140 80240F80 AE2200B0 */   sw       $v0, 0xb0($s1)
.L80240F84:
/* 883144 80240F84 8E220000 */  lw        $v0, ($s1)
/* 883148 80240F88 3C034000 */  lui       $v1, 0x4000
/* 88314C 80240F8C 00431024 */  and       $v0, $v0, $v1
/* 883150 80240F90 10400007 */  beqz      $v0, .L80240FB0
/* 883154 80240F94 3C03BFFF */   lui      $v1, 0xbfff
/* 883158 80240F98 2402000C */  addiu     $v0, $zero, 0xc
/* 88315C 80240F9C AE620070 */  sw        $v0, 0x70($s3)
/* 883160 80240FA0 8E220000 */  lw        $v0, ($s1)
/* 883164 80240FA4 3463FFFF */  ori       $v1, $v1, 0xffff
/* 883168 80240FA8 00431024 */  and       $v0, $v0, $v1
/* 88316C 80240FAC AE220000 */  sw        $v0, ($s1)
.L80240FB0:
/* 883170 80240FB0 8E220090 */  lw        $v0, 0x90($s1)
/* 883174 80240FB4 1840000C */  blez      $v0, .L80240FE8
/* 883178 80240FB8 2442FFFF */   addiu    $v0, $v0, -1
/* 88317C 80240FBC 14400087 */  bnez      $v0, .L802411DC
/* 883180 80240FC0 AE220090 */   sw       $v0, 0x90($s1)
/* 883184 80240FC4 3C03FFAA */  lui       $v1, 0xffaa
/* 883188 80240FC8 8E420028 */  lw        $v0, 0x28($s2)
/* 88318C 80240FCC 3463FFD2 */  ori       $v1, $v1, 0xffd2
/* 883190 80240FD0 00431021 */  addu      $v0, $v0, $v1
/* 883194 80240FD4 2C420002 */  sltiu     $v0, $v0, 2
/* 883198 80240FD8 10400003 */  beqz      $v0, .L80240FE8
/* 88319C 80240FDC 3C020055 */   lui      $v0, 0x55
/* 8831A0 80240FE0 3442000C */  ori       $v0, $v0, 0xc
/* 8831A4 80240FE4 AE420028 */  sw        $v0, 0x28($s2)
.L80240FE8:
/* 8831A8 80240FE8 8E630070 */  lw        $v1, 0x70($s3)
/* 8831AC 80240FEC 2402000C */  addiu     $v0, $zero, 0xc
/* 8831B0 80240FF0 10620048 */  beq       $v1, $v0, .L80241114
/* 8831B4 80240FF4 2862000D */   slti     $v0, $v1, 0xd
/* 8831B8 80240FF8 1040000F */  beqz      $v0, .L80241038
/* 8831BC 80240FFC 24100001 */   addiu    $s0, $zero, 1
/* 8831C0 80241000 1070001E */  beq       $v1, $s0, .L8024107C
/* 8831C4 80241004 28620002 */   slti     $v0, $v1, 2
/* 8831C8 80241008 10400005 */  beqz      $v0, .L80241020
/* 8831CC 8024100C 24020002 */   addiu    $v0, $zero, 2
/* 8831D0 80241010 10600015 */  beqz      $v1, .L80241068
/* 8831D4 80241014 0260202D */   daddu    $a0, $s3, $zero
/* 8831D8 80241018 0809045C */  j         .L80241170
/* 8831DC 8024101C 00000000 */   nop
.L80241020:
/* 8831E0 80241020 1062001C */  beq       $v1, $v0, .L80241094
/* 8831E4 80241024 24020003 */   addiu    $v0, $zero, 3
/* 8831E8 80241028 10620035 */  beq       $v1, $v0, .L80241100
/* 8831EC 8024102C 0260202D */   daddu    $a0, $s3, $zero
/* 8831F0 80241030 0809045C */  j         .L80241170
/* 8831F4 80241034 00000000 */   nop
.L80241038:
/* 8831F8 80241038 2402000E */  addiu     $v0, $zero, 0xe
/* 8831FC 8024103C 1062003F */  beq       $v1, $v0, .L8024113C
/* 883200 80241040 0062102A */   slt      $v0, $v1, $v0
/* 883204 80241044 14400038 */  bnez      $v0, .L80241128
/* 883208 80241048 0260202D */   daddu    $a0, $s3, $zero
/* 88320C 8024104C 2402000F */  addiu     $v0, $zero, 0xf
/* 883210 80241050 10620040 */  beq       $v1, $v0, .L80241154
/* 883214 80241054 24020063 */   addiu    $v0, $zero, 0x63
/* 883218 80241058 10620043 */  beq       $v1, $v0, .L80241168
/* 88321C 8024105C 00000000 */   nop
/* 883220 80241060 0809045C */  j         .L80241170
/* 883224 80241064 00000000 */   nop
.L80241068:
/* 883228 80241068 0280282D */  daddu     $a1, $s4, $zero
/* 88322C 8024106C 0C012568 */  jal       func_800495A0
/* 883230 80241070 02A0302D */   daddu    $a2, $s5, $zero
/* 883234 80241074 96220086 */  lhu       $v0, 0x86($s1)
/* 883238 80241078 A64200A8 */  sh        $v0, 0xa8($s2)
.L8024107C:
/* 88323C 8024107C 0260202D */  daddu     $a0, $s3, $zero
/* 883240 80241080 0280282D */  daddu     $a1, $s4, $zero
/* 883244 80241084 0C0125AE */  jal       func_800496B8
/* 883248 80241088 02A0302D */   daddu    $a2, $s5, $zero
/* 88324C 8024108C 0809045C */  j         .L80241170
/* 883250 80241090 00000000 */   nop
.L80241094:
/* 883254 80241094 0260202D */  daddu     $a0, $s3, $zero
/* 883258 80241098 0280282D */  daddu     $a1, $s4, $zero
/* 88325C 8024109C 0C0126D1 */  jal       base_UnkNpcAIFunc1
/* 883260 802410A0 02A0302D */   daddu    $a2, $s5, $zero
/* 883264 802410A4 8E230088 */  lw        $v1, 0x88($s1)
/* 883268 802410A8 24020006 */  addiu     $v0, $zero, 6
/* 88326C 802410AC 14620014 */  bne       $v1, $v0, .L80241100
/* 883270 802410B0 0260202D */   daddu    $a0, $s3, $zero
/* 883274 802410B4 0C00A67F */  jal       rand_int
/* 883278 802410B8 24040064 */   addiu    $a0, $zero, 0x64
/* 88327C 802410BC 28420021 */  slti      $v0, $v0, 0x21
/* 883280 802410C0 5040000F */  beql      $v0, $zero, .L80241100
/* 883284 802410C4 0260202D */   daddu    $a0, $s3, $zero
/* 883288 802410C8 8E22008C */  lw        $v0, 0x8c($s1)
/* 88328C 802410CC 10400005 */  beqz      $v0, .L802410E4
/* 883290 802410D0 3C020055 */   lui      $v0, 0x55
/* 883294 802410D4 3442002F */  ori       $v0, $v0, 0x2f
/* 883298 802410D8 AE20008C */  sw        $zero, 0x8c($s1)
/* 88329C 802410DC 0809043C */  j         .L802410F0
/* 8832A0 802410E0 A22000B5 */   sb       $zero, 0xb5($s1)
.L802410E4:
/* 8832A4 802410E4 3442002E */  ori       $v0, $v0, 0x2e
/* 8832A8 802410E8 AE30008C */  sw        $s0, 0x8c($s1)
/* 8832AC 802410EC A23000B5 */  sb        $s0, 0xb5($s1)
.L802410F0:
/* 8832B0 802410F0 AE420028 */  sw        $v0, 0x28($s2)
/* 8832B4 802410F4 24020007 */  addiu     $v0, $zero, 7
/* 8832B8 802410F8 08090477 */  j         .L802411DC
/* 8832BC 802410FC AE220090 */   sw       $v0, 0x90($s1)
.L80241100:
/* 8832C0 80241100 0280282D */  daddu     $a1, $s4, $zero
/* 8832C4 80241104 0C012701 */  jal       func_80049C04
/* 8832C8 80241108 02A0302D */   daddu    $a2, $s5, $zero
/* 8832CC 8024110C 0809045C */  j         .L80241170
/* 8832D0 80241110 00000000 */   nop
.L80241114:
/* 8832D4 80241114 0260202D */  daddu     $a0, $s3, $zero
/* 8832D8 80241118 0280282D */  daddu     $a1, $s4, $zero
/* 8832DC 8024111C 0C09028C */  jal       tik_09_set_script_owner_npc_anim
/* 8832E0 80241120 02A0302D */   daddu    $a2, $s5, $zero
/* 8832E4 80241124 0260202D */  daddu     $a0, $s3, $zero
.L80241128:
/* 8832E8 80241128 0280282D */  daddu     $a1, $s4, $zero
/* 8832EC 8024112C 0C0902AB */  jal       func_80240AAC_882C6C
/* 8832F0 80241130 02A0302D */   daddu    $a2, $s5, $zero
/* 8832F4 80241134 0809045C */  j         .L80241170
/* 8832F8 80241138 00000000 */   nop
.L8024113C:
/* 8832FC 8024113C 0260202D */  daddu     $a0, $s3, $zero
/* 883300 80241140 0280282D */  daddu     $a1, $s4, $zero
/* 883304 80241144 0C0902F8 */  jal       func_80240BE0_882DA0
/* 883308 80241148 02A0302D */   daddu    $a2, $s5, $zero
/* 88330C 8024114C 0809045C */  j         .L80241170
/* 883310 80241150 00000000 */   nop
.L80241154:
/* 883314 80241154 0280282D */  daddu     $a1, $s4, $zero
/* 883318 80241158 0C090351 */  jal       func_80240D44_882F04
/* 88331C 8024115C 02A0302D */   daddu    $a2, $s5, $zero
/* 883320 80241160 0809045C */  j         .L80241170
/* 883324 80241164 00000000 */   nop
.L80241168:
/* 883328 80241168 0C0129CF */  jal       func_8004A73C
/* 88332C 8024116C 0260202D */   daddu    $a0, $s3, $zero
.L80241170:
/* 883330 80241170 8E230088 */  lw        $v1, 0x88($s1)
/* 883334 80241174 24020006 */  addiu     $v0, $zero, 6
/* 883338 80241178 14620019 */  bne       $v1, $v0, .L802411E0
/* 88333C 8024117C 0000102D */   daddu    $v0, $zero, $zero
/* 883340 80241180 8E22008C */  lw        $v0, 0x8c($s1)
/* 883344 80241184 10400003 */  beqz      $v0, .L80241194
/* 883348 80241188 24020001 */   addiu    $v0, $zero, 1
/* 88334C 8024118C 08090466 */  j         .L80241198
/* 883350 80241190 A22200B5 */   sb       $v0, 0xb5($s1)
.L80241194:
/* 883354 80241194 A22000B5 */  sb        $zero, 0xb5($s1)
.L80241198:
/* 883358 80241198 8E22008C */  lw        $v0, 0x8c($s1)
/* 88335C 8024119C 1040000F */  beqz      $v0, .L802411DC
/* 883360 802411A0 3C03FFAA */   lui      $v1, 0xffaa
/* 883364 802411A4 8E420028 */  lw        $v0, 0x28($s2)
/* 883368 802411A8 3463FFFC */  ori       $v1, $v1, 0xfffc
/* 88336C 802411AC 00431821 */  addu      $v1, $v0, $v1
/* 883370 802411B0 2C620015 */  sltiu     $v0, $v1, 0x15
/* 883374 802411B4 10400009 */  beqz      $v0, .L802411DC
/* 883378 802411B8 00031080 */   sll      $v0, $v1, 2
/* 88337C 802411BC 3C018024 */  lui       $at, %hi(D_802441A8)
/* 883380 802411C0 00220821 */  addu      $at, $at, $v0
/* 883384 802411C4 8C2241A8 */  lw        $v0, %lo(D_802441A8)($at)
/* 883388 802411C8 00400008 */  jr        $v0
/* 88338C 802411CC 00000000 */   nop
/* 883390 802411D0 8E420028 */  lw        $v0, 0x28($s2)
/* 883394 802411D4 24420001 */  addiu     $v0, $v0, 1
/* 883398 802411D8 AE420028 */  sw        $v0, 0x28($s2)
.L802411DC:
/* 88339C 802411DC 0000102D */  daddu     $v0, $zero, $zero
.L802411E0:
/* 8833A0 802411E0 8FBF0068 */  lw        $ra, 0x68($sp)
/* 8833A4 802411E4 8FB50064 */  lw        $s5, 0x64($sp)
/* 8833A8 802411E8 8FB40060 */  lw        $s4, 0x60($sp)
/* 8833AC 802411EC 8FB3005C */  lw        $s3, 0x5c($sp)
/* 8833B0 802411F0 8FB20058 */  lw        $s2, 0x58($sp)
/* 8833B4 802411F4 8FB10054 */  lw        $s1, 0x54($sp)
/* 8833B8 802411F8 8FB00050 */  lw        $s0, 0x50($sp)
/* 8833BC 802411FC 03E00008 */  jr        $ra
/* 8833C0 80241200 27BD0070 */   addiu    $sp, $sp, 0x70
