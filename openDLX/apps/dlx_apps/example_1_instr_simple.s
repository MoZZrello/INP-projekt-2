; ------------------------------------------------------------------
; Example program with simple instructions.
;
; Requires enabled forwarding
; ------------------------------------------------------------------


.global main
main:

; Instruction format of immediate-instructions
; addi Destination, Source, Value
; adds the content of the source register with the immediate value and writes result to destination register
	  addi     r1,r0,1     ; adds 1 to content of register 0 (=0) and writes the result to register 1
	  addi     r2,r0,8     ; similar instruction, writing the 9 to R2
						   ; since r0 is always 0, constants can be generated by immediate instructions

; Instruction format of register-register-instructions
; add Destination, Source1, Source2
; adds the contents of the two source registers and writes result to destination register
	  add      r5,r1,r2    ; r5 = 9
	  sub      r6,r2,r1    ; r6 = 7
	  mult     r7,r5,r6    ; r7 = 63
	  div      r8,r7,r6    ; r8 = 9
	  and      r9,r5,r6    ; r9 = 9 AND 7 = 1001 AND 0111 = 0001 = 1
	  or       r10,r5,r6   ; r10 = 9 OR 7 = 1001 OR  0111 = 1111 = 15
	  XOR      r11,r5,r6   ; excluxive or
						   ; r11 = 9 XOR 7 = 1001 XOR  0111 = 1110 = 14
	  SLLI     r12,r6,2    ; r12 = 0111 << 2 = 011100 = 28
						   ; shift left, complies with a multiplication of 2^(operand)
	; end of program
	trap 0
