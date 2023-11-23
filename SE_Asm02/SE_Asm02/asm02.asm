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
a DB 5
b DB 4
HW DD ?                          ; двойное слово длинной 4 байта, неинициализировано

.CODE                          ; сегмент кода

main PROC                        ; точка входа main
START :                          ; метка
mov eax, 0
add al, a
add al, b
add [STR2 + 21], al

INVOKE MessageBoxA, HW, OFFSET STR2, OFFSET STR1, MB_OK    ; вызов функции
    
  push -1                      ; код вовзрата процесса Windows  (параметр ExitProcess)
  call ExitProcess                  ; конец процедуры
main ENDP

end main                        ; конец модуля main