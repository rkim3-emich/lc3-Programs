; Programmer: Ryan Kim
; Class:      Cosc 221
; id:         E01724040
; Program#:   3

;R0 000 stores lowest value
;R1 001 stores temp value
;R2 010 stores memory address of lowest value
;R3 011 stores value for loop
;R4 100 stores memory address for current value
;R5 101 stores compliment 2's of temp value
;R6 010 stores large loop value
;R7 000

;INITIALIZE
	.ORIG x3000
	AND R0, R0, #0  ;clear R0
	AND R1, R1, #0  ;clear R1
	AND R2, R2, #0  ;clear R2
	AND R4, R4, #0  ;clear R4
	AND R5, R5, #0  ;clear R5
	AND R6, R6, #0  ;clear R6
	ADD R6, R6, #9  ;add 9 to R6
	LD R4, LOAD     ;load x7000 into R4
LOAD	STR R0, R0, #0  ;x7000
	LDI R0, LOAD    ;indirect load 7000 into R0
START
	LD R4, LOAD     ;load x7000 into R4
	AND R3, R3, #0  ;clear R3
	ADD R3, R3, #9  ;add 9 to R3
	ADD R4, R4, #9  ;add 9 to R4
	NOT R7, R6      ;store not of R6 in R7
	ADD R7, R7, #1  ;add one to R7
	ADD R4, R4, R7  ;add R4 and R7
	AND R7, R7, #0  ;clear R7
	ADD R7, R7, R6  ;add R6 to R7 
	ADD R7, R7, #-9 ;subtract 9 from R7
	ADD R3, R3, R7  ;Add R7 and R3
	LDR R0, R4, #0  ;load 7000 range into R0
	LDR R1, R4, #1  ;load next number into R1
	AND R7, R7, #0  ;clear R7
	ADD R7, R7, R4  ;add R4 to R7
	AND R2, R2, #0
	ADD R2, R2, R4
SORT
	ADD R4, R4, #1
	LDR R1, R4, #0
	NOT R5, R1
	ADD R5, R5, #1
	ADD R5, R5, R0
	BRP LOWER
	BRN LOOP
	BRZ EQUAL
EQUAL   AND R2, R2, #0
	ADD R2, R2, R4
LOWER	AND R0, R0, #0
	ADD R0, R0, R1
	AND R2, R2, #0
	ADD R2, R2, R4
LOOP	ADD R3, R3, #-1
	BRP SORT
STORE
	AND R1, R1, #0
	LDR R1, R7, #0
	STR R1, R2, #0
	STR R0, R7, #0
END
	ADD R6, R6, #-1
	BRP START
	.END