.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.11.1 */

glabel guScale
/* 42AE0 800676E0 3C014780 */  lui       $at, (0x47800000 >> 16)
/* 42AE4 800676E4 44812000 */  mtc1      $at, $f4
/* 42AE8 800676E8 44853000 */  mtc1      $a1, $f6
/* 42AEC 800676EC 00000000 */  nop
/* 42AF0 800676F0 46043202 */  mul.s     $f8, $f6, $f4
/* 42AF4 800676F4 4600428D */  trunc.w.s $f10, $f8
/* 42AF8 800676F8 44095000 */  mfc1      $t1, $f10
/* 42AFC 800676FC 00000000 */  nop
/* 42B00 80067700 00095402 */  srl       $t2, $t1, 16
/* 42B04 80067704 000A4400 */  sll       $t0, $t2, 16
/* 42B08 80067708 AC880000 */  sw        $t0, 0x0($a0)
/* 42B0C 8006770C 00095400 */  sll       $t2, $t1, 16
/* 42B10 80067710 AC8A0020 */  sw        $t2, 0x20($a0)
/* 42B14 80067714 44863000 */  mtc1      $a2, $f6
/* 42B18 80067718 00000000 */  nop
/* 42B1C 8006771C 46043202 */  mul.s     $f8, $f6, $f4
/* 42B20 80067720 4600428D */  trunc.w.s $f10, $f8
/* 42B24 80067724 44095000 */  mfc1      $t1, $f10
/* 42B28 80067728 00000000 */  nop
/* 42B2C 8006772C 00094402 */  srl       $t0, $t1, 16
/* 42B30 80067730 AC880008 */  sw        $t0, 0x8($a0)
/* 42B34 80067734 312AFFFF */  andi      $t2, $t1, 0xFFFF
/* 42B38 80067738 AC8A0028 */  sw        $t2, 0x28($a0)
/* 42B3C 8006773C 44873000 */  mtc1      $a3, $f6
/* 42B40 80067740 00000000 */  nop
/* 42B44 80067744 46043202 */  mul.s     $f8, $f6, $f4
/* 42B48 80067748 4600428D */  trunc.w.s $f10, $f8
/* 42B4C 8006774C 44095000 */  mfc1      $t1, $f10
/* 42B50 80067750 00000000 */  nop
/* 42B54 80067754 00095402 */  srl       $t2, $t1, 16
/* 42B58 80067758 000A4400 */  sll       $t0, $t2, 16
/* 42B5C 8006775C AC880014 */  sw        $t0, 0x14($a0)
/* 42B60 80067760 00095400 */  sll       $t2, $t1, 16
/* 42B64 80067764 AC8A0034 */  sw        $t2, 0x34($a0)
/* 42B68 80067768 24080001 */  addiu     $t0, $zero, 0x1
/* 42B6C 8006776C AC88001C */  sw        $t0, 0x1C($a0)
/* 42B70 80067770 AC800004 */  sw        $zero, 0x4($a0)
/* 42B74 80067774 AC80000C */  sw        $zero, 0xC($a0)
/* 42B78 80067778 AC800010 */  sw        $zero, 0x10($a0)
/* 42B7C 8006777C AC800018 */  sw        $zero, 0x18($a0)
/* 42B80 80067780 AC800024 */  sw        $zero, 0x24($a0)
/* 42B84 80067784 AC80002C */  sw        $zero, 0x2C($a0)
/* 42B88 80067788 AC800030 */  sw        $zero, 0x30($a0)
/* 42B8C 8006778C AC800038 */  sw        $zero, 0x38($a0)
/* 42B90 80067790 03E00008 */  jr        $ra
/* 42B94 80067794 AC80003C */   sw       $zero, 0x3C($a0)
/* 42B98 80067798 00000000 */  nop
/* 42B9C 8006779C 00000000 */  nop
