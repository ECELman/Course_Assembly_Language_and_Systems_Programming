; sorting th number by bubble sort algorithm

INCLUDE Irvine32.inc
.386	
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

array DWORD 3,2,4,1,5
out_count DWORD ?
in_count DWORD ?
out_temp_count DWORD ?
msg1 BYTE " ",0
msg2 BYTE "Before sorting :",0
msg3 BYTE "After sorting :",0

.code
main PROC

mov edx,OFFSET msg2
call WriteString
call Crlf
call Crlf

; get the loop counter of out

mov out_count,LENGTHOF array

; display the orign array

mov ecx,out_count
mov esi,0
display_orign_array: 
mov eax,array[esi]
call WriteInt
mov edx,OFFSET msg1
call WriteString
add esi,4
loop display_orign_array
call Crlf
call Crlf

; initial the loop counter of out and in

mov eax,out_count
mov in_count,eax
dec in_count

; begin the bubble sort algorithm
mov ecx,out_count
out_loop:

	mov out_temp_count,ecx
	mov ecx,in_count
	mov esi,0
	in_loop:

		mov eax,array[esi]
		cmp eax,array[esi+4]

		; if array[esi]>array[esi+4],go to swap
		jg swap

		return_to_in_loop:
					add esi,4

	loop in_loop

	; return the loop counter of out to ecx
    mov ecx,out_temp_count
loop out_loop

jmp show_result

; to change the value
swap:

	mov eax,array[esi]
	xchg eax,array[esi+4]
	mov array[esi],eax

jmp return_to_in_loop

show_result:

mov edx,OFFSET msg3
call WriteString
call Crlf
call Crlf

mov ecx,out_count
mov esi,0
display_sort_array:

mov eax,array[esi]
call WriteInt
mov edx,OFFSET msg1
call WriteString
add esi,4

loop display_sort_array
call Crlf
call Crlf

   	INVOKE ExitProcess,0      ; end the program

main ENDP
END main