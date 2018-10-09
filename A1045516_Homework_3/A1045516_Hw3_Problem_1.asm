; Reversing a String

INCLUDE Irvine32.inc
.386	
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
buffer BYTE 50 DUP(0)                      ; store the string of input
buffer_size = ($ - buffer) - 1             ; measure the buffer size
count DWORD ?                              ; to store the string size
prompt1 BYTE "Enter a string : ",0
prompt2 BYTE "Before reverse : ",0
prompt3 BYTE "After reverse : ",0

.code
main PROC

	; input a string

	mov edx,OFFSET prompt1
	call WriteString
	mov edx,OFFSET buffer   
	mov ecx,buffer_size       
    call ReadString 
	mov count,eax
	call Crlf

	; show the orign string

	mov edx,OFFSET prompt2
	call WriteString
	mov edx,OFFSET buffer
	call WriteString
	call Crlf
	call Crlf
	
	; push the string

	mov ecx,count
	mov esi,0
	push_string:
		movzx eax,buffer[esi]
		push eax
		inc esi
	loop push_string

	; pop the string

	mov ecx,count
	mov esi,0
	pop_string:
		pop eax
		mov buffer[esi],al
		inc esi
	loop pop_string

	; show the result after reversing

	mov edx,OFFSET prompt3
	call WriteString
	mov edx,OFFSET buffer
	call WriteString
	call Crlf
	call Crlf
	call WaitMsg

   	INVOKE ExitProcess,0      ; end the program

main ENDP
END main