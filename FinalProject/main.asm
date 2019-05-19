INCLUDE Irvine32.inc

.data
w EQU 10
h EQU 10
screen BYTE w DUP (h DUP("1"))

.code
main PROC
	;Code here
	mov ecx,w
	L1:
		push ecx
		mov ecx,h
		L2:
			movzx eax,screen[ecx]
			call WriteChar
		loop L2
		call Crlf
		pop ecx
	loop L1
	call WaitMsg
	exit
main ENDP
END main