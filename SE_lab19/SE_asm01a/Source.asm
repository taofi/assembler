.586P                          
.MODEL FLAT, STDCALL                  
.CODE                          ; ������� ����


getmin PROC arr:DWORD, len:DWORD 
    mov ecx, len     ; ���������� ��������� � �������
    mov esi, arr    ; ����� ������� �������� �������
    mov eax, [esi] ; �������������� eax ������ ��������� ������� eax - ��� ��������
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

getmax PROC arr:DWORD, len:DWORD 
    mov ecx, len     ; ���������� ��������� � �������
    mov esi, arr    ; ����� ������� �������� �������
    mov eax, [esi] ; �������������� eax ������ ��������� ������� eax - ��� ��������
    ; �������� ���� �� �������
        loop_count:
            mov edx, [esi] ; ��������� ������� ������� ������� � edx
            cmp eax, edx    ; ���������� ������� ������� � ������� ��������� (eax)
            jl update_min   ; ���� ������� ������� ������ �������� ��������, ��������� �������
            jmp next
            update_min:
            mov eax, edx    ; ��������� �������
            next:
            add esi, 4          ; ��������� � ���������� �������� ������� (4 ����� �� DWORD)
        loop loop_count ; ��������� � ���������� �������� ������� � ���������� ����
 
        ; ��������� (����������� ��������) ���������� � eax
        ret 8
getmax ENDP

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

END                    