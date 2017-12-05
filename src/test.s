; =========================================================
; Hello Word
;
; =========================================================

; Code Segment --------------------------------------------
segment .text           ; code section
    global _start       ; make label available to linker
_start:                 ; standard  gcc  entry point
        mov edx,len     ; arg3, length of string to print
        mov ecx,msg     ; arg2, pointer to string
        mov ebx,1       ; arg1, where to write, screen
        mov eax,4       ; write sysout command to int 80 hex
        int 0x80        ; interrupt 80 hex, call kernel

        mov ebx,0       ; exit code, 0=normal
        mov eax,1       ; exit command to kernel
        int 0x80        ; interrupt 80 hex, call kernel

segment .data           ; data section
msg:    db 'Hello World',0xA     ; the string to print, 10=cr
len:    equ $ - msg     ; "$" means "here"
                        ; len is a value, not an address
