; =========================================================
; Infinity loop
;
; =========================================================

; Code Segment --------------------------------------------
section .text
    global _start

_start:
    mov edx,userMsgLen       ; String Size
    mov ecx,userMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx,50              ; String Size
    mov ecx,nome
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx,dispMsgLen      ; String Size
    mov ecx,dispMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx,2               ; String Size
    mov ecx,nome
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ebx, 0              ; Return value 0
    mov eax, 1              ; sys_exit
    int 0x80                ; system call by interruption

; Data Section --------------------------------------------
section .data
userMsg: db 'Please enter your first name: '
useMsgLen: equ $ - userMsg
dispMsg: db 'Hello '
dispMsgLen: equ $ - dispMsg

section .bss  ; Unitizialized Data
nome: resb 50 ; 50 bytes
