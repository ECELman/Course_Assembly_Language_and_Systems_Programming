; Reversing the numbers

INCLUDE Irvine32.inc
.386	
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
buffer DWORD ? ; store the number of input
count DWORD 0 ; the total numbers
time DWORD ?
prompt1 BYTE "How many numbers do you want to input ? ",0
prompt2 BYTE "Input integer ",0
prompt3 BYTE " : ",0
prompt4 BYTE " ",0
prompt5 BYTE "After reverse : ",0

.code
main PROC

	; input the total number

	mov edx,OFFSET prompt1
	call WriteString
	call ReadInt 
    mov count , eax
	call Crlf
	call Crlf
	
	; push the number

	mov ecx,count
	mov esi,0
	push_number:
		mov edx,OFFSET prompt2
		call WriteString
		mov time, esi
		add time,1
		mov eax, time
		call WriteDec
		mov edx,OFFSET prompt3
		call WriteString
		call ReadInt 
		mov buffer , eax
		push buffer
		inc esi
	loop push_number

	call Crlf

	; pop the number

	mov ecx,count
	mov esi,0
	mov edx,OFFSET prompt5
		call WriteString
		call Crlf
		call Crlf

	pop_number:
		pop eax
		call WriteInt
		mov edx,OFFSET prompt4
		call WriteString
		inc esi
	loop pop_number

	call Crlf
	call Crlf
	call WaitMsg

   	INVOKE ExitProcess,0      ; end the program

main ENDP
END main