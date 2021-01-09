.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_802433A0_DF2240
/* DF2240 802433A0 27BDFFB0 */  addiu     $sp, $sp, -0x50
/* DF2244 802433A4 AFB3003C */  sw        $s3, 0x3c($sp)
/* DF2248 802433A8 0080982D */  daddu     $s3, $a0, $zero
/* DF224C 802433AC AFBF0048 */  sw        $ra, 0x48($sp)
/* DF2250 802433B0 AFB50044 */  sw        $s5, 0x44($sp)
/* DF2254 802433B4 AFB40040 */  sw        $s4, 0x40($sp)
/* DF2258 802433B8 AFB20038 */  sw        $s2, 0x38($sp)
/* DF225C 802433BC AFB10034 */  sw        $s1, 0x34($sp)
/* DF2260 802433C0 AFB00030 */  sw        $s0, 0x30($sp)
/* DF2264 802433C4 8E720148 */  lw        $s2, 0x148($s3)
/* DF2268 802433C8 86440008 */  lh        $a0, 8($s2)
/* DF226C 802433CC 8E70000C */  lw        $s0, 0xc($s3)
/* DF2270 802433D0 0C00EABB */  jal       get_npc_unsafe
/* DF2274 802433D4 00A0882D */   daddu    $s1, $a1, $zero
/* DF2278 802433D8 0260202D */  daddu     $a0, $s3, $zero
/* DF227C 802433DC 8E050000 */  lw        $a1, ($s0)
/* DF2280 802433E0 0C0B1EAF */  jal       get_variable
/* DF2284 802433E4 0040A02D */   daddu    $s4, $v0, $zero
/* DF2288 802433E8 AFA00010 */  sw        $zero, 0x10($sp)
/* DF228C 802433EC 8E4300D0 */  lw        $v1, 0xd0($s2)
/* DF2290 802433F0 8C630030 */  lw        $v1, 0x30($v1)
/* DF2294 802433F4 AFA30014 */  sw        $v1, 0x14($sp)
/* DF2298 802433F8 8E4300D0 */  lw        $v1, 0xd0($s2)
/* DF229C 802433FC 8C63001C */  lw        $v1, 0x1c($v1)
/* DF22A0 80243400 AFA30018 */  sw        $v1, 0x18($sp)
/* DF22A4 80243404 8E4300D0 */  lw        $v1, 0xd0($s2)
/* DF22A8 80243408 8C630024 */  lw        $v1, 0x24($v1)
/* DF22AC 8024340C AFA3001C */  sw        $v1, 0x1c($sp)
/* DF22B0 80243410 8E4300D0 */  lw        $v1, 0xd0($s2)
/* DF22B4 80243414 8C630028 */  lw        $v1, 0x28($v1)
/* DF22B8 80243418 27B50010 */  addiu     $s5, $sp, 0x10
/* DF22BC 8024341C AFA30020 */  sw        $v1, 0x20($sp)
/* DF22C0 80243420 8E4300D0 */  lw        $v1, 0xd0($s2)
/* DF22C4 80243424 3C014220 */  lui       $at, 0x4220
/* DF22C8 80243428 44810000 */  mtc1      $at, $f0
/* DF22CC 8024342C 8C63002C */  lw        $v1, 0x2c($v1)
/* DF22D0 80243430 0040802D */  daddu     $s0, $v0, $zero
/* DF22D4 80243434 E7A00028 */  swc1      $f0, 0x28($sp)
/* DF22D8 80243438 A7A0002C */  sh        $zero, 0x2c($sp)
/* DF22DC 8024343C 16200005 */  bnez      $s1, .L80243454
/* DF22E0 80243440 AFA30024 */   sw       $v1, 0x24($sp)
/* DF22E4 80243444 8E4200B0 */  lw        $v0, 0xb0($s2)
/* DF22E8 80243448 30420004 */  andi      $v0, $v0, 4
/* DF22EC 8024344C 1040002F */  beqz      $v0, .L8024350C
/* DF22F0 80243450 00000000 */   nop      
.L80243454:
/* DF22F4 80243454 2404F7FF */  addiu     $a0, $zero, -0x801
/* DF22F8 80243458 AE600070 */  sw        $zero, 0x70($s3)
/* DF22FC 8024345C A680008E */  sh        $zero, 0x8e($s4)
/* DF2300 80243460 8E4200CC */  lw        $v0, 0xcc($s2)
/* DF2304 80243464 8E830000 */  lw        $v1, ($s4)
/* DF2308 80243468 8C420000 */  lw        $v0, ($v0)
/* DF230C 8024346C 00641824 */  and       $v1, $v1, $a0
/* DF2310 80243470 AE830000 */  sw        $v1, ($s4)
/* DF2314 80243474 AE820028 */  sw        $v0, 0x28($s4)
/* DF2318 80243478 8E4200D0 */  lw        $v0, 0xd0($s2)
/* DF231C 8024347C 8C420034 */  lw        $v0, 0x34($v0)
/* DF2320 80243480 54400005 */  bnel      $v0, $zero, .L80243498
/* DF2324 80243484 2402FDFF */   addiu    $v0, $zero, -0x201
/* DF2328 80243488 34620200 */  ori       $v0, $v1, 0x200
/* DF232C 8024348C 2403FFF7 */  addiu     $v1, $zero, -9
/* DF2330 80243490 08090D28 */  j         .L802434A0
/* DF2334 80243494 00431024 */   and      $v0, $v0, $v1
.L80243498:
/* DF2338 80243498 00621024 */  and       $v0, $v1, $v0
/* DF233C 8024349C 34420008 */  ori       $v0, $v0, 8
.L802434A0:
/* DF2340 802434A0 AE820000 */  sw        $v0, ($s4)
/* DF2344 802434A4 8E4200B0 */  lw        $v0, 0xb0($s2)
/* DF2348 802434A8 30420004 */  andi      $v0, $v0, 4
/* DF234C 802434AC 10400008 */  beqz      $v0, .L802434D0
/* DF2350 802434B0 24020063 */   addiu    $v0, $zero, 0x63
/* DF2354 802434B4 AE620070 */  sw        $v0, 0x70($s3)
/* DF2358 802434B8 AE600074 */  sw        $zero, 0x74($s3)
/* DF235C 802434BC 8E4200B0 */  lw        $v0, 0xb0($s2)
/* DF2360 802434C0 2403FFFB */  addiu     $v1, $zero, -5
/* DF2364 802434C4 00431024 */  and       $v0, $v0, $v1
/* DF2368 802434C8 08090D3A */  j         .L802434E8
/* DF236C 802434CC AE4200B0 */   sw       $v0, 0xb0($s2)
.L802434D0:
/* DF2370 802434D0 8E420000 */  lw        $v0, ($s2)
/* DF2374 802434D4 3C034000 */  lui       $v1, 0x4000
/* DF2378 802434D8 00431024 */  and       $v0, $v0, $v1
/* DF237C 802434DC 10400002 */  beqz      $v0, .L802434E8
/* DF2380 802434E0 2402000C */   addiu    $v0, $zero, 0xc
/* DF2384 802434E4 AE620070 */  sw        $v0, 0x70($s3)
.L802434E8:
/* DF2388 802434E8 3C05BFFF */  lui       $a1, 0xbfff
/* DF238C 802434EC 34A5FFFF */  ori       $a1, $a1, 0xffff
/* DF2390 802434F0 2404FFFB */  addiu     $a0, $zero, -5
/* DF2394 802434F4 8E4200B0 */  lw        $v0, 0xb0($s2)
/* DF2398 802434F8 8E430000 */  lw        $v1, ($s2)
/* DF239C 802434FC 00441024 */  and       $v0, $v0, $a0
/* DF23A0 80243500 00651824 */  and       $v1, $v1, $a1
/* DF23A4 80243504 AE4200B0 */  sw        $v0, 0xb0($s2)
/* DF23A8 80243508 AE430000 */  sw        $v1, ($s2)
.L8024350C:
/* DF23AC 8024350C 8E630070 */  lw        $v1, 0x70($s3)
/* DF23B0 80243510 2C620064 */  sltiu     $v0, $v1, 0x64
/* DF23B4 80243514 10400060 */  beqz      $v0, .L80243698
/* DF23B8 80243518 00031080 */   sll      $v0, $v1, 2
/* DF23BC 8024351C 3C018024 */  lui       $at, %hi(D_802479D0)
/* DF23C0 80243520 00220821 */  addu      $at, $at, $v0
/* DF23C4 80243524 8C2279D0 */  lw        $v0, %lo(D_802479D0)($at)
/* DF23C8 80243528 00400008 */  jr        $v0
/* DF23CC 8024352C 00000000 */   nop      
/* DF23D0 80243530 0260202D */  daddu     $a0, $s3, $zero
/* DF23D4 80243534 0200282D */  daddu     $a1, $s0, $zero
/* DF23D8 80243538 0C012568 */  jal       func_800495A0
/* DF23DC 8024353C 02A0302D */   daddu    $a2, $s5, $zero
/* DF23E0 80243540 0260202D */  daddu     $a0, $s3, $zero
/* DF23E4 80243544 0200282D */  daddu     $a1, $s0, $zero
/* DF23E8 80243548 0C0125AE */  jal       func_800496B8
/* DF23EC 8024354C 02A0302D */   daddu    $a2, $s5, $zero
/* DF23F0 80243550 08090DA6 */  j         .L80243698
/* DF23F4 80243554 00000000 */   nop      
/* DF23F8 80243558 0260202D */  daddu     $a0, $s3, $zero
/* DF23FC 8024355C 0200282D */  daddu     $a1, $s0, $zero
/* DF2400 80243560 0C0126D1 */  jal       func_80049B44
/* DF2404 80243564 02A0302D */   daddu    $a2, $s5, $zero
/* DF2408 80243568 0260202D */  daddu     $a0, $s3, $zero
/* DF240C 8024356C 0200282D */  daddu     $a1, $s0, $zero
/* DF2410 80243570 0C012701 */  jal       func_80049C04
/* DF2414 80243574 02A0302D */   daddu    $a2, $s5, $zero
/* DF2418 80243578 08090DA6 */  j         .L80243698
/* DF241C 8024357C 00000000 */   nop      
/* DF2420 80243580 0260202D */  daddu     $a0, $s3, $zero
/* DF2424 80243584 0200282D */  daddu     $a1, $s0, $zero
/* DF2428 80243588 0C01278F */  jal       func_80049E3C
/* DF242C 8024358C 02A0302D */   daddu    $a2, $s5, $zero
/* DF2430 80243590 0260202D */  daddu     $a0, $s3, $zero
/* DF2434 80243594 0200282D */  daddu     $a1, $s0, $zero
/* DF2438 80243598 0C0127B3 */  jal       func_80049ECC
/* DF243C 8024359C 02A0302D */   daddu    $a2, $s5, $zero
/* DF2440 802435A0 08090DA6 */  j         .L80243698
/* DF2444 802435A4 00000000 */   nop      
/* DF2448 802435A8 3C02800F */  lui       $v0, %hi(gPlayerStatusPtr)
/* DF244C 802435AC 8C427B30 */  lw        $v0, %lo(gPlayerStatusPtr)($v0)
/* DF2450 802435B0 C68C0038 */  lwc1      $f12, 0x38($s4)
/* DF2454 802435B4 C68E0040 */  lwc1      $f14, 0x40($s4)
/* DF2458 802435B8 8C460028 */  lw        $a2, 0x28($v0)
/* DF245C 802435BC 0C00A7B5 */  jal       dist2D
/* DF2460 802435C0 8C470030 */   lw       $a3, 0x30($v0)
/* DF2464 802435C4 8E42006C */  lw        $v0, 0x6c($s2)
/* DF2468 802435C8 10400008 */  beqz      $v0, .L802435EC
/* DF246C 802435CC 46000086 */   mov.s    $f2, $f0
/* DF2470 802435D0 44820000 */  mtc1      $v0, $f0
/* DF2474 802435D4 00000000 */  nop       
/* DF2478 802435D8 46800020 */  cvt.s.w   $f0, $f0
/* DF247C 802435DC 4602003C */  c.lt.s    $f0, $f2
/* DF2480 802435E0 00000000 */  nop       
/* DF2484 802435E4 4500000B */  bc1f      .L80243614
/* DF2488 802435E8 0260202D */   daddu    $a0, $s3, $zero
.L802435EC:
/* DF248C 802435EC 0260202D */  daddu     $a0, $s3, $zero
/* DF2490 802435F0 8E050024 */  lw        $a1, 0x24($s0)
/* DF2494 802435F4 8E060028 */  lw        $a2, 0x28($s0)
/* DF2498 802435F8 0C0909A7 */  jal       func_8024269C_DF153C
/* DF249C 802435FC 02A0382D */   daddu    $a3, $s5, $zero
/* DF24A0 80243600 8E630070 */  lw        $v1, 0x70($s3)
/* DF24A4 80243604 2402000C */  addiu     $v0, $zero, 0xc
/* DF24A8 80243608 14620023 */  bne       $v1, $v0, .L80243698
/* DF24AC 8024360C 00000000 */   nop      
/* DF24B0 80243610 0260202D */  daddu     $a0, $s3, $zero
.L80243614:
/* DF24B4 80243614 0200282D */  daddu     $a1, $s0, $zero
/* DF24B8 80243618 0C0127DF */  jal       func_80049F7C
/* DF24BC 8024361C 02A0302D */   daddu    $a2, $s5, $zero
/* DF24C0 80243620 0260202D */  daddu     $a0, $s3, $zero
/* DF24C4 80243624 0200282D */  daddu     $a1, $s0, $zero
/* DF24C8 80243628 0C012849 */  jal       func_8004A124
/* DF24CC 8024362C 02A0302D */   daddu    $a2, $s5, $zero
/* DF24D0 80243630 08090DA6 */  j         .L80243698
/* DF24D4 80243634 00000000 */   nop      
/* DF24D8 80243638 0260202D */  daddu     $a0, $s3, $zero
/* DF24DC 8024363C 0200282D */  daddu     $a1, $s0, $zero
/* DF24E0 80243640 0C0128FA */  jal       func_8004A3E8
/* DF24E4 80243644 02A0302D */   daddu    $a2, $s5, $zero
/* DF24E8 80243648 08090DA6 */  j         .L80243698
/* DF24EC 8024364C 00000000 */   nop      
/* DF24F0 80243650 0C0909F8 */  jal       func_802427E0_DF1680
/* DF24F4 80243654 0260202D */   daddu    $a0, $s3, $zero
/* DF24F8 80243658 08090DA6 */  j         .L80243698
/* DF24FC 8024365C 00000000 */   nop      
/* DF2500 80243660 0C090A38 */  jal       func_802428E0_DF1780
/* DF2504 80243664 0260202D */   daddu    $a0, $s3, $zero
/* DF2508 80243668 08090DA6 */  j         .L80243698
/* DF250C 8024366C 00000000 */   nop      
/* DF2510 80243670 0C090A49 */  jal       func_80242924_DF17C4
/* DF2514 80243674 0260202D */   daddu    $a0, $s3, $zero
/* DF2518 80243678 08090DA6 */  j         .L80243698
/* DF251C 8024367C 00000000 */   nop      
/* DF2520 80243680 0C090A71 */  jal       func_802429C4_DF1864
/* DF2524 80243684 0260202D */   daddu    $a0, $s3, $zero
/* DF2528 80243688 08090DA6 */  j         .L80243698
/* DF252C 8024368C 00000000 */   nop      
/* DF2530 80243690 0C0129CF */  jal       func_8004A73C
/* DF2534 80243694 0260202D */   daddu    $a0, $s3, $zero
.L80243698:
/* DF2538 80243698 8FBF0048 */  lw        $ra, 0x48($sp)
/* DF253C 8024369C 8FB50044 */  lw        $s5, 0x44($sp)
/* DF2540 802436A0 8FB40040 */  lw        $s4, 0x40($sp)
/* DF2544 802436A4 8FB3003C */  lw        $s3, 0x3c($sp)
/* DF2548 802436A8 8FB20038 */  lw        $s2, 0x38($sp)
/* DF254C 802436AC 8FB10034 */  lw        $s1, 0x34($sp)
/* DF2550 802436B0 8FB00030 */  lw        $s0, 0x30($sp)
/* DF2554 802436B4 0000102D */  daddu     $v0, $zero, $zero
/* DF2558 802436B8 03E00008 */  jr        $ra
/* DF255C 802436BC 27BD0050 */   addiu    $sp, $sp, 0x50
