; =========================================================
; Infinity loop
;
; =========================================================
; Constants -----------------------------------------------
SYS_EXIT: equ 1
; Code Segment --------------------------------------------
section .text
    global _start

_start:
    ; Print a msg
    mov edx,msgLen       ;
    mov ecx,msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov dword [msg], 'Pong' ; Replace fist 4 char from msg

    ; Print a msg
    mov edx,msgLen
    mov ecx,msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov [msg], dword 'Ping' ; Replace fist 4 char from msg

    jmp _start

    mov ebx, 0              ; Return value 0
    mov eax, SYS_EXIT       ; sys_exit
    int 0x80                ; system call by interruption

; Data Section --------------------------------------------
section .data
msg: db 'Ping!!',0xA
msgLen: equ $ - msg
