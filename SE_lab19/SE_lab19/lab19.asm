.586P                          
.MODEL FLAT, STDCALL                  
includelib kernel32.lib

ExitProcess PROTO :DWORD                ; �������� ������� ��� ���������� �������� Windows
MessageBoxA PROTO :DWORD, :DWORD, :DWORD, :DWORD    ; �������� API-������� MessageBoxA

.STACK 4096                        ; ��������� �����

.CONST                          ; ������� ��������

.DATA                          ; ������� ������
myArray DWORD 10, 5, 8, 2, 7, 1, 6, 3, 9, 4 ; ������ �������                        

.CODE                          ; ������� ����


getmin PROC
    mov esi, [esp + 4] ; �������� arr (����� �������)
    mov ecx, [esp + 8] ; �������� len (����� �������)
    mov eax, esi ; �������������� eax ������ ��������� ������� eax - ��� ��������
    ; �������� ���� �� �������
        loop_count:
            mov edx, [esi] ; ��������� ������� ������� ������� � edx
            cmp edx, eax    ; ���������� ������� ������� � ������� ��������� (eax)
            jl update_min   ; ���� ������� ������� ������ �������� ��������, ��������� �������
            jmp next
            update_min:
            mov eax, edx    ; ��������� �������
            next:
            add esi, 4          ; ��������� � ���������� �������� ������� (4 ����� �� DWORD)
        loop loop_count ; ��������� � ���������� �������� ������� � ���������� ����
 
        ; ��������� (����������� ��������) ���������� � eax
        ret 8
getmin ENDP

main PROC
    ; �������� getmin
    push 10               ; ���������� ��������� � �������
    push OFFSET myArray   ; ����� ������� �������� �������
    call getmin
    ; ��������� ������������ � eax
    push 0
    call ExitProcess

main ENDP

end main                       