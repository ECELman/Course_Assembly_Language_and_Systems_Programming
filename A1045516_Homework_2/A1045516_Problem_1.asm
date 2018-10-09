.386	
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
arrayD DWORD 1,2,3,4

.code
main PROC

    ; to arrange the sequence

	mov eax,arrayD            ; EAX = 1, arrayD : 1 2 3 4
	xchg eax,[arrayD+12]      ; EAX = 4, arrayD : 1 2 3 1
	mov arrayD,eax            ; EAX = 4, arrayD : 4 2 3 1

	mov eax,[arrayD+4]        ; EAX = 2, arrayD : 4 2 3 1
	xchg eax,[arrayD+8]       ; EAX = 3, arrayD : 4 2 2 1
	mov [arrayD+4],eax        ; EAX = 3, arrayD : 4 3 2 1

	; to check the sequence 

	mov eax,arrayD            ; EAX = 4, arrayD : 4 3 2 1
	mov eax,[arrayD+4]        ; EAX = 3, arrayD : 4 3 2 1
	mov eax,[arrayD+8]        ; EAX = 2, arrayD : 4 3 2 1
	mov eax,[arrayD+12]       ; EAX = 1, arrayD : 4 3 2 1

   	INVOKE ExitProcess,0      ; end the program

main ENDP
END main