global _start

section .data
	message db "Fibonacci Sequence:", 0x0a

section .text
_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, message
	mov rdx, 20
	syscall

	xor al, al
	xor bl, bl
	inc bl

loopfib:
	add al, bl,
	xchg al, bl
	
	
	cmp bl, 10
	jl write
	js loopfib

	mov rax, 60
	mov rdi, 0
	syscall
	
write:
	push rax
	mov rax, 1
	mov rdi, 1
	mov [rsi], bl
	add byte [rsi], 48
	mov rdx, 1
	syscall
	pop rax
	jmp loopfib