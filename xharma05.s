; Vernamova sifra na architekture DLX
; Richard Harman xharma05

        .data 0x04          ; zacatek data segmentu v pameti
login:  .asciiz "xharma05"  ; <-- nahradte vasim loginem
cipher: .space 9 ; sem ukladejte sifrovane znaky (za posledni nezapomente dat 0)

        .align 2            ; dale zarovnavej na ctverice (2^2) bajtu
laddr:  .word login         ; 4B adresa vstupniho textu (pro vypis)
caddr:  .word cipher        ; 4B adresa sifrovaneho retezce (pro vypis)

        .text 0x40          ; adresa zacatku programu v pameti
        .global main        ; 

main:
	addi r29, r0, 97
	addi r14, r0, 122
	addi r4, r0, 0

letter:
	lb r3, login(r4)
	sgt r1, r29, r3 
	bnez r1, next
	addi r3, r3, 8
	sgt r1, r3, r14
	bnez r1, minus
backminus:
	sb cipher(r4), r3
	addi r4, r4, 1
	lb r3, login(r4)
	sgt r1, r29, r3 
	bnez r1, next
	subi r3, r3, 1
	sgt r1, r29, r3
	bnez r1, plus
backplus:
	sb cipher(r4), r3
	addi r4, r4, 1
	j letter

minus:
	nop
	nop
	subi r3, r3, 26
	j backminus

plus:
	nop
	nop
	addi r3, r3, 26
	j backplus

next:
	nop
	nop
	addi r4, r4, 1
	addi r3, r0, 0
	sb cipher(r4), r3

end:    addi r14, r0, caddr ; <-- pro vypis sifry nahradte laddr adresou caddr
        trap 5  ; vypis textoveho retezce (jeho adresa se ocekava v r14)
        trap 0  ; ukonceni simulace
