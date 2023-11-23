.586P                          ; система подкоманд(процессор Pentium)
.MODEL FLAT, STDCALL                  ; модель памяти, соглашение о вызове
includelib kernel32.lib                  ; компановщику: компоновать с kernel32

ExitProcess PROTO :DWORD                ; прототип функции для завершения процесса Windows
MessageBoxA PROTO :DWORD, :DWORD, :DWORD, :DWORD    ; прототип API-функции MessageBoxA

.STACK 4096                        ; выделение стека

.CONST                          ; сегмент констант

.DATA                          ; сегмент данных
MB_OK EQU 0                      ; EQU определяет константу  
STR1 DB "lab2", 0    
STR2 DB "Результат сложения = 0", 0
myWords WORD 8Ah, 3Bh, 44h, 5Fh, 99h
myBytes BYTE 10h, 20h, 30h, 40h
myDoubles DWORD 1, 2, 3, 4, 5, 6, 7
myPointre DWORD myDoubles
ddMD dd 7 dup(?)
HW DD ?                          ; двойное слово длинной 4 байта, неинициализировано

.CODE                          ; сегмент кода

main PROC                        ; точка входа main

mov EDI, 2
mov AX, [myWords + EDI]
mov BX, myWords[0]
   
mov eax, 0
mov ebx, 1
mov esi, 0
mov ecx, lengthof myDoubles
CYCLE:
add eax, [myDoubles + esi * 4]
add edi, 1

cmp [myDoubles + esi * 4], 0  ; Сравниваем текущий элемент с нулем
je FOUND_ZERO
jmp DONE 
FOUND_ZERO:
mov ebx, 0 
DONE:
loop CYCLE  
push -1                      ; код вовзрата процесса Windows  (параметр ExitProcess)
call ExitProcess                  ; конец процедуры
main ENDP


end main                        ; конец модуля main