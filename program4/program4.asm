; Programmer: Ryan Kim
; Class:      COSC 211
; ID:         E01724040
; Program#:   4

	.ORIG x3000      ;start at x3000
	AND R0, R0, #0   ;clear R0
	AND R1, R1, #0   ;clear R1
	AND R2, R2, #0   ;clear R2
LOOP	LEA R0, PROMPT   ;load prompt into R0
	PUTS             ;display prompt
	CHAR GETC        ;get character
	PUTC             ;display character on screen
	ADD R0, R0, #-15 ;remove ascii offset
	ADD R0, R0, #-15
	ADD R0, R0, #-15
	ADD R0, R0, #-3
	BRZ SAVE         ;break if zero
	LD R2, STORE     ;ld x7000 into R2
	ADD R2, R2, R1   ;add R1 to R2
	STR R0, R2, #0   ;store R0 in 7000 range
	ADD R1, R1, #1   ;increment R1
	BRNZP LOOP       ;continue loop

STORE   STR R0, R0, #0   ;x7000
SAVE    ADD R1, R1, #-1  ;subract 1 from R1
	ST R1, SAVER1    ;save R1
BREAK	LD R1, SAVER1    ;load R1
	AND R0, R0, #0   ;clear R0
	AND R2, R2, #0   ;clear R2
	AND R4, R4, #0   ;clear R4
	AND R5, R5, #0   ;clear R5
	AND R6, R6, #0   ;clear R6
	ADD R6, R6, R1   ;add 1 to R6
	LD R4, LOAD      ;load 7000 into R4
LOAD	STR R0, R0, #0   ;x7000
	LDI R0, LOAD     ;load value from x7000 into R0
START
	LD R1, SAVER1
	LD R4, LOAD      ;load x7000 into R4
	AND R3, R3, #0   ;clear R3
	ADD R3, R3, R1   ;add R1 to R3
	ADD R4, R4, R1   ;add 
	NOT R7, R6
	ADD R7, R7, #1
	ADD R4, R4, R7
	AND R7, R7, #0
	ADD R7, R7, R6
	NOT R1, R1
	ADD R1, R1, #1
	ADD R7, R7, R1
	ADD R3, R3, R7
	LDR R0, R4, #0
	LDR R1, R4, #1
	AND R7, R7, #0
	ADD R7, R7, R4
	AND R2, R2, #0
	ADD R2, R2, R4
SORT
	ADD R4, R4, #1
	LDR R1, R4, #0
	NOT R5, R1
	ADD R5, R5, #1
	ADD R5, R5, R0
	BRP LOWER
	BRN LOOP2
	BRZ EQUAL
EQUAL   AND R2, R2, #0
	ADD R2, R2, R4
LOWER	AND R0, R0, #0
	ADD R0, R0, R1
	AND R2, R2, #0
	ADD R2, R2, R4
LOOP2	ADD R3, R3, #-1
	BRP SORT
STORE2
	AND R1, R1, #0
	LDR R1, R7, #0
	STR R1, R2, #0
	STR R0, R7, #0
END
	ADD R6, R6, #-1
	BRP START
DISPLAY
	AND R0, R0, #0
	LEA R0, ENDOUT
	PUTS
	AND R0, R0, #0
	AND R1, R1, #0
	AND R2, R2, #0
	AND R3, R3, #0
	AND R4, R4, #0
	AND R5, R5, #0
	LD R5, SAVER1
	ADD R5, R5, 1
	LD R2, SAVER1
	LD R4, SAVER1
LOOP3	LD R1, STORE
	NOT R3, R2
	ADD R3, R3, #1
	ADD R1, R1, R4
	ADD R1, R1, R3
	AND R0, R0, #0
	LD R0, NEWLINE
	PUTC
	LDR R0, R1, #0
	ADD R0, R0, #15
	ADD R0, R0, #15
	ADD R0, R0, #15
	ADD R0, R0, #3
	PUTC
	ADD R2, R2, #-1
	ADD R5, R5, #-1
	BRP LOOP3
	HALT
SAVER1 .FILL x0000
NEWLINE .FILL x0A
ENDOUT .STRINGZ "\nSorted Array"
PROMPT .STRINGZ "\nEnter a number\n"
.END