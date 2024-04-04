.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\user32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\msvcrt.lib

.data
    buffer1     db  11 dup (?)  
    buffer2     db  11 dup (?) 
    resultBuffer db  20 dup (?)
    prompt1     db  "so thu nhat: ", 0
    prompt2     db  "so thu hai: ", 0
    resultMsg   db  "The sum in decimal is: ", 0

.code
start:
    invoke  StdOut, addr prompt1
    invoke  StdIn, addr buffer1, 11  

    invoke  StdOut, addr prompt2
    invoke  StdIn, addr buffer2, 11

    invoke  atodw, addr buffer1
    mov     ebx, eax
    invoke  atodw, addr buffer2 
    add     eax, ebx

    invoke  dwtoa, eax, addr resultBuffer
    invoke  StdOut, addr resultMsg
    invoke  StdOut, addr resultBuffer

    invoke  ExitProcess, 0
end start
