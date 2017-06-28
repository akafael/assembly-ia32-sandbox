; =========================================================
; Loop - Print the Alphabet
;
; @author Rafael Lima
; =========================================================
; Constants -----------------------------------------------
SYS_EXIT: equ 1
; Code Segment --------------------------------------------
section .text
    global _start

_start:
    mov ecx, 26         ; Set limit as the Alphabet size
    mov eax, 'A'        ; Pick the first letter

l1:
    mov [num], AL       ; Overwrite the first byte
    push ecx            ; Recover ECX value from stack

    mov edx,2           ; Length of string to print ('char'+0xA)
    mov ecx,num         ; Pointer to string
    mov ebx,1           ; where to write (stdio)
    mov eax,4           ; chose sys_out command to int 80 hex
    int 0x80            ; interrupt 80 hex, call kernel

    mov AL, [num]       ; Get first byte at [num]
    inc AL              ; Pick next letter

    pop ecx             ; Store ECX value to stack
    loop l1             ; Loop - decrement ECX and jump if ECX != 0

end:
    mov ebx, 0          ; Return value 0
    mov eax, SYS_EXIT   ; sys_exit
    int 0x80            ; system call by interruption

; Data Section --------------------------------------------
section .data
num: db '1',0xA
