INCLUDE Irvine32.inc
INCLUDE Macros.inc
.data
	prompt1 BYTE "                        ■■■■■     ■■■■■■    ■■    ■■    ■■■■■    ■■",0
	prompt2 BYTE "                        ■■    ■■       ■■         ■■  ■■     ■■          ■■",0
	prompt3 BYTE "                        ■■    ■■       ■■           ■■■       ■■          ■■",0
	prompt4 BYTE "                        ■■■■■         ■■             ■         ■■■■      ■■",0
	prompt5 BYTE "                        ■■               ■■           ■■■       ■■          ■■",0
	prompt6 BYTE "                        ■■               ■■         ■■  ■■     ■■          ■■",0
	prompt7 BYTE "                        ■■           ■■■■■■    ■■    ■■    ■■■■■    ■■■■■",0
	prompt8 BYTE "             ■■    ■■        ■■■         ■■■■■      ■■    ■■   ■■■■■   ■■    ■■",0
	prompt9 BYTE "             ■■    ■■     ■■    ■■     ■■    ■■     ■■   ■■    ■■          ■■  ■■",0
	prompt10 BYTE "             ■■    ■■    ■■      ■■   ■■              ■■  ■■     ■■            ■■■",0
	prompt11 BYTE "             ■■■■■■    ■■      ■■   ■■              ■■■■       ■■■■         ■■",0
	prompt12 BYTE "             ■■    ■■    ■■      ■■   ■■              ■■  ■■     ■■             ■■",0
	prompt13 BYTE "             ■■    ■■     ■■    ■■     ■■    ■■     ■■   ■■    ■■             ■■",0
	prompt14 BYTE "             ■■    ■■        ■■■         ■■■■■      ■■    ■■   ■■■■■       ■■",0
	start BYTE   "                                                      > START",0
	setting BYTE "                                                      > SETTING",0
	finish BYTE  "                                                      > EXIT",0
	start1 BYTE   "                                                        START",0
	setting1 BYTE "                                                        SETTING",0
	finish1 BYTE  "                                                        EXIT",0
.code
main PROC

begin:
    call Crlf
	mov edx,OFFSET prompt1
	call WriteString
	call Crlf
	mov edx,OFFSET prompt2
	call WriteString
	call Crlf
	mov edx,OFFSET prompt3
	call WriteString
	call Crlf
	mov edx,OFFSET prompt4
	call WriteString
	call Crlf
	mov edx,OFFSET prompt5
	call WriteString
	call Crlf
	mov edx,OFFSET prompt6
	call WriteString
	call Crlf
	mov edx,OFFSET prompt7
	call WriteString
	call Crlf
	call Crlf
	mov edx,OFFSET prompt8
	call WriteString
	call Crlf
	mov edx,OFFSET prompt9
	call WriteString
	call Crlf
	mov edx,OFFSET prompt10
	call WriteString
	call Crlf
	mov edx,OFFSET prompt11
	call WriteString
	call Crlf
	mov edx,OFFSET prompt12
	call WriteString
	call Crlf
	mov edx,OFFSET prompt13
	call WriteString
	call Crlf
	mov edx,OFFSET prompt14
	call WriteString
	call Crlf
	call Crlf
	call Crlf
	call Crlf
	call Crlf
	
STA:

	mov edx,OFFSET start
	call WriteString
	call Crlf
	mov edx,OFFSET setting1
	call WriteString
	call Crlf
	mov edx,OFFSET finish1
	call WriteString
	call Crlf
	jmp L3
	L3:
	mov eax,50
    call Delay
	call ReadKey
	cmp dx,+40
	je SET
	cmp dx,+38
	je FIN
	cmp dx,+13
	je NEXT
	call ClrScr
	jmp L3
SET:

	mov edx,OFFSET start1
	call WriteString
	call Crlf
	mov edx,OFFSET setting
	call WriteString
	call Crlf
	mov edx,OFFSET finish1
	call WriteString
	call Crlf
	jmp L1
	L1:
	mov eax,50
    call Delay
	call ReadKey
	cmp dx,+40
	je FIN
	cmp dx,+38
	je STA
	cmp dx,+13
	je NEXT
	call ClrScr
	jmp L1
FIN:
	mov edx,OFFSET start1
	call WriteString
	call Crlf
	mov edx,OFFSET setting1
	call WriteString
	call Crlf
	mov edx,OFFSET finish
	call WriteString
	call Crlf
	jmp L2
	L2:
	mov eax,50
    call Delay
	call ReadKey
	cmp dx,+40
	je STA
	cmp dx,+38
	je SET
	cmp dx,+13
	je NEXT
	call ClrScr
	jmp L2

NEXT:
	exit
main ENDP
END main