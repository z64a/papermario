.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80242698_D8F8E8
/* D8F8E8 80242698 27BDFFB0 */  addiu     $sp, $sp, -0x50
/* D8F8EC 8024269C AFB20038 */  sw        $s2, 0x38($sp)
/* D8F8F0 802426A0 0080902D */  daddu     $s2, $a0, $zero
/* D8F8F4 802426A4 AFBF0048 */  sw        $ra, 0x48($sp)
/* D8F8F8 802426A8 AFB50044 */  sw        $s5, 0x44($sp)
/* D8F8FC 802426AC AFB40040 */  sw        $s4, 0x40($sp)
/* D8F900 802426B0 AFB3003C */  sw        $s3, 0x3c($sp)
/* D8F904 802426B4 AFB10034 */  sw        $s1, 0x34($sp)
/* D8F908 802426B8 AFB00030 */  sw        $s0, 0x30($sp)
/* D8F90C 802426BC 8E510148 */  lw        $s1, 0x148($s2)
/* D8F910 802426C0 86240008 */  lh        $a0, 8($s1)
/* D8F914 802426C4 0C00EABB */  jal       get_npc_unsafe
/* D8F918 802426C8 00A0802D */   daddu    $s0, $a1, $zero
/* D8F91C 802426CC 8E43000C */  lw        $v1, 0xc($s2)
/* D8F920 802426D0 0240202D */  daddu     $a0, $s2, $zero
/* D8F924 802426D4 8C650000 */  lw        $a1, ($v1)
/* D8F928 802426D8 0C0B1EAF */  jal       get_variable
/* D8F92C 802426DC 0040A82D */   daddu    $s5, $v0, $zero
/* D8F930 802426E0 AFA00010 */  sw        $zero, 0x10($sp)
/* D8F934 802426E4 8E2300D0 */  lw        $v1, 0xd0($s1)
/* D8F938 802426E8 8C630030 */  lw        $v1, 0x30($v1)
/* D8F93C 802426EC AFA30014 */  sw        $v1, 0x14($sp)
/* D8F940 802426F0 8E2300D0 */  lw        $v1, 0xd0($s1)
/* D8F944 802426F4 8C63001C */  lw        $v1, 0x1c($v1)
/* D8F948 802426F8 AFA30018 */  sw        $v1, 0x18($sp)
/* D8F94C 802426FC 8E2300D0 */  lw        $v1, 0xd0($s1)
/* D8F950 80242700 8C630024 */  lw        $v1, 0x24($v1)
/* D8F954 80242704 AFA3001C */  sw        $v1, 0x1c($sp)
/* D8F958 80242708 8E2300D0 */  lw        $v1, 0xd0($s1)
/* D8F95C 8024270C 8C630028 */  lw        $v1, 0x28($v1)
/* D8F960 80242710 27B40010 */  addiu     $s4, $sp, 0x10
/* D8F964 80242714 AFA30020 */  sw        $v1, 0x20($sp)
/* D8F968 80242718 8E2300D0 */  lw        $v1, 0xd0($s1)
/* D8F96C 8024271C 3C014282 */  lui       $at, 0x4282
/* D8F970 80242720 44810000 */  mtc1      $at, $f0
/* D8F974 80242724 8C63002C */  lw        $v1, 0x2c($v1)
/* D8F978 80242728 0040982D */  daddu     $s3, $v0, $zero
/* D8F97C 8024272C E7A00028 */  swc1      $f0, 0x28($sp)
/* D8F980 80242730 A7A0002C */  sh        $zero, 0x2c($sp)
/* D8F984 80242734 16000005 */  bnez      $s0, .L8024274C
/* D8F988 80242738 AFA30024 */   sw       $v1, 0x24($sp)
/* D8F98C 8024273C 8E2200B0 */  lw        $v0, 0xb0($s1)
/* D8F990 80242740 30420004 */  andi      $v0, $v0, 4
/* D8F994 80242744 10400020 */  beqz      $v0, .L802427C8
/* D8F998 80242748 00000000 */   nop      
.L8024274C:
/* D8F99C 8024274C 2404F7FF */  addiu     $a0, $zero, -0x801
/* D8F9A0 80242750 AE400070 */  sw        $zero, 0x70($s2)
/* D8F9A4 80242754 A6A0008E */  sh        $zero, 0x8e($s5)
/* D8F9A8 80242758 8E2200CC */  lw        $v0, 0xcc($s1)
/* D8F9AC 8024275C 8EA30000 */  lw        $v1, ($s5)
/* D8F9B0 80242760 8C420000 */  lw        $v0, ($v0)
/* D8F9B4 80242764 00641824 */  and       $v1, $v1, $a0
/* D8F9B8 80242768 AEA30000 */  sw        $v1, ($s5)
/* D8F9BC 8024276C AEA20028 */  sw        $v0, 0x28($s5)
/* D8F9C0 80242770 8E2200D0 */  lw        $v0, 0xd0($s1)
/* D8F9C4 80242774 8C420034 */  lw        $v0, 0x34($v0)
/* D8F9C8 80242778 54400005 */  bnel      $v0, $zero, .L80242790
/* D8F9CC 8024277C 2402FDFF */   addiu    $v0, $zero, -0x201
/* D8F9D0 80242780 34620200 */  ori       $v0, $v1, 0x200
/* D8F9D4 80242784 2403FFF7 */  addiu     $v1, $zero, -9
/* D8F9D8 80242788 080909E6 */  j         .L80242798
/* D8F9DC 8024278C 00431024 */   and      $v0, $v0, $v1
.L80242790:
/* D8F9E0 80242790 00621024 */  and       $v0, $v1, $v0
/* D8F9E4 80242794 34420008 */  ori       $v0, $v0, 8
.L80242798:
/* D8F9E8 80242798 AEA20000 */  sw        $v0, ($s5)
/* D8F9EC 8024279C 8E2200B0 */  lw        $v0, 0xb0($s1)
/* D8F9F0 802427A0 30420004 */  andi      $v0, $v0, 4
/* D8F9F4 802427A4 10400007 */  beqz      $v0, .L802427C4
/* D8F9F8 802427A8 24020063 */   addiu    $v0, $zero, 0x63
/* D8F9FC 802427AC AE420070 */  sw        $v0, 0x70($s2)
/* D8FA00 802427B0 AE400074 */  sw        $zero, 0x74($s2)
/* D8FA04 802427B4 8E2200B0 */  lw        $v0, 0xb0($s1)
/* D8FA08 802427B8 2403FFFB */  addiu     $v1, $zero, -5
/* D8FA0C 802427BC 00431024 */  and       $v0, $v0, $v1
/* D8FA10 802427C0 AE2200B0 */  sw        $v0, 0xb0($s1)
.L802427C4:
/* D8FA14 802427C4 AE20006C */  sw        $zero, 0x6c($s1)
.L802427C8:
/* D8FA18 802427C8 8E420070 */  lw        $v0, 0x70($s2)
/* D8FA1C 802427CC 2842001E */  slti      $v0, $v0, 0x1e
/* D8FA20 802427D0 10400009 */  beqz      $v0, .L802427F8
/* D8FA24 802427D4 00000000 */   nop      
/* D8FA28 802427D8 8E22006C */  lw        $v0, 0x6c($s1)
/* D8FA2C 802427DC 14400006 */  bnez      $v0, .L802427F8
/* D8FA30 802427E0 00000000 */   nop      
/* D8FA34 802427E4 0C0907EE */  jal       func_80241FB8_D8F208
/* D8FA38 802427E8 0240202D */   daddu    $a0, $s2, $zero
/* D8FA3C 802427EC 10400002 */  beqz      $v0, .L802427F8
/* D8FA40 802427F0 2402001E */   addiu    $v0, $zero, 0x1e
/* D8FA44 802427F4 AE420070 */  sw        $v0, 0x70($s2)
.L802427F8:
/* D8FA48 802427F8 8E430070 */  lw        $v1, 0x70($s2)
/* D8FA4C 802427FC 2C620064 */  sltiu     $v0, $v1, 0x64
/* D8FA50 80242800 10400048 */  beqz      $v0, .L80242924
/* D8FA54 80242804 00031080 */   sll      $v0, $v1, 2
/* D8FA58 80242808 3C018024 */  lui       $at, %hi(D_80244318)
/* D8FA5C 8024280C 00220821 */  addu      $at, $at, $v0
/* D8FA60 80242810 8C224318 */  lw        $v0, %lo(D_80244318)($at)
/* D8FA64 80242814 00400008 */  jr        $v0
/* D8FA68 80242818 00000000 */   nop      
/* D8FA6C 8024281C 0240202D */  daddu     $a0, $s2, $zero
/* D8FA70 80242820 0260282D */  daddu     $a1, $s3, $zero
/* D8FA74 80242824 0C012568 */  jal       func_800495A0
/* D8FA78 80242828 0280302D */   daddu    $a2, $s4, $zero
/* D8FA7C 8024282C 0240202D */  daddu     $a0, $s2, $zero
/* D8FA80 80242830 0260282D */  daddu     $a1, $s3, $zero
/* D8FA84 80242834 0C0125AE */  jal       func_800496B8
/* D8FA88 80242838 0280302D */   daddu    $a2, $s4, $zero
/* D8FA8C 8024283C 08090A49 */  j         .L80242924
/* D8FA90 80242840 00000000 */   nop      
/* D8FA94 80242844 0240202D */  daddu     $a0, $s2, $zero
/* D8FA98 80242848 0260282D */  daddu     $a1, $s3, $zero
/* D8FA9C 8024284C 0C0126D1 */  jal       func_80049B44
/* D8FAA0 80242850 0280302D */   daddu    $a2, $s4, $zero
/* D8FAA4 80242854 0240202D */  daddu     $a0, $s2, $zero
/* D8FAA8 80242858 0260282D */  daddu     $a1, $s3, $zero
/* D8FAAC 8024285C 0C012701 */  jal       func_80049C04
/* D8FAB0 80242860 0280302D */   daddu    $a2, $s4, $zero
/* D8FAB4 80242864 08090A49 */  j         .L80242924
/* D8FAB8 80242868 00000000 */   nop      
/* D8FABC 8024286C 0240202D */  daddu     $a0, $s2, $zero
/* D8FAC0 80242870 0260282D */  daddu     $a1, $s3, $zero
/* D8FAC4 80242874 0C01278F */  jal       func_80049E3C
/* D8FAC8 80242878 0280302D */   daddu    $a2, $s4, $zero
/* D8FACC 8024287C 0240202D */  daddu     $a0, $s2, $zero
/* D8FAD0 80242880 0260282D */  daddu     $a1, $s3, $zero
/* D8FAD4 80242884 0C0127B3 */  jal       func_80049ECC
/* D8FAD8 80242888 0280302D */   daddu    $a2, $s4, $zero
/* D8FADC 8024288C 08090A49 */  j         .L80242924
/* D8FAE0 80242890 00000000 */   nop      
/* D8FAE4 80242894 0240202D */  daddu     $a0, $s2, $zero
/* D8FAE8 80242898 0260282D */  daddu     $a1, $s3, $zero
/* D8FAEC 8024289C 0C0127DF */  jal       func_80049F7C
/* D8FAF0 802428A0 0280302D */   daddu    $a2, $s4, $zero
/* D8FAF4 802428A4 0240202D */  daddu     $a0, $s2, $zero
/* D8FAF8 802428A8 0260282D */  daddu     $a1, $s3, $zero
/* D8FAFC 802428AC 0C012849 */  jal       func_8004A124
/* D8FB00 802428B0 0280302D */   daddu    $a2, $s4, $zero
/* D8FB04 802428B4 08090A49 */  j         .L80242924
/* D8FB08 802428B8 00000000 */   nop      
/* D8FB0C 802428BC 0240202D */  daddu     $a0, $s2, $zero
/* D8FB10 802428C0 0260282D */  daddu     $a1, $s3, $zero
/* D8FB14 802428C4 0C0128FA */  jal       func_8004A3E8
/* D8FB18 802428C8 0280302D */   daddu    $a2, $s4, $zero
/* D8FB1C 802428CC 08090A49 */  j         .L80242924
/* D8FB20 802428D0 00000000 */   nop      
/* D8FB24 802428D4 0C09076C */  jal       func_80241DB0_D8F000
/* D8FB28 802428D8 0240202D */   daddu    $a0, $s2, $zero
/* D8FB2C 802428DC 0C090787 */  jal       func_80241E1C_D8F06C
/* D8FB30 802428E0 0240202D */   daddu    $a0, $s2, $zero
/* D8FB34 802428E4 8E430070 */  lw        $v1, 0x70($s2)
/* D8FB38 802428E8 24020020 */  addiu     $v0, $zero, 0x20
/* D8FB3C 802428EC 1462000D */  bne       $v1, $v0, .L80242924
/* D8FB40 802428F0 00000000 */   nop      
/* D8FB44 802428F4 0C0907A3 */  jal       func_80241E8C_D8F0DC
/* D8FB48 802428F8 0240202D */   daddu    $a0, $s2, $zero
/* D8FB4C 802428FC 8E430070 */  lw        $v1, 0x70($s2)
/* D8FB50 80242900 24020021 */  addiu     $v0, $zero, 0x21
/* D8FB54 80242904 14620007 */  bne       $v1, $v0, .L80242924
/* D8FB58 80242908 00000000 */   nop      
/* D8FB5C 8024290C 0C0907D9 */  jal       func_80241F64_D8F1B4
/* D8FB60 80242910 0240202D */   daddu    $a0, $s2, $zero
/* D8FB64 80242914 08090A49 */  j         .L80242924
/* D8FB68 80242918 00000000 */   nop      
/* D8FB6C 8024291C 0C0129CF */  jal       func_8004A73C
/* D8FB70 80242920 0240202D */   daddu    $a0, $s2, $zero
.L80242924:
/* D8FB74 80242924 8FBF0048 */  lw        $ra, 0x48($sp)
/* D8FB78 80242928 8FB50044 */  lw        $s5, 0x44($sp)
/* D8FB7C 8024292C 8FB40040 */  lw        $s4, 0x40($sp)
/* D8FB80 80242930 8FB3003C */  lw        $s3, 0x3c($sp)
/* D8FB84 80242934 8FB20038 */  lw        $s2, 0x38($sp)
/* D8FB88 80242938 8FB10034 */  lw        $s1, 0x34($sp)
/* D8FB8C 8024293C 8FB00030 */  lw        $s0, 0x30($sp)
/* D8FB90 80242940 0000102D */  daddu     $v0, $zero, $zero
/* D8FB94 80242944 03E00008 */  jr        $ra
/* D8FB98 80242948 27BD0050 */   addiu    $sp, $sp, 0x50
/* D8FB9C 8024294C 00000000 */  nop       
