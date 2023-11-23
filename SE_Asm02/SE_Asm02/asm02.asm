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
a DB 5
b DB 4
HW DD ?                          ; ������� ����� ������� 4 �����, ������������������

.CODE                          ; ������� ����

main PROC                        ; ����� ����� main
START :                          ; �����
mov eax, 0
add al, a
add al, b
add [STR2 + 21], al

INVOKE MessageBoxA, HW, OFFSET STR2, OFFSET STR1, MB_OK    ; ����� �������
    
  push -1                      ; ��� �������� �������� Windows  (�������� ExitProcess)
  call ExitProcess                  ; ����� ���������
main ENDP

end main                        ; ����� ������ main