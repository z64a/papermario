.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_802401DC_A4879C
/* A4879C 802401DC 27BDFFD8 */  addiu     $sp, $sp, -0x28
/* A487A0 802401E0 AFB3001C */  sw        $s3, 0x1c($sp)
/* A487A4 802401E4 0080982D */  daddu     $s3, $a0, $zero
/* A487A8 802401E8 AFBF0020 */  sw        $ra, 0x20($sp)
/* A487AC 802401EC AFB20018 */  sw        $s2, 0x18($sp)
/* A487B0 802401F0 AFB10014 */  sw        $s1, 0x14($sp)
/* A487B4 802401F4 AFB00010 */  sw        $s0, 0x10($sp)
/* A487B8 802401F8 8E710148 */  lw        $s1, 0x148($s3)
/* A487BC 802401FC 86240008 */  lh        $a0, 8($s1)
/* A487C0 80240200 0C00EABB */  jal       get_npc_unsafe
/* A487C4 80240204 00A0902D */   daddu    $s2, $a1, $zero
/* A487C8 80240208 0040802D */  daddu     $s0, $v0, $zero
/* A487CC 8024020C 8602008E */  lh        $v0, 0x8e($s0)
/* A487D0 80240210 9603008E */  lhu       $v1, 0x8e($s0)
/* A487D4 80240214 18400005 */  blez      $v0, .L8024022C
/* A487D8 80240218 2462FFFF */   addiu    $v0, $v1, -1
/* A487DC 8024021C A602008E */  sh        $v0, 0x8e($s0)
/* A487E0 80240220 00021400 */  sll       $v0, $v0, 0x10
/* A487E4 80240224 1C400033 */  bgtz      $v0, .L802402F4
/* A487E8 80240228 00000000 */   nop      
.L8024022C:
/* A487EC 8024022C 8602008C */  lh        $v0, 0x8c($s0)
/* A487F0 80240230 14400030 */  bnez      $v0, .L802402F4
/* A487F4 80240234 00000000 */   nop      
/* A487F8 80240238 8E2200CC */  lw        $v0, 0xcc($s1)
/* A487FC 8024023C 8C420024 */  lw        $v0, 0x24($v0)
/* A48800 80240240 AE020028 */  sw        $v0, 0x28($s0)
/* A48804 80240244 C6400018 */  lwc1      $f0, 0x18($s2)
/* A48808 80240248 E6000018 */  swc1      $f0, 0x18($s0)
/* A4880C 8024024C 8E230088 */  lw        $v1, 0x88($s1)
/* A48810 80240250 24020005 */  addiu     $v0, $zero, 5
/* A48814 80240254 10620005 */  beq       $v1, $v0, .L8024026C
/* A48818 80240258 00000000 */   nop      
/* A4881C 8024025C 10600003 */  beqz      $v1, .L8024026C
/* A48820 80240260 24020001 */   addiu    $v0, $zero, 1
/* A48824 80240264 14620006 */  bne       $v1, $v0, .L80240280
/* A48828 80240268 00000000 */   nop      
.L8024026C:
/* A4882C 8024026C 8E220084 */  lw        $v0, 0x84($s1)
/* A48830 80240270 00021FC2 */  srl       $v1, $v0, 0x1f
/* A48834 80240274 00431021 */  addu      $v0, $v0, $v1
/* A48838 80240278 00021043 */  sra       $v0, $v0, 1
/* A4883C 8024027C A60200A8 */  sh        $v0, 0xa8($s0)
.L80240280:
/* A48840 80240280 3C02800F */  lui       $v0, %hi(gPlayerStatusPtr)
/* A48844 80240284 8C427B30 */  lw        $v0, %lo(gPlayerStatusPtr)($v0)
/* A48848 80240288 C60C0038 */  lwc1      $f12, 0x38($s0)
/* A4884C 8024028C C60E0040 */  lwc1      $f14, 0x40($s0)
/* A48850 80240290 8C460028 */  lw        $a2, 0x28($v0)
/* A48854 80240294 0C00A7B5 */  jal       dist2D
/* A48858 80240298 8C470030 */   lw       $a3, 0x30($v0)
/* A4885C 8024029C C6020018 */  lwc1      $f2, 0x18($s0)
/* A48860 802402A0 46020003 */  div.s     $f0, $f0, $f2
/* A48864 802402A4 3C018024 */  lui       $at, %hi(func_80243880_95EA80)
/* A48868 802402A8 D4223880 */  ldc1      $f2, %lo(func_80243880_95EA80)($at)
/* A4886C 802402AC 46000021 */  cvt.d.s   $f0, $f0
/* A48870 802402B0 46220000 */  add.d     $f0, $f0, $f2
/* A48874 802402B4 4620010D */  trunc.w.d $f4, $f0
/* A48878 802402B8 44022000 */  mfc1      $v0, $f4
/* A4887C 802402BC 00000000 */  nop       
/* A48880 802402C0 A602008E */  sh        $v0, 0x8e($s0)
/* A48884 802402C4 00021400 */  sll       $v0, $v0, 0x10
/* A48888 802402C8 8E230078 */  lw        $v1, 0x78($s1)
/* A4888C 802402CC 00021403 */  sra       $v0, $v0, 0x10
/* A48890 802402D0 0043102A */  slt       $v0, $v0, $v1
/* A48894 802402D4 10400003 */  beqz      $v0, .L802402E4
/* A48898 802402D8 00000000 */   nop      
/* A4889C 802402DC 9622007A */  lhu       $v0, 0x7a($s1)
/* A488A0 802402E0 A602008E */  sh        $v0, 0x8e($s0)
.L802402E4:
/* A488A4 802402E4 8602008E */  lh        $v0, 0x8e($s0)
/* A488A8 802402E8 AE22007C */  sw        $v0, 0x7c($s1)
/* A488AC 802402EC 2402000E */  addiu     $v0, $zero, 0xe
/* A488B0 802402F0 AE620070 */  sw        $v0, 0x70($s3)
.L802402F4:
/* A488B4 802402F4 8FBF0020 */  lw        $ra, 0x20($sp)
/* A488B8 802402F8 8FB3001C */  lw        $s3, 0x1c($sp)
/* A488BC 802402FC 8FB20018 */  lw        $s2, 0x18($sp)
/* A488C0 80240300 8FB10014 */  lw        $s1, 0x14($sp)
/* A488C4 80240304 8FB00010 */  lw        $s0, 0x10($sp)
/* A488C8 80240308 03E00008 */  jr        $ra
/* A488CC 8024030C 27BD0028 */   addiu    $sp, $sp, 0x28
