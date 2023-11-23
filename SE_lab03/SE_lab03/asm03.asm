.586P                          ; ������� ���������(��������� Pentium)
.MODEL FLAT, STDCALL                  ; ������ ������, ���������� � ������
includelib kernel32.lib                  ; ������������: ����������� � kernel32

ExitProcess PROTO :DWORD                ; �������� ������� ��� ���������� �������� Windows
MessageBoxA PROTO :DWORD, :DWORD, :DWORD, :DWORD    ; �������� API-������� MessageBoxA

.STACK 4096                        ; ��������� �����

.CONST                          ; ������� ��������

.DATA                          ; ������� ������
MB_OK EQU 0                      ; EQU ���������� ���������  
STR1 DB "lab2", 0    
STR2 DB "��������� �������� = 0", 0
myWords WORD 8Ah, 3Bh, 44h, 5Fh, 99h
myBytes BYTE 10h, 20h, 30h, 40h
myDoubles DWORD 1, 2, 3, 4, 5, 6, 7
myPointre DWORD myDoubles
ddMD dd 7 dup(?)
HW DD ?                          ; ������� ����� ������� 4 �����, ������������������

.CODE                          ; ������� ����

main PROC                        ; ����� ����� main

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

cmp [myDoubles + esi * 4], 0  ; ���������� ������� ������� � �����
je FOUND_ZERO
jmp DONE 
FOUND_ZERO:
mov ebx, 0 
DONE:
loop CYCLE  
push -1                      ; ��� �������� �������� Windows  (�������� ExitProcess)
call ExitProcess                  ; ����� ���������
main ENDP


end main                        ; ����� ������ main