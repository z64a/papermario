.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel pause_badges_try_equip
/* 13A678 80247338 27BDFFE0 */  addiu     $sp, $sp, -0x20
/* 13A67C 8024733C AFB00010 */  sw        $s0, 0x10($sp)
/* 13A680 80247340 0080802D */  daddu     $s0, $a0, $zero
/* 13A684 80247344 AFB10014 */  sw        $s1, 0x14($sp)
/* 13A688 80247348 3C118011 */  lui       $s1, %hi(gPlayerData)
/* 13A68C 8024734C 2631F290 */  addiu     $s1, $s1, %lo(gPlayerData)
/* 13A690 80247350 26250208 */  addiu     $a1, $s1, 0x208
/* 13A694 80247354 00042400 */  sll       $a0, $a0, 0x10
/* 13A698 80247358 00042403 */  sra       $a0, $a0, 0x10
/* 13A69C 8024735C 24027FFE */  addiu     $v0, $zero, 0x7ffe
/* 13A6A0 80247360 14820002 */  bne       $a0, $v0, .L8024736C
/* 13A6A4 80247364 AFBF0018 */   sw       $ra, 0x18($sp)
/* 13A6A8 80247368 0000802D */  daddu     $s0, $zero, $zero
.L8024736C:
/* 13A6AC 8024736C 00101400 */  sll       $v0, $s0, 0x10
/* 13A6B0 80247370 00021403 */  sra       $v0, $v0, 0x10
/* 13A6B4 80247374 24037FFF */  addiu     $v1, $zero, 0x7fff
/* 13A6B8 80247378 50430001 */  beql      $v0, $v1, .L80247380
/* 13A6BC 8024737C 0000802D */   daddu    $s0, $zero, $zero
.L80247380:
/* 13A6C0 80247380 00101400 */  sll       $v0, $s0, 0x10
/* 13A6C4 80247384 00021403 */  sra       $v0, $v0, 0x10
/* 13A6C8 80247388 1040001D */  beqz      $v0, .L80247400
/* 13A6CC 8024738C 0000202D */   daddu    $a0, $zero, $zero
/* 13A6D0 80247390 0040182D */  daddu     $v1, $v0, $zero
.L80247394:
/* 13A6D4 80247394 84A20000 */  lh        $v0, ($a1)
/* 13A6D8 80247398 1043001B */  beq       $v0, $v1, .L80247408
/* 13A6DC 8024739C 24840001 */   addiu    $a0, $a0, 1
/* 13A6E0 802473A0 28820040 */  slti      $v0, $a0, 0x40
/* 13A6E4 802473A4 1440FFFB */  bnez      $v0, .L80247394
/* 13A6E8 802473A8 24A50002 */   addiu    $a1, $a1, 2
/* 13A6EC 802473AC 0C0911FD */  jal       pause_get_total_equipped_bp_cost
/* 13A6F0 802473B0 00000000 */   nop
/* 13A6F4 802473B4 0040202D */  daddu     $a0, $v0, $zero
/* 13A6F8 802473B8 00101400 */  sll       $v0, $s0, 0x10
/* 13A6FC 802473BC 00021403 */  sra       $v0, $v0, 0x10
/* 13A700 802473C0 10400013 */  beqz      $v0, .L80247410
/* 13A704 802473C4 00021140 */   sll      $v0, $v0, 5
/* 13A708 802473C8 3C038008 */  lui       $v1, %hi(gItemTable+0x1A)
/* 13A70C 802473CC 00621821 */  addu      $v1, $v1, $v0
/* 13A710 802473D0 906378FA */  lbu       $v1, %lo(gItemTable+0x1A)($v1)
/* 13A714 802473D4 00031080 */  sll       $v0, $v1, 2
/* 13A718 802473D8 00431021 */  addu      $v0, $v0, $v1
/* 13A71C 802473DC 00021080 */  sll       $v0, $v0, 2
/* 13A720 802473E0 3C018009 */  lui       $at, %hi(D_8008F072)
/* 13A724 802473E4 00220821 */  addu      $at, $at, $v0
/* 13A728 802473E8 8022F072 */  lb        $v0, %lo(D_8008F072)($at)
/* 13A72C 802473EC 82230008 */  lb        $v1, 8($s1)
/* 13A730 802473F0 00821021 */  addu      $v0, $a0, $v0
/* 13A734 802473F4 0062182A */  slt       $v1, $v1, $v0
/* 13A738 802473F8 10600006 */  beqz      $v1, .L80247414
/* 13A73C 802473FC 26250208 */   addiu    $a1, $s1, 0x208
.L80247400:
/* 13A740 80247400 08091D11 */  j         .L80247444
/* 13A744 80247404 24020001 */   addiu    $v0, $zero, 1
.L80247408:
/* 13A748 80247408 08091D11 */  j         .L80247444
/* 13A74C 8024740C 0000102D */   daddu    $v0, $zero, $zero
.L80247410:
/* 13A750 80247410 26250208 */  addiu     $a1, $s1, 0x208
.L80247414:
/* 13A754 80247414 0000202D */  daddu     $a0, $zero, $zero
.L80247418:
/* 13A758 80247418 84A20000 */  lh        $v0, ($a1)
/* 13A75C 8024741C 50400005 */  beql      $v0, $zero, .L80247434
/* 13A760 80247420 A4B00000 */   sh       $s0, ($a1)
/* 13A764 80247424 24840001 */  addiu     $a0, $a0, 1
/* 13A768 80247428 28820040 */  slti      $v0, $a0, 0x40
/* 13A76C 8024742C 1440FFFA */  bnez      $v0, .L80247418
/* 13A770 80247430 24A50002 */   addiu    $a1, $a1, 2
.L80247434:
/* 13A774 80247434 24030040 */  addiu     $v1, $zero, 0x40
/* 13A778 80247438 10830002 */  beq       $a0, $v1, .L80247444
/* 13A77C 8024743C 24020002 */   addiu    $v0, $zero, 2
/* 13A780 80247440 24020003 */  addiu     $v0, $zero, 3
.L80247444:
/* 13A784 80247444 8FBF0018 */  lw        $ra, 0x18($sp)
/* 13A788 80247448 8FB10014 */  lw        $s1, 0x14($sp)
/* 13A78C 8024744C 8FB00010 */  lw        $s0, 0x10($sp)
/* 13A790 80247450 03E00008 */  jr        $ra
/* 13A794 80247454 27BD0020 */   addiu    $sp, $sp, 0x20
