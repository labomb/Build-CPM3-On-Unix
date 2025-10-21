
PATCH 1
******************************************************************

Licensed users are granted the right to include these changes
in CP/M Plus software.


CP/M Plus  V3.0
Patch 05, INITDIR patch 01, 2/14/83

Copyright  1983 by Digital Research
CP/M Plus and SID are trademarks of Digital Research.
Compiled February 1983

Program: INITDIR.COM
Products and Serial Numbers Affected: CP/M Plus V3.0
2-000-00001 through 2-000-00149

Error Description:

INITDIR refuses to allow reformatting of directory when there
is exactly the correct number of directory elements left. For
example, if the disk allows 64 directory elements and 48 of them are
used by existing files, then INITDIR does not create the time-date
elements even though it only needs 16 directory elements to do so.
However, if 47 or less are used then INITDIR successfully allocates
the time-date elements.

INITDIR loses one physical record of a file's directory when
the high water mark falls in the last sector and there is not enough
preceding empty directory elements to account for the new time-date
elements.

INITDIR fails to reset the time-date stamp flags in the
directory label if the label occurs in one of the first three
directory elements and the directory is already formatted for time-
date stamps.

Patch Procedure:

Make a back-up copy of INITDIR.COM before making any changes.
Use SID to patch INITDIR.COM with the following sequence of
commands:

A>pip initdir.sav=initdir.com
A>sid initdir.com
CP/M 3 SID - Version 3.0
NEXT MSZE PC END
7E00 7E00 0100 D4FF
#s51b
051B 23 0
051C D1 .
#s523
0523 2A 0
0524 95 0
0525 77 0
0526 EB 0
0527 2A .
#s573
0573 23 0
0574 D1 .
#l51b
051B NOP
051C POP D
051D CALL 3C08
0520 JP 05C5
0523 NOP
0524 NOP
0525 NOP
0526 NOP
0527 LHLD 778D
052A CALL 3C08
052D SHLD 7795
#m6f8,711,6f1
#s70b
070B 21 3a
070C E7 e8
070D 46 46
070E 96 b7
070F C2 fa
0710 37 18
0711 07 .
#l6f1
06F1 LHLD 7787
06F4 LDA 78DC
06F7 PUSH H
06F8 MOV L,A
06F9 ADD A
06FA SBB A
06FB MOV H,A
06FC DAD H
06FD DAD H
06FE DAD H
06FF DAD H
#l
0700 DAD H
0701 POP D
0702 DAD D
0703 MOV A,M
0704 LXI H,46E7
0707 SUB M
0708 JNZ 0737
070B LDA 46E8
070E ORA A
070F JM 0718
0712 LXI H,78E5
#winitdir.com
00FAH record(s) written.
#g0

A>patch initdir.com 1

CP/M 3 PATCH - Version 3.0
Do you want to indicate that patch 1
has been installed for INITDIR.COM? yes

Patch installed


A>


PATCH 2
******************************************************************

Licensed users are granted the right to include these changes
in CP/M Plus software.


CP/M Plus  V3.0
Patch 09, INITDIR patch 02, 5/1/83

Copyright  1983 by Digital Research
CP/M Plus and SID are trademarks of Digital Research.
Compiled July 1983


Program: INITDIR.COM
Products and Serial Numbers Affected: CP/M Plus V3.0
2-000-00001 through 2-000-xxxxx


Error Description:

INITDIR fails to terminate and reset a variable if the last known
XFCB cannot be found. INITDIR attempts to go beyond the directory
if the disk has more XFCB's than can be stored in memory on the
first pass.


Patch Procedure:

Make a back-up copy of INITDIR.COM before making any changes. Use
SID.. to patch INITDIR.COM with the following series of commands:


A>pip initdir.sav=initdir.com
A>sid initdir.com
CP/M 3 SID - Version 3.0
NEXT MSZE PC END
7E00 7E00 0100 D4FF
#a103
0103 shld 777A
0106 shld 7A7C
0109 jmp 0D01
010C lxi h,4661
010F push h
0110 mvi m,63
0112 inx h
0113 mvi m,46
0115 pop h
0116 call 1003
0119 .
#aCF8
0CF8 lxi h,0
0CFB jm 0D01
0CFE jmp 010C
0D01 .
#aEFD
0EFD dcx h
0EFE .
#winitdir.com
00FAh record(s) written.
#g0

A>patch initdir.com 2

CP/M 3 PATCH - Version 3.0
Do you want to indicate that patch 2
has been installed for INITDIR.COM? yes

Patch installed


A>


