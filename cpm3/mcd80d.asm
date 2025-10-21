;	title	mcd80d
	CSEG
;	September 14, 1982

	EXTRN	INITDIR

;	EXECUTION BEGINS HERE
;
;	JMP 	around	; JMP inserted by LINK

;	PATCH AREA, DATE, VERSION & SERIAL NOS.

	dw	0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0,0,0
	dw	0,0,0,0,0,0
	db  0
	db	'CP/M Version 3.0'
	db	'Copyright 1998, '
	db	'Caldera, Inc.   '
	db	'101198'	; version date day-month-year
	db	0,0,0,0		; patch bit map
	db	'654321'	; Serial no.
around:
	db	0,0,0

	END
