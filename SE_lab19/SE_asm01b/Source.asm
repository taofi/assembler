.586P                          
.MODEL FLAT, STDCALL                  
includelib kernel32.lib
includelib SE_asm01a.lib


ExitProcess PROTO :DWORD                ; �������� ������� ��� ���������� �������� Windows
GetStdHandle PROTO : DWORD
WriteConsoleA PROTO : DWORD, : DWORD, : DWORD, : DWORD, : DWORD
getmin PROTO :DWORD, :DWORD
getmax PROTO :DWORD, :DWORD
int_to_char PROTO : DWORD, : SDWORD

.STACK 4096                        ; ��������� �����

.CONST                          ; ������� ��������

.DATA                          ; ������� ������
consolehandle dd 0h
myArray DWORD 10, 5, 8, 2, 7, 1, 6, 3, 9, 4 ; ������ �������  
MyStr SDWORD 64 DUP(0) ; ����� ��� ���������� ������������� ����������

.CODE                          ; ������� ����

main PROC
    ; �������� getmin
    push 10               ; ���������� ��������� � �������
    push OFFSET myArray   ; ����� ������� �������� �������
    call getmin
    mov ebx, eax
    push 10               ; ���������� ��������� � �������
    push OFFSET myArray   ; ����� ������� �������� �������
    call getmax
    add eax, ebx ; ��������� ���������� getmin � getmax

    push eax
    push OFFSET MyStr
    call int_to_char
    push -11
     call GetStdHandle
     mov consolehandle, eax
    push 0
    push 0
    push sizeof MyStr
    push offset MyStr
    push consolehandle
    call WriteConsoleA

    push 0
    call ExitProcess
main ENDP

end main                       