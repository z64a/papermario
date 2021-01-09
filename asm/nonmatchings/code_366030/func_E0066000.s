.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_E0066000
/* 366030 E0066000 27BDFFB0 */  addiu     $sp, $sp, -0x50
/* 366034 E0066004 F7B40038 */  sdc1      $f20, 0x38($sp)
/* 366038 E0066008 4485A000 */  mtc1      $a1, $f20
/* 36603C E006600C F7B60040 */  sdc1      $f22, 0x40($sp)
/* 366040 E0066010 4486B000 */  mtc1      $a2, $f22
/* 366044 E0066014 AFB1002C */  sw        $s1, 0x2c($sp)
/* 366048 E0066018 0080882D */  daddu     $s1, $a0, $zero
/* 36604C E006601C F7B80048 */  sdc1      $f24, 0x48($sp)
/* 366050 E0066020 4487C000 */  mtc1      $a3, $f24
/* 366054 E0066024 27A40010 */  addiu     $a0, $sp, 0x10
/* 366058 E0066028 AFB00028 */  sw        $s0, 0x28($sp)
/* 36605C E006602C 8FB00064 */  lw        $s0, 0x64($sp)
/* 366060 E0066030 3C02E006 */  lui       $v0, %hi(func_E0066490)
/* 366064 E0066034 24426490 */  addiu     $v0, $v0, %lo(func_E0066490)
/* 366068 E0066038 AFA20018 */  sw        $v0, 0x18($sp)
/* 36606C E006603C 3C02E006 */  lui       $v0, %hi(func_E0066498)
/* 366070 E0066040 24426498 */  addiu     $v0, $v0, %lo(func_E0066498)
/* 366074 E0066044 AFA2001C */  sw        $v0, 0x1c($sp)
/* 366078 E0066048 3C02E006 */  lui       $v0, %hi(func_E006672C)
/* 36607C E006604C 2442672C */  addiu     $v0, $v0, %lo(func_E006672C)
/* 366080 E0066050 AFA20020 */  sw        $v0, 0x20($sp)
/* 366084 E0066054 24020033 */  addiu     $v0, $zero, 0x33
/* 366088 E0066058 AFBF0034 */  sw        $ra, 0x34($sp)
/* 36608C E006605C AFB20030 */  sw        $s2, 0x30($sp)
/* 366090 E0066060 AFA00010 */  sw        $zero, 0x10($sp)
/* 366094 E0066064 AFA00024 */  sw        $zero, 0x24($sp)
/* 366098 E0066068 0C080124 */  jal       func_E0200490
/* 36609C E006606C AFA20014 */   sw       $v0, 0x14($sp)
/* 3660A0 E0066070 24040070 */  addiu     $a0, $zero, 0x70
/* 3660A4 E0066074 24030001 */  addiu     $v1, $zero, 1
/* 3660A8 E0066078 0040902D */  daddu     $s2, $v0, $zero
/* 3660AC E006607C 0C08012C */  jal       func_E02004B0
/* 3660B0 E0066080 AE430008 */   sw       $v1, 8($s2)
/* 3660B4 E0066084 0040202D */  daddu     $a0, $v0, $zero
/* 3660B8 E0066088 14800003 */  bnez      $a0, .LE0066098
/* 3660BC E006608C AE42000C */   sw       $v0, 0xc($s2)
.LE0066090:
/* 3660C0 E0066090 08019824 */  j         .LE0066090
/* 3660C4 E0066094 00000000 */   nop      
.LE0066098:
/* 3660C8 E0066098 AC910000 */  sw        $s1, ($a0)
/* 3660CC E006609C AC900028 */  sw        $s0, 0x28($a0)
/* 3660D0 E00660A0 AC80002C */  sw        $zero, 0x2c($a0)
/* 3660D4 E00660A4 AC800024 */  sw        $zero, 0x24($a0)
/* 3660D8 E00660A8 E4940010 */  swc1      $f20, 0x10($a0)
/* 3660DC E00660AC E4960014 */  swc1      $f22, 0x14($a0)
/* 3660E0 E00660B0 E4980018 */  swc1      $f24, 0x18($a0)
/* 3660E4 E00660B4 E4940004 */  swc1      $f20, 4($a0)
/* 3660E8 E00660B8 E4960008 */  swc1      $f22, 8($a0)
/* 3660EC E00660BC E498000C */  swc1      $f24, 0xc($a0)
/* 3660F0 E00660C0 C7A00060 */  lwc1      $f0, 0x60($sp)
/* 3660F4 E00660C4 3C014080 */  lui       $at, 0x4080
/* 3660F8 E00660C8 44811000 */  mtc1      $at, $f2
/* 3660FC E00660CC 3C014120 */  lui       $at, 0x4120
/* 366100 E00660D0 44812000 */  mtc1      $at, $f4
/* 366104 E00660D4 3C014248 */  lui       $at, 0x4248
/* 366108 E00660D8 44813000 */  mtc1      $at, $f6
/* 36610C E00660DC 240200FF */  addiu     $v0, $zero, 0xff
/* 366110 E00660E0 A0820068 */  sb        $v0, 0x68($a0)
/* 366114 E00660E4 A0820069 */  sb        $v0, 0x69($a0)
/* 366118 E00660E8 A082006B */  sb        $v0, 0x6b($a0)
/* 36611C E00660EC A082006C */  sb        $v0, 0x6c($a0)
/* 366120 E00660F0 A082006D */  sb        $v0, 0x6d($a0)
/* 366124 E00660F4 E4800020 */  swc1      $f0, 0x20($a0)
/* 366128 E00660F8 44800000 */  mtc1      $zero, $f0
/* 36612C E00660FC 2E22000F */  sltiu     $v0, $s1, 0xf
/* 366130 E0066100 A080006A */  sb        $zero, 0x6a($a0)
/* 366134 E0066104 E482005C */  swc1      $f2, 0x5c($a0)
/* 366138 E0066108 E484001C */  swc1      $f4, 0x1c($a0)
/* 36613C E006610C E4860060 */  swc1      $f6, 0x60($a0)
/* 366140 E0066110 E4800044 */  swc1      $f0, 0x44($a0)
/* 366144 E0066114 E4800040 */  swc1      $f0, 0x40($a0)
/* 366148 E0066118 E480004C */  swc1      $f0, 0x4c($a0)
/* 36614C E006611C E4800048 */  swc1      $f0, 0x48($a0)
/* 366150 E0066120 E4800034 */  swc1      $f0, 0x34($a0)
/* 366154 E0066124 E4800030 */  swc1      $f0, 0x30($a0)
/* 366158 E0066128 E480003C */  swc1      $f0, 0x3c($a0)
/* 36615C E006612C E4800038 */  swc1      $f0, 0x38($a0)
/* 366160 E0066130 E4800058 */  swc1      $f0, 0x58($a0)
/* 366164 E0066134 E4800050 */  swc1      $f0, 0x50($a0)
/* 366168 E0066138 E4800054 */  swc1      $f0, 0x54($a0)
/* 36616C E006613C 104000BB */  beqz      $v0, .LE006642C
/* 366170 E0066140 E4800064 */   swc1     $f0, 0x64($a0)
/* 366174 E0066144 00111080 */  sll       $v0, $s1, 2
/* 366178 E0066148 3C01E006 */  lui       $at, %hi(D_E0066CE0)
/* 36617C E006614C 00220821 */  addu      $at, $at, $v0
/* 366180 E0066150 8C226CE0 */  lw        $v0, %lo(D_E0066CE0)($at)
/* 366184 E0066154 00400008 */  jr        $v0
/* 366188 E0066158 00000000 */   nop      
/* 36618C E006615C 3C014300 */  lui       $at, 0x4300
/* 366190 E0066160 44810000 */  mtc1      $at, $f0
/* 366194 E0066164 3C01428C */  lui       $at, 0x428c
/* 366198 E0066168 44812000 */  mtc1      $at, $f4
/* 36619C E006616C 3C01C2C8 */  lui       $at, 0xc2c8
/* 3661A0 E0066170 44813000 */  mtc1      $at, $f6
/* 3661A4 E0066174 44901000 */  mtc1      $s0, $f2
/* 3661A8 E0066178 00000000 */  nop       
/* 3661AC E006617C 468010A0 */  cvt.s.w   $f2, $f2
/* 3661B0 E0066180 E4800040 */  swc1      $f0, 0x40($a0)
/* 3661B4 E0066184 46020003 */  div.s     $f0, $f0, $f2
/* 3661B8 E0066188 E4800044 */  swc1      $f0, 0x44($a0)
/* 3661BC E006618C E4840060 */  swc1      $f4, 0x60($a0)
/* 3661C0 E0066190 0801991A */  j         .LE0066468
/* 3661C4 E0066194 E4860064 */   swc1     $f6, 0x64($a0)
/* 3661C8 E0066198 3C0140E0 */  lui       $at, 0x40e0
/* 3661CC E006619C 44810000 */  mtc1      $at, $f0
/* 3661D0 E00661A0 3C01C040 */  lui       $at, 0xc040
/* 3661D4 E00661A4 44811000 */  mtc1      $at, $f2
/* 3661D8 E00661A8 3C014040 */  lui       $at, 0x4040
/* 3661DC E00661AC 44812000 */  mtc1      $at, $f4
/* 3661E0 E00661B0 3C01C0E0 */  lui       $at, 0xc0e0
/* 3661E4 E00661B4 44813000 */  mtc1      $at, $f6
/* 3661E8 E00661B8 08019907 */  j         .LE006641C
/* 3661EC E00661BC E4800034 */   swc1     $f0, 0x34($a0)
/* 3661F0 E00661C0 3C014380 */  lui       $at, 0x4380
/* 3661F4 E00661C4 44810000 */  mtc1      $at, $f0
/* 3661F8 E00661C8 3C0140E0 */  lui       $at, 0x40e0
/* 3661FC E00661CC 44812000 */  mtc1      $at, $f4
/* 366200 E00661D0 3C01C040 */  lui       $at, 0xc040
/* 366204 E00661D4 44811000 */  mtc1      $at, $f2
/* 366208 E00661D8 3C01C080 */  lui       $at, 0xc080
/* 36620C E00661DC 44813000 */  mtc1      $at, $f6
/* 366210 E00661E0 240200EB */  addiu     $v0, $zero, 0xeb
/* 366214 E00661E4 A0820068 */  sb        $v0, 0x68($a0)
/* 366218 E00661E8 A0820069 */  sb        $v0, 0x69($a0)
/* 36621C E00661EC A082006A */  sb        $v0, 0x6a($a0)
/* 366220 E00661F0 E4800040 */  swc1      $f0, 0x40($a0)
/* 366224 E00661F4 E4800048 */  swc1      $f0, 0x48($a0)
/* 366228 E00661F8 E4840034 */  swc1      $f4, 0x34($a0)
/* 36622C E00661FC E4820044 */  swc1      $f2, 0x44($a0)
/* 366230 E0066200 E482003C */  swc1      $f2, 0x3c($a0)
/* 366234 E0066204 0801991A */  j         .LE0066468
/* 366238 E0066208 E486004C */   swc1     $f6, 0x4c($a0)
/* 36623C E006620C 3C0140E0 */  lui       $at, 0x40e0
/* 366240 E0066210 44811000 */  mtc1      $at, $f2
/* 366244 E0066214 3C01C040 */  lui       $at, 0xc040
/* 366248 E0066218 44810000 */  mtc1      $at, $f0
/* 36624C E006621C 3C01C0A0 */  lui       $at, 0xc0a0
/* 366250 E0066220 44812000 */  mtc1      $at, $f4
/* 366254 E0066224 24020014 */  addiu     $v0, $zero, 0x14
/* 366258 E0066228 A0820068 */  sb        $v0, 0x68($a0)
/* 36625C E006622C 240200C8 */  addiu     $v0, $zero, 0xc8
/* 366260 E0066230 A0820069 */  sb        $v0, 0x69($a0)
/* 366264 E0066234 24020020 */  addiu     $v0, $zero, 0x20
/* 366268 E0066238 080198E6 */  j         .LE0066398
/* 36626C E006623C A082006A */   sb       $v0, 0x6a($a0)
/* 366270 E0066240 3C0140E0 */  lui       $at, 0x40e0
/* 366274 E0066244 44810000 */  mtc1      $at, $f0
/* 366278 E0066248 3C014040 */  lui       $at, 0x4040
/* 36627C E006624C 44811000 */  mtc1      $at, $f2
/* 366280 E0066250 3C0140A0 */  lui       $at, 0x40a0
/* 366284 E0066254 44812000 */  mtc1      $at, $f4
/* 366288 E0066258 E4800034 */  swc1      $f0, 0x34($a0)
/* 36628C E006625C E4820044 */  swc1      $f2, 0x44($a0)
/* 366290 E0066260 E482003C */  swc1      $f2, 0x3c($a0)
/* 366294 E0066264 0801991A */  j         .LE0066468
/* 366298 E0066268 E484004C */   swc1     $f4, 0x4c($a0)
/* 36629C E006626C 3C0140E0 */  lui       $at, 0x40e0
/* 3662A0 E0066270 44810000 */  mtc1      $at, $f0
/* 3662A4 E0066274 3C014040 */  lui       $at, 0x4040
/* 3662A8 E0066278 44811000 */  mtc1      $at, $f2
/* 3662AC E006627C 3C01C040 */  lui       $at, 0xc040
/* 3662B0 E0066280 44812000 */  mtc1      $at, $f4
/* 3662B4 E0066284 3C014080 */  lui       $at, 0x4080
/* 3662B8 E0066288 44813000 */  mtc1      $at, $f6
/* 3662BC E006628C 240200EB */  addiu     $v0, $zero, 0xeb
/* 3662C0 E0066290 A0820068 */  sb        $v0, 0x68($a0)
/* 3662C4 E0066294 A0820069 */  sb        $v0, 0x69($a0)
/* 3662C8 E0066298 08019906 */  j         .LE0066418
/* 3662CC E006629C A082006A */   sb       $v0, 0x6a($a0)
/* 3662D0 E00662A0 3C0140E0 */  lui       $at, 0x40e0
/* 3662D4 E00662A4 44810000 */  mtc1      $at, $f0
/* 3662D8 E00662A8 3C014040 */  lui       $at, 0x4040
/* 3662DC E00662AC 44811000 */  mtc1      $at, $f2
/* 3662E0 E00662B0 3C01C040 */  lui       $at, 0xc040
/* 3662E4 E00662B4 44812000 */  mtc1      $at, $f4
/* 3662E8 E00662B8 3C0140A0 */  lui       $at, 0x40a0
/* 3662EC E00662BC 44813000 */  mtc1      $at, $f6
/* 3662F0 E00662C0 240200FF */  addiu     $v0, $zero, 0xff
/* 3662F4 E00662C4 A0820068 */  sb        $v0, 0x68($a0)
/* 3662F8 E00662C8 24020064 */  addiu     $v0, $zero, 0x64
/* 3662FC E00662CC A0820069 */  sb        $v0, 0x69($a0)
/* 366300 E00662D0 24020020 */  addiu     $v0, $zero, 0x20
/* 366304 E00662D4 08019906 */  j         .LE0066418
/* 366308 E00662D8 A082006A */   sb       $v0, 0x6a($a0)
/* 36630C E00662DC 240300D7 */  addiu     $v1, $zero, 0xd7
/* 366310 E00662E0 3C0140E0 */  lui       $at, 0x40e0
/* 366314 E00662E4 44811000 */  mtc1      $at, $f2
/* 366318 E00662E8 3C01C040 */  lui       $at, 0xc040
/* 36631C E00662EC 44810000 */  mtc1      $at, $f0
/* 366320 E00662F0 3C01C000 */  lui       $at, 0xc000
/* 366324 E00662F4 44812000 */  mtc1      $at, $f4
/* 366328 E00662F8 240200D0 */  addiu     $v0, $zero, 0xd0
/* 36632C E00662FC A0820069 */  sb        $v0, 0x69($a0)
/* 366330 E0066300 240200FF */  addiu     $v0, $zero, 0xff
/* 366334 E0066304 A0830068 */  sb        $v1, 0x68($a0)
/* 366338 E0066308 A080006A */  sb        $zero, 0x6a($a0)
/* 36633C E006630C A083006B */  sb        $v1, 0x6b($a0)
/* 366340 E0066310 080198E5 */  j         .LE0066394
/* 366344 E0066314 A082006C */   sb       $v0, 0x6c($a0)
/* 366348 E0066318 3C014300 */  lui       $at, 0x4300
/* 36634C E006631C 44810000 */  mtc1      $at, $f0
/* 366350 E0066320 3C01C2C8 */  lui       $at, 0xc2c8
/* 366354 E0066324 44812000 */  mtc1      $at, $f4
/* 366358 E0066328 44901000 */  mtc1      $s0, $f2
/* 36635C E006632C 00000000 */  nop       
/* 366360 E0066330 468010A0 */  cvt.s.w   $f2, $f2
/* 366364 E0066334 E4800040 */  swc1      $f0, 0x40($a0)
/* 366368 E0066338 46020003 */  div.s     $f0, $f0, $f2
/* 36636C E006633C E4800044 */  swc1      $f0, 0x44($a0)
/* 366370 E0066340 0801991A */  j         .LE0066468
/* 366374 E0066344 E4840064 */   swc1     $f4, 0x64($a0)
/* 366378 E0066348 24020020 */  addiu     $v0, $zero, 0x20
/* 36637C E006634C 3C0140E0 */  lui       $at, 0x40e0
/* 366380 E0066350 44811000 */  mtc1      $at, $f2
/* 366384 E0066354 3C01C040 */  lui       $at, 0xc040
/* 366388 E0066358 44810000 */  mtc1      $at, $f0
/* 36638C E006635C 3C01C000 */  lui       $at, 0xc000
/* 366390 E0066360 44812000 */  mtc1      $at, $f4
/* 366394 E0066364 240300FF */  addiu     $v1, $zero, 0xff
/* 366398 E0066368 A0820069 */  sb        $v0, 0x69($a0)
/* 36639C E006636C 24020007 */  addiu     $v0, $zero, 7
/* 3663A0 E0066370 A0800068 */  sb        $zero, 0x68($a0)
/* 3663A4 E0066374 A0820068 */  sb        $v0, 0x68($a0)
/* 3663A8 E0066378 240200D8 */  addiu     $v0, $zero, 0xd8
/* 3663AC E006637C A083006A */  sb        $v1, 0x6a($a0)
/* 3663B0 E0066380 A082006A */  sb        $v0, 0x6a($a0)
/* 3663B4 E0066384 240200E4 */  addiu     $v0, $zero, 0xe4
/* 3663B8 E0066388 A0800069 */  sb        $zero, 0x69($a0)
/* 3663BC E006638C A082006B */  sb        $v0, 0x6b($a0)
/* 3663C0 E0066390 A083006C */  sb        $v1, 0x6c($a0)
.LE0066394:
/* 3663C4 E0066394 A080006D */  sb        $zero, 0x6d($a0)
.LE0066398:
/* 3663C8 E0066398 E4820034 */  swc1      $f2, 0x34($a0)
/* 3663CC E006639C E4800044 */  swc1      $f0, 0x44($a0)
/* 3663D0 E00663A0 E480003C */  swc1      $f0, 0x3c($a0)
/* 3663D4 E00663A4 0801991A */  j         .LE0066468
/* 3663D8 E00663A8 E484004C */   swc1     $f4, 0x4c($a0)
/* 3663DC E00663AC 3C0140E0 */  lui       $at, 0x40e0
/* 3663E0 E00663B0 44810000 */  mtc1      $at, $f0
/* 3663E4 E00663B4 3C014100 */  lui       $at, 0x4100
/* 3663E8 E00663B8 44811000 */  mtc1      $at, $f2
/* 3663EC E00663BC 3C01C040 */  lui       $at, 0xc040
/* 3663F0 E00663C0 44812000 */  mtc1      $at, $f4
/* 3663F4 E00663C4 3C0140C0 */  lui       $at, 0x40c0
/* 3663F8 E00663C8 44813000 */  mtc1      $at, $f6
/* 3663FC E00663CC 24020007 */  addiu     $v0, $zero, 7
/* 366400 E00663D0 A0820068 */  sb        $v0, 0x68($a0)
/* 366404 E00663D4 240200D8 */  addiu     $v0, $zero, 0xd8
/* 366408 E00663D8 A082006A */  sb        $v0, 0x6a($a0)
/* 36640C E00663DC 240200E4 */  addiu     $v0, $zero, 0xe4
/* 366410 E00663E0 A082006B */  sb        $v0, 0x6b($a0)
/* 366414 E00663E4 240200FF */  addiu     $v0, $zero, 0xff
/* 366418 E00663E8 A0800069 */  sb        $zero, 0x69($a0)
/* 36641C E00663EC A082006C */  sb        $v0, 0x6c($a0)
/* 366420 E00663F0 08019906 */  j         .LE0066418
/* 366424 E00663F4 A080006D */   sb       $zero, 0x6d($a0)
/* 366428 E00663F8 3C0140E0 */  lui       $at, 0x40e0
/* 36642C E00663FC 44810000 */  mtc1      $at, $f0
/* 366430 E0066400 3C01C040 */  lui       $at, 0xc040
/* 366434 E0066404 44811000 */  mtc1      $at, $f2
/* 366438 E0066408 3C01C0A0 */  lui       $at, 0xc0a0
/* 36643C E006640C 44812000 */  mtc1      $at, $f4
/* 366440 E0066410 3C01C080 */  lui       $at, 0xc080
/* 366444 E0066414 44813000 */  mtc1      $at, $f6
.LE0066418:
/* 366448 E0066418 E4800034 */  swc1      $f0, 0x34($a0)
.LE006641C:
/* 36644C E006641C E4820044 */  swc1      $f2, 0x44($a0)
/* 366450 E0066420 E484003C */  swc1      $f4, 0x3c($a0)
/* 366454 E0066424 0801991A */  j         .LE0066468
/* 366458 E0066428 E486004C */   swc1     $f6, 0x4c($a0)
.LE006642C:
/* 36645C E006642C 3C014080 */  lui       $at, 0x4080
/* 366460 E0066430 44810000 */  mtc1      $at, $f0
/* 366464 E0066434 3C0140E0 */  lui       $at, 0x40e0
/* 366468 E0066438 44811000 */  mtc1      $at, $f2
/* 36646C E006643C 3C014060 */  lui       $at, 0x4060
/* 366470 E0066440 44812000 */  mtc1      $at, $f4
/* 366474 E0066444 3C0141A0 */  lui       $at, 0x41a0
/* 366478 E0066448 44813000 */  mtc1      $at, $f6
/* 36647C E006644C 3C01C2D4 */  lui       $at, 0xc2d4
/* 366480 E0066450 44814000 */  mtc1      $at, $f8
/* 366484 E0066454 E4800040 */  swc1      $f0, 0x40($a0)
/* 366488 E0066458 E4820034 */  swc1      $f2, 0x34($a0)
/* 36648C E006645C E484004C */  swc1      $f4, 0x4c($a0)
/* 366490 E0066460 E4860060 */  swc1      $f6, 0x60($a0)
/* 366494 E0066464 E4880064 */  swc1      $f8, 0x64($a0)
.LE0066468:
/* 366498 E0066468 0240102D */  daddu     $v0, $s2, $zero
/* 36649C E006646C 8FBF0034 */  lw        $ra, 0x34($sp)
/* 3664A0 E0066470 8FB20030 */  lw        $s2, 0x30($sp)
/* 3664A4 E0066474 8FB1002C */  lw        $s1, 0x2c($sp)
/* 3664A8 E0066478 8FB00028 */  lw        $s0, 0x28($sp)
/* 3664AC E006647C D7B80048 */  ldc1      $f24, 0x48($sp)
/* 3664B0 E0066480 D7B60040 */  ldc1      $f22, 0x40($sp)
/* 3664B4 E0066484 D7B40038 */  ldc1      $f20, 0x38($sp)
/* 3664B8 E0066488 03E00008 */  jr        $ra
/* 3664BC E006648C 27BD0050 */   addiu    $sp, $sp, 0x50
