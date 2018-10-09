; displays single character 'X' in all possible combination of foreground and background colors

INCLUDE Irvine32.inc
.386	
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

X BYTE "X",0 ;show the 'X' character
out_count DWORD ?

.code
main PROC

; set loop counter of out
mov ecx,16

;to choose the color
mov ebx,0

L1:
	mov out_count,ecx

	; set loop counter of in
	mov ecx,16
	
	; show the color and text
	L2:
		mov eax,ebx
		call SetTextColor
		mov edx,offset X
		call WriteString

		inc ebx
	loop L2

	; go to next line
	call Crlf

	; return the loop counter of out to ecx 
	mov ecx,out_count
loop L1

; return to orign setting
mov eax, 15+0*16   ; white = 15, black = 0, foreground + background*16
call SetTextColor

   	INVOKE ExitProcess,0      ; end the program

main ENDP
END main