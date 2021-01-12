.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_80245808
/* 166068 80245808 27BDFFD8 */  addiu     $sp, $sp, -0x28
/* 16606C 8024580C AFB3001C */  sw        $s3, 0x1c($sp)
/* 166070 80245810 0080982D */  daddu     $s3, $a0, $zero
/* 166074 80245814 AFB00010 */  sw        $s0, 0x10($sp)
/* 166078 80245818 0000802D */  daddu     $s0, $zero, $zero
/* 16607C 8024581C AFB20018 */  sw        $s2, 0x18($sp)
/* 166080 80245820 3C128025 */  lui       $s2, %hi(D_8024C0B0)
/* 166084 80245824 2652C0B0 */  addiu     $s2, $s2, %lo(D_8024C0B0)
/* 166088 80245828 AFB10014 */  sw        $s1, 0x14($sp)
/* 16608C 8024582C 3C118025 */  lui       $s1, %hi(D_80249E20)
/* 166090 80245830 26319E20 */  addiu     $s1, $s1, %lo(D_80249E20)
/* 166094 80245834 AFBF0020 */  sw        $ra, 0x20($sp)
.L80245838:
/* 166098 80245838 8E240000 */  lw        $a0, ($s1)
/* 16609C 8024583C 26310004 */  addiu     $s1, $s1, 4
/* 1660A0 80245840 0C050529 */  jal       create_icon
/* 1660A4 80245844 26100001 */   addiu    $s0, $s0, 1
/* 1660A8 80245848 0040202D */  daddu     $a0, $v0, $zero
/* 1660AC 8024584C 24050080 */  addiu     $a1, $zero, 0x80
/* 1660B0 80245850 0C051280 */  jal       set_icon_flags
/* 1660B4 80245854 AE440000 */   sw       $a0, ($s2)
/* 1660B8 80245858 2A020014 */  slti      $v0, $s0, 0x14
/* 1660BC 8024585C 1440FFF6 */  bnez      $v0, .L80245838
/* 1660C0 80245860 26520004 */   addiu    $s2, $s2, 4
/* 1660C4 80245864 2410000D */  addiu     $s0, $zero, 0xd
/* 1660C8 80245868 3C028025 */  lui       $v0, %hi(D_8024A074)
/* 1660CC 8024586C 2442A074 */  addiu     $v0, $v0, %lo(D_8024A074)
.L80245870:
/* 1660D0 80245870 AC530010 */  sw        $s3, 0x10($v0)
/* 1660D4 80245874 2610FFFF */  addiu     $s0, $s0, -1
/* 1660D8 80245878 0601FFFD */  bgez      $s0, .L80245870
/* 1660DC 8024587C 2442FFDC */   addiu    $v0, $v0, -0x24
/* 1660E0 80245880 3C048025 */  lui       $a0, %hi(D_80249EA0)
/* 1660E4 80245884 24849EA0 */  addiu     $a0, $a0, %lo(D_80249EA0)
/* 1660E8 80245888 0C051FCC */  jal       func_80147F30
/* 1660EC 8024588C 2405000E */   addiu    $a1, $zero, 0xe
/* 1660F0 80245890 82620004 */  lb        $v0, 4($s3)
/* 1660F4 80245894 82630005 */  lb        $v1, 5($s3)
/* 1660F8 80245898 00430018 */  mult      $v0, $v1
/* 1660FC 8024589C 00003012 */  mflo      $a2
/* 166100 802458A0 82620006 */  lb        $v0, 6($s3)
/* 166104 802458A4 00000000 */  nop
/* 166108 802458A8 00C20018 */  mult      $a2, $v0
/* 16610C 802458AC 00002012 */  mflo      $a0
/* 166110 802458B0 82620002 */  lb        $v0, 2($s3)
/* 166114 802458B4 00000000 */  nop
/* 166118 802458B8 00620018 */  mult      $v1, $v0
/* 16611C 802458BC 00001812 */  mflo      $v1
/* 166120 802458C0 00831821 */  addu      $v1, $a0, $v1
/* 166124 802458C4 82640001 */  lb        $a0, 1($s3)
/* 166128 802458C8 8E620008 */  lw        $v0, 8($s3)
/* 16612C 802458CC 00641821 */  addu      $v1, $v1, $a0
/* 166130 802458D0 00431021 */  addu      $v0, $v0, $v1
/* 166134 802458D4 90420000 */  lbu       $v0, ($v0)
/* 166138 802458D8 82630004 */  lb        $v1, 4($s3)
/* 16613C 802458DC A2620003 */  sb        $v0, 3($s3)
/* 166140 802458E0 24020002 */  addiu     $v0, $zero, 2
/* 166144 802458E4 14620006 */  bne       $v1, $v0, .L80245900
/* 166148 802458E8 24020001 */   addiu    $v0, $zero, 1
/* 16614C 802458EC 3C038016 */  lui       $v1, %hi(gUIPanels)
/* 166150 802458F0 24639D50 */  addiu     $v1, $v1, %lo(gUIPanels)
/* 166154 802458F4 A46205AE */  sh        $v0, 0x5ae($v1)
/* 166158 802458F8 08091644 */  j         .L80245910
/* 16615C 802458FC 240200D3 */   addiu    $v0, $zero, 0xd3
.L80245900:
/* 166160 80245900 3C038016 */  lui       $v1, %hi(gUIPanels)
/* 166164 80245904 24639D50 */  addiu     $v1, $v1, %lo(gUIPanels)
/* 166168 80245908 A46205AE */  sh        $v0, 0x5ae($v1)
/* 16616C 8024590C 240200A2 */  addiu     $v0, $zero, 0xa2
.L80245910:
/* 166170 80245910 A46205B0 */  sh        $v0, 0x5b0($v1)
/* 166174 80245914 24020019 */  addiu     $v0, $zero, 0x19
/* 166178 80245918 A46205B2 */  sh        $v0, 0x5b2($v1)
/* 16617C 8024591C 3C048016 */  lui       $a0, %hi(gUIPanels)
/* 166180 80245920 24849D50 */  addiu     $a0, $a0, %lo(gUIPanels)
/* 166184 80245924 948205B0 */  lhu       $v0, 0x5b0($a0)
/* 166188 80245928 00021400 */  sll       $v0, $v0, 0x10
/* 16618C 8024592C 00021C03 */  sra       $v1, $v0, 0x10
/* 166190 80245930 000217C2 */  srl       $v0, $v0, 0x1f
/* 166194 80245934 00621821 */  addu      $v1, $v1, $v0
/* 166198 80245938 00032843 */  sra       $a1, $v1, 1
/* 16619C 8024593C 808305A3 */  lb        $v1, 0x5a3($a0)
/* 1661A0 80245940 2402FFFF */  addiu     $v0, $zero, -1
/* 1661A4 80245944 1062000B */  beq       $v1, $v0, .L80245974
/* 1661A8 80245948 248605AC */   addiu    $a2, $a0, 0x5ac
/* 1661AC 8024594C 00031140 */  sll       $v0, $v1, 5
/* 1661B0 80245950 00441021 */  addu      $v0, $v0, $a0
/* 1661B4 80245954 94420010 */  lhu       $v0, 0x10($v0)
/* 1661B8 80245958 00021400 */  sll       $v0, $v0, 0x10
/* 1661BC 8024595C 00021C03 */  sra       $v1, $v0, 0x10
/* 1661C0 80245960 000217C2 */  srl       $v0, $v0, 0x1f
/* 1661C4 80245964 00621821 */  addu      $v1, $v1, $v0
/* 1661C8 80245968 00031843 */  sra       $v1, $v1, 1
/* 1661CC 8024596C 08091661 */  j         .L80245984
/* 1661D0 80245970 00651023 */   subu     $v0, $v1, $a1
.L80245974:
/* 1661D4 80245974 240200A0 */  addiu     $v0, $zero, 0xa0
/* 1661D8 80245978 00451023 */  subu      $v0, $v0, $a1
/* 1661DC 8024597C 3C048016 */  lui       $a0, %hi(gUIPanels)
/* 1661E0 80245980 24849D50 */  addiu     $a0, $a0, %lo(gUIPanels)
.L80245984:
/* 1661E4 80245984 A4C20000 */  sh        $v0, ($a2)
/* 1661E8 80245988 948206D0 */  lhu       $v0, 0x6d0($a0)
/* 1661EC 8024598C 00021400 */  sll       $v0, $v0, 0x10
/* 1661F0 80245990 00021C03 */  sra       $v1, $v0, 0x10
/* 1661F4 80245994 000217C2 */  srl       $v0, $v0, 0x1f
/* 1661F8 80245998 00621821 */  addu      $v1, $v1, $v0
/* 1661FC 8024599C 00032843 */  sra       $a1, $v1, 1
/* 166200 802459A0 808306C3 */  lb        $v1, 0x6c3($a0)
/* 166204 802459A4 2402FFFF */  addiu     $v0, $zero, -1
/* 166208 802459A8 1062000B */  beq       $v1, $v0, .L802459D8
/* 16620C 802459AC 248606CC */   addiu    $a2, $a0, 0x6cc
/* 166210 802459B0 00031140 */  sll       $v0, $v1, 5
/* 166214 802459B4 00441021 */  addu      $v0, $v0, $a0
/* 166218 802459B8 94420010 */  lhu       $v0, 0x10($v0)
/* 16621C 802459BC 00021400 */  sll       $v0, $v0, 0x10
/* 166220 802459C0 00021C03 */  sra       $v1, $v0, 0x10
/* 166224 802459C4 000217C2 */  srl       $v0, $v0, 0x1f
/* 166228 802459C8 00621821 */  addu      $v1, $v1, $v0
/* 16622C 802459CC 00031843 */  sra       $v1, $v1, 1
/* 166230 802459D0 08091678 */  j         .L802459E0
/* 166234 802459D4 00651023 */   subu     $v0, $v1, $a1
.L802459D8:
/* 166238 802459D8 240200A0 */  addiu     $v0, $zero, 0xa0
/* 16623C 802459DC 00451023 */  subu      $v0, $v0, $a1
.L802459E0:
/* 166240 802459E0 A4C20000 */  sh        $v0, ($a2)
/* 166244 802459E4 82620004 */  lb        $v0, 4($s3)
/* 166248 802459E8 1040000C */  beqz      $v0, .L80245A1C
/* 16624C 802459EC 24040035 */   addiu    $a0, $zero, 0x35
/* 166250 802459F0 0C051F9F */  jal       func_80147E7C
/* 166254 802459F4 24050002 */   addiu    $a1, $zero, 2
/* 166258 802459F8 24040037 */  addiu     $a0, $zero, 0x37
/* 16625C 802459FC 0C051F9F */  jal       func_80147E7C
/* 166260 80245A00 24050002 */   addiu    $a1, $zero, 2
/* 166264 80245A04 24040033 */  addiu     $a0, $zero, 0x33
/* 166268 80245A08 0C051F9F */  jal       func_80147E7C
/* 16626C 80245A0C 24050002 */   addiu    $a1, $zero, 2
/* 166270 80245A10 24040034 */  addiu     $a0, $zero, 0x34
/* 166274 80245A14 0C051F9F */  jal       func_80147E7C
/* 166278 80245A18 24050002 */   addiu    $a1, $zero, 2
.L80245A1C:
/* 16627C 80245A1C 24020001 */  addiu     $v0, $zero, 1
/* 166280 80245A20 A2620000 */  sb        $v0, ($s3)
/* 166284 80245A24 8FBF0020 */  lw        $ra, 0x20($sp)
/* 166288 80245A28 8FB3001C */  lw        $s3, 0x1c($sp)
/* 16628C 80245A2C 8FB20018 */  lw        $s2, 0x18($sp)
/* 166290 80245A30 8FB10014 */  lw        $s1, 0x14($sp)
/* 166294 80245A34 8FB00010 */  lw        $s0, 0x10($sp)
/* 166298 80245A38 03E00008 */  jr        $ra
/* 16629C 80245A3C 27BD0028 */   addiu    $sp, $sp, 0x28
