global _start

section .text
_start:
	xor al, al
	xor bl, bl
	inc bl
	mov rcx, 10

loopfib:
	add al, bl,
	xchg al, bl
	loop loopfib