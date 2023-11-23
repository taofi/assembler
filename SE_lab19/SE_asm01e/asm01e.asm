.586P                          
.MODEL FLAT, STDCALL                  
includelib kernel32.lib
includelib SE_asm01d.lib
includelib libucrt.lib

ExitProcess PROTO :DWORD                ; �������� ������� ��� ���������� �������� Windows
GetStdHandle PROTO : DWORD
WriteConsoleA PROTO : DWORD, : DWORD, : DWORD, : DWORD, : DWORD
EXTERN getmin: PROC
EXTERN getmax: PROC
int_to_char PROTO : DWORD, : SDWORD

.STACK 4096                        ; ��������� �����

.CONST                          ; ������� ��������

.DATA                          ; ������� ������
consolehandle dd 0h
myArray DWORD 10, 5, 8, 2, 7, 1, 6, 3, 9, 4 ; ������ �������  
MyStr SDWORD 64 DUP(0) ; ����� ��� ���������� ������������� ����������

.CODE                          ; ������� ����
int_to_char PROC pstr : dword, intfield : sdword
  mov edi, pstr ; �������� �� pstr � edi
  mov esi, 0 ; ���������� �������� � ���������� 
  mov eax, intfield ; ����� -> � eax
  cdq ; ���� ����� ���������������� � eax �� edx
  mov ebx, 10 ; ��������� ������� ��������� (10) -> ebx
  idiv ebx ; eax = eax/ebx, ������� � edx (������� ����� �� ������)
  test eax, 80000000h ; ��������� �������� ���
  jz plus ; ���� ������������� ����� - �� plus
  neg eax ; ����� ������ ���� eax
  neg edx ; edx = -edx
  mov cl, '-' ; ������ ������ ���������� '-'
  mov[edi], cl ; ������ ������ ���������� '-'
  inc edi ; ++edi
  plus : ; ���� ���������� �� �������� 10
  push dx ; ������� -> ����
  inc esi ; ++esi
  test eax, eax ; eax == ?
  jz fin ; ���� ��, �� �� fin
  cdq ; ���� ���������������� � eax �� edx 
  idiv ebx ; eax = eax/ebx, ������� � edx
  jmp plus ; ����������� ������� �� plus
  fin : ; � ecx ���-�� �� 0-��� �������� = ���-�� �������� ����������
  mov ecx, esi
  write : ; ���� ������ ����������
  pop bx ; ������� �� ����� -> bx
  add bl, '0' ; ������������ ������ � bl
  mov[edi], bl ; bl -> � ���������
  inc edi ; edi++
  loop write ; ���� (--ecx)>0 ������� �� write
  ret
int_to_char ENDP


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