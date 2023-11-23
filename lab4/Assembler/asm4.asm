.586P
.MODEL FLAT, STDCALL
includelib kernel32.lib

ExitProcess PROTO : DWORD
.STACK 4096

.CONST

.DATA

MB_OK	EQU 0
HW		DD ?
LONGV   QWORD 7181234
BYTEV	BYTE 25
.CODE

main PROC

START: 
	push 0
	call ExitProcess
main ENDP
end main
