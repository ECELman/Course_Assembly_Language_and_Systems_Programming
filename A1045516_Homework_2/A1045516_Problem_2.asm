.386	
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
varA DWORD 10
varB DWORD 20
varC DWORD 5
varD DWORD 6

.code
main PROC

    ; the process of A+B

    mov eax,varA                        ; EAX  = 10, varA = 10
	mov ebx,varB                        ; EBX  = 20, varB = 20
	add eax,ebx                         ; EAX  = 30, EBX  = 20
	mov ecx,eax                         ; ECX  = 30, EAX  = 30

	; the process of C+D

	mov eax,varC                        ; EAX  =  5, varC =  5
	mov ebx,varD                        ; EBX  =  6, varD =  6
	add eax,ebx                         ; EAX  = 11, EBX  =  6
	mov edx,eax                         ; EDX  = 11, EAX  = 11

	; the process of (A+B) ¡V (C+D)

	sub ecx,edx                         ; ECX  = 19, EDX  = 11

	; the process of A = (A+B) ¡V (C+D)

	mov varA,ecx                        ; varA = 19, ECX  = 19

	; to check the value of A

	mov eax,varA                        ; EAX  = 19, varA = 19

   	INVOKE ExitProcess,0      ; end the program

main ENDP
END main