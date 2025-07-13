global _start

section .text
_start:
	xor al, al
	xor bl, bl
	inc bl

loopfib:
	add al, bl,
	xchg al, bl
	cmp bl, 10
	js loopfib