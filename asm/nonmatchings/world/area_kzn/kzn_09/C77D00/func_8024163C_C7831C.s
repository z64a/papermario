.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_8024163C_C7831C
/* C7831C 8024163C 27BDFFB0 */  addiu     $sp, $sp, -0x50
/* C78320 80241640 AFB20038 */  sw        $s2, 0x38($sp)
/* C78324 80241644 0080902D */  daddu     $s2, $a0, $zero
/* C78328 80241648 AFBF0048 */  sw        $ra, 0x48($sp)
/* C7832C 8024164C AFB50044 */  sw        $s5, 0x44($sp)
/* C78330 80241650 AFB40040 */  sw        $s4, 0x40($sp)
/* C78334 80241654 AFB3003C */  sw        $s3, 0x3c($sp)
/* C78338 80241658 AFB10034 */  sw        $s1, 0x34($sp)
/* C7833C 8024165C AFB00030 */  sw        $s0, 0x30($sp)
/* C78340 80241660 8E510148 */  lw        $s1, 0x148($s2)
/* C78344 80241664 86240008 */  lh        $a0, 8($s1)
/* C78348 80241668 0C00EABB */  jal       get_npc_unsafe
/* C7834C 8024166C 00A0802D */   daddu    $s0, $a1, $zero
/* C78350 80241670 8E43000C */  lw        $v1, 0xc($s2)
/* C78354 80241674 0240202D */  daddu     $a0, $s2, $zero
/* C78358 80241678 8C650000 */  lw        $a1, ($v1)
/* C7835C 8024167C 0C0B1EAF */  jal       get_variable
/* C78360 80241680 0040A82D */   daddu    $s5, $v0, $zero
/* C78364 80241684 AFA00010 */  sw        $zero, 0x10($sp)
/* C78368 80241688 8E2300D0 */  lw        $v1, 0xd0($s1)
/* C7836C 8024168C 8C630030 */  lw        $v1, 0x30($v1)
/* C78370 80241690 AFA30014 */  sw        $v1, 0x14($sp)
/* C78374 80241694 8E2300D0 */  lw        $v1, 0xd0($s1)
/* C78378 80241698 8C63001C */  lw        $v1, 0x1c($v1)
/* C7837C 8024169C AFA30018 */  sw        $v1, 0x18($sp)
/* C78380 802416A0 8E2300D0 */  lw        $v1, 0xd0($s1)
/* C78384 802416A4 8C630024 */  lw        $v1, 0x24($v1)
/* C78388 802416A8 AFA3001C */  sw        $v1, 0x1c($sp)
/* C7838C 802416AC 8E2300D0 */  lw        $v1, 0xd0($s1)
/* C78390 802416B0 8C630028 */  lw        $v1, 0x28($v1)
/* C78394 802416B4 27B40010 */  addiu     $s4, $sp, 0x10
/* C78398 802416B8 AFA30020 */  sw        $v1, 0x20($sp)
/* C7839C 802416BC 8E2300D0 */  lw        $v1, 0xd0($s1)
/* C783A0 802416C0 3C014282 */  lui       $at, 0x4282
/* C783A4 802416C4 44810000 */  mtc1      $at, $f0
/* C783A8 802416C8 8C63002C */  lw        $v1, 0x2c($v1)
/* C783AC 802416CC 0040982D */  daddu     $s3, $v0, $zero
/* C783B0 802416D0 E7A00028 */  swc1      $f0, 0x28($sp)
/* C783B4 802416D4 A7A0002C */  sh        $zero, 0x2c($sp)
/* C783B8 802416D8 16000005 */  bnez      $s0, .L802416F0
/* C783BC 802416DC AFA30024 */   sw       $v1, 0x24($sp)
/* C783C0 802416E0 8E2200B0 */  lw        $v0, 0xb0($s1)
/* C783C4 802416E4 30420004 */  andi      $v0, $v0, 4
/* C783C8 802416E8 10400020 */  beqz      $v0, .L8024176C
/* C783CC 802416EC 00000000 */   nop      
.L802416F0:
/* C783D0 802416F0 2404F7FF */  addiu     $a0, $zero, -0x801
/* C783D4 802416F4 AE400070 */  sw        $zero, 0x70($s2)
/* C783D8 802416F8 A6A0008E */  sh        $zero, 0x8e($s5)
/* C783DC 802416FC 8E2200CC */  lw        $v0, 0xcc($s1)
/* C783E0 80241700 8EA30000 */  lw        $v1, ($s5)
/* C783E4 80241704 8C420000 */  lw        $v0, ($v0)
/* C783E8 80241708 00641824 */  and       $v1, $v1, $a0
/* C783EC 8024170C AEA30000 */  sw        $v1, ($s5)
/* C783F0 80241710 AEA20028 */  sw        $v0, 0x28($s5)
/* C783F4 80241714 8E2200D0 */  lw        $v0, 0xd0($s1)
/* C783F8 80241718 8C420034 */  lw        $v0, 0x34($v0)
/* C783FC 8024171C 54400005 */  bnel      $v0, $zero, .L80241734
/* C78400 80241720 2402FDFF */   addiu    $v0, $zero, -0x201
/* C78404 80241724 34620200 */  ori       $v0, $v1, 0x200
/* C78408 80241728 2403FFF7 */  addiu     $v1, $zero, -9
/* C7840C 8024172C 080905CF */  j         .L8024173C
/* C78410 80241730 00431024 */   and      $v0, $v0, $v1
.L80241734:
/* C78414 80241734 00621024 */  and       $v0, $v1, $v0
/* C78418 80241738 34420008 */  ori       $v0, $v0, 8
.L8024173C:
/* C7841C 8024173C AEA20000 */  sw        $v0, ($s5)
/* C78420 80241740 8E2200B0 */  lw        $v0, 0xb0($s1)
/* C78424 80241744 30420004 */  andi      $v0, $v0, 4
/* C78428 80241748 10400007 */  beqz      $v0, .L80241768
/* C7842C 8024174C 24020063 */   addiu    $v0, $zero, 0x63
/* C78430 80241750 AE420070 */  sw        $v0, 0x70($s2)
/* C78434 80241754 AE400074 */  sw        $zero, 0x74($s2)
/* C78438 80241758 8E2200B0 */  lw        $v0, 0xb0($s1)
/* C7843C 8024175C 2403FFFB */  addiu     $v1, $zero, -5
/* C78440 80241760 00431024 */  and       $v0, $v0, $v1
/* C78444 80241764 AE2200B0 */  sw        $v0, 0xb0($s1)
.L80241768:
/* C78448 80241768 AE20006C */  sw        $zero, 0x6c($s1)
.L8024176C:
/* C7844C 8024176C 8E420070 */  lw        $v0, 0x70($s2)
/* C78450 80241770 2842001E */  slti      $v0, $v0, 0x1e
/* C78454 80241774 10400009 */  beqz      $v0, .L8024179C
/* C78458 80241778 00000000 */   nop      
/* C7845C 8024177C 8E22006C */  lw        $v0, 0x6c($s1)
/* C78460 80241780 14400006 */  bnez      $v0, .L8024179C
/* C78464 80241784 00000000 */   nop      
/* C78468 80241788 0C09048A */  jal       func_80241228_C77F08
/* C7846C 8024178C 0240202D */   daddu    $a0, $s2, $zero
/* C78470 80241790 10400002 */  beqz      $v0, .L8024179C
/* C78474 80241794 2402001E */   addiu    $v0, $zero, 0x1e
/* C78478 80241798 AE420070 */  sw        $v0, 0x70($s2)
.L8024179C:
/* C7847C 8024179C 8E430070 */  lw        $v1, 0x70($s2)
/* C78480 802417A0 2C620064 */  sltiu     $v0, $v1, 0x64
/* C78484 802417A4 10400048 */  beqz      $v0, .L802418C8
/* C78488 802417A8 00031080 */   sll      $v0, $v1, 2
/* C7848C 802417AC 3C018024 */  lui       $at, %hi(D_80247278)
/* C78490 802417B0 00220821 */  addu      $at, $at, $v0
/* C78494 802417B4 8C227278 */  lw        $v0, %lo(D_80247278)($at)
/* C78498 802417B8 00400008 */  jr        $v0
/* C7849C 802417BC 00000000 */   nop      
/* C784A0 802417C0 0240202D */  daddu     $a0, $s2, $zero
/* C784A4 802417C4 0260282D */  daddu     $a1, $s3, $zero
/* C784A8 802417C8 0C012568 */  jal       func_800495A0
/* C784AC 802417CC 0280302D */   daddu    $a2, $s4, $zero
/* C784B0 802417D0 0240202D */  daddu     $a0, $s2, $zero
/* C784B4 802417D4 0260282D */  daddu     $a1, $s3, $zero
/* C784B8 802417D8 0C0125AE */  jal       func_800496B8
/* C784BC 802417DC 0280302D */   daddu    $a2, $s4, $zero
/* C784C0 802417E0 08090632 */  j         .L802418C8
/* C784C4 802417E4 00000000 */   nop      
/* C784C8 802417E8 0240202D */  daddu     $a0, $s2, $zero
/* C784CC 802417EC 0260282D */  daddu     $a1, $s3, $zero
/* C784D0 802417F0 0C0126D1 */  jal       func_80049B44
/* C784D4 802417F4 0280302D */   daddu    $a2, $s4, $zero
/* C784D8 802417F8 0240202D */  daddu     $a0, $s2, $zero
/* C784DC 802417FC 0260282D */  daddu     $a1, $s3, $zero
/* C784E0 80241800 0C012701 */  jal       func_80049C04
/* C784E4 80241804 0280302D */   daddu    $a2, $s4, $zero
/* C784E8 80241808 08090632 */  j         .L802418C8
/* C784EC 8024180C 00000000 */   nop      
/* C784F0 80241810 0240202D */  daddu     $a0, $s2, $zero
/* C784F4 80241814 0260282D */  daddu     $a1, $s3, $zero
/* C784F8 80241818 0C01278F */  jal       func_80049E3C
/* C784FC 8024181C 0280302D */   daddu    $a2, $s4, $zero
/* C78500 80241820 0240202D */  daddu     $a0, $s2, $zero
/* C78504 80241824 0260282D */  daddu     $a1, $s3, $zero
/* C78508 80241828 0C0127B3 */  jal       func_80049ECC
/* C7850C 8024182C 0280302D */   daddu    $a2, $s4, $zero
/* C78510 80241830 08090632 */  j         .L802418C8
/* C78514 80241834 00000000 */   nop      
/* C78518 80241838 0240202D */  daddu     $a0, $s2, $zero
/* C7851C 8024183C 0260282D */  daddu     $a1, $s3, $zero
/* C78520 80241840 0C0127DF */  jal       func_80049F7C
/* C78524 80241844 0280302D */   daddu    $a2, $s4, $zero
/* C78528 80241848 0240202D */  daddu     $a0, $s2, $zero
/* C7852C 8024184C 0260282D */  daddu     $a1, $s3, $zero
/* C78530 80241850 0C012849 */  jal       func_8004A124
/* C78534 80241854 0280302D */   daddu    $a2, $s4, $zero
/* C78538 80241858 08090632 */  j         .L802418C8
/* C7853C 8024185C 00000000 */   nop      
/* C78540 80241860 0240202D */  daddu     $a0, $s2, $zero
/* C78544 80241864 0260282D */  daddu     $a1, $s3, $zero
/* C78548 80241868 0C0128FA */  jal       func_8004A3E8
/* C7854C 8024186C 0280302D */   daddu    $a2, $s4, $zero
/* C78550 80241870 08090632 */  j         .L802418C8
/* C78554 80241874 00000000 */   nop      
/* C78558 80241878 0C090408 */  jal       func_80241020_C77D00
/* C7855C 8024187C 0240202D */   daddu    $a0, $s2, $zero
/* C78560 80241880 0C090423 */  jal       func_8024108C_C77D6C
/* C78564 80241884 0240202D */   daddu    $a0, $s2, $zero
/* C78568 80241888 8E430070 */  lw        $v1, 0x70($s2)
/* C7856C 8024188C 24020020 */  addiu     $v0, $zero, 0x20
/* C78570 80241890 1462000D */  bne       $v1, $v0, .L802418C8
/* C78574 80241894 00000000 */   nop      
/* C78578 80241898 0C09043F */  jal       func_802410FC_C77DDC
/* C7857C 8024189C 0240202D */   daddu    $a0, $s2, $zero
/* C78580 802418A0 8E430070 */  lw        $v1, 0x70($s2)
/* C78584 802418A4 24020021 */  addiu     $v0, $zero, 0x21
/* C78588 802418A8 14620007 */  bne       $v1, $v0, .L802418C8
/* C7858C 802418AC 00000000 */   nop      
/* C78590 802418B0 0C090475 */  jal       func_802411D4_C77EB4
/* C78594 802418B4 0240202D */   daddu    $a0, $s2, $zero
/* C78598 802418B8 08090632 */  j         .L802418C8
/* C7859C 802418BC 00000000 */   nop      
/* C785A0 802418C0 0C0129CF */  jal       func_8004A73C
/* C785A4 802418C4 0240202D */   daddu    $a0, $s2, $zero
.L802418C8:
/* C785A8 802418C8 8FBF0048 */  lw        $ra, 0x48($sp)
/* C785AC 802418CC 8FB50044 */  lw        $s5, 0x44($sp)
/* C785B0 802418D0 8FB40040 */  lw        $s4, 0x40($sp)
/* C785B4 802418D4 8FB3003C */  lw        $s3, 0x3c($sp)
/* C785B8 802418D8 8FB20038 */  lw        $s2, 0x38($sp)
/* C785BC 802418DC 8FB10034 */  lw        $s1, 0x34($sp)
/* C785C0 802418E0 8FB00030 */  lw        $s0, 0x30($sp)
/* C785C4 802418E4 0000102D */  daddu     $v0, $zero, $zero
/* C785C8 802418E8 03E00008 */  jr        $ra
/* C785CC 802418EC 27BD0050 */   addiu    $sp, $sp, 0x50
