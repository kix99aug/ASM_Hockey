INCLUDE Irvine32.inc
INCLUDE Macros.inc
.data
;push test
	prompt1 BYTE		"―――――     ――――――    ――    ――    ―――――    ――",0
	prompt2 BYTE		"――    ――       ――         ――  ――     ――          ――",0
	prompt3 BYTE		"――    ――       ――           ―――       ――          ――",0
	prompt4 BYTE		"―――――         ――             ―         ――――      ――",0
	prompt5 BYTE		"――               ――           ―――       ――          ――",0
	prompt6 BYTE		"――               ――         ――  ――     ――          ――",0
	prompt7 BYTE		"――           ――――――    ――    ――    ―――――    ―――――",0
	prompt8 BYTE		"――    ――        ―――         ―――――      ――    ――   ―――――   ――    ――",0
	prompt9 BYTE		"――    ――     ――    ――     ――    ――     ――   ――    ――          ――  ――",0
	prompt10 BYTE	"――    ――    ――      ――   ――              ――  ――     ――            ―――",0
	prompt11 BYTE	"――――――    ――      ――   ――              ――――       ――――         ――",0
	prompt12 BYTE	"――    ――    ――      ――   ――              ――  ――     ――             ――",0
	prompt13 BYTE	"――    ――     ――    ――     ――    ――     ――   ――    ――             ――",0
	prompt14 BYTE	"――    ――        ―――         ―――――      ――    ――   ―――――       ――",0
	prompts DWORD OFFSET prompt1, OFFSET prompt2, OFFSET prompt3, OFFSET prompt4, OFFSET prompt5, OFFSET prompt6, OFFSET prompt7, OFFSET prompt8, OFFSET prompt9, OFFSET prompt10, OFFSET prompt11, OFFSET prompt12, OFFSET prompt13, OFFSET prompt14
	start BYTE       "                                                      > START",0
	setting BYTE     "                                                      > SETTING",0
	finish BYTE      "                                                      > EXIT",0
	operation BYTE   "                                                      > OPERATION",0
	start1 BYTE      "                                                      START",0
	setting1 BYTE    "                                                      SETTING",0
	finish1 BYTE     "                                                      EXIT",0
	operation1 BYTE  "                                                      OPERATION",0
	empty BYTE "                                                                                                                          ",0
	color BYTE       "                                               > Color ",0
	color1 BYTE      "                                                 Color ",0
	speed BYTE       "                                               > Speed ",0
	speed1 BYTE      "                                                 Speed ",0
	ColorBox BYTE "― ",0
	P1 BYTE          "                                         Player1: Q W E(Skill) F(Up) C(Down)",0
	P2 BYTE          "                                         Player2: I O P(Skill) 5(Up) 1(Down)",0
	back BYTE        "                                                Press ESC to return...",0
	P1_c_choose BYTE "																											 ",0
.code
PrintTitle PROC
	mov ecx,0
PrintTitlePerLine:
	mov dl,24
	mov dh,cl
	cmp ecx,6
	jng NotGreaterThan6
	mov dl,14
	add dh,1
NotGreaterThan6:
	add dh,3
	call Gotoxy
	mov eax,4
	mul ecx
	mov edx,prompts[eax]
	call WriteString
	inc ecx
	cmp ecx,14
	jl PrintTitlePerLine
	ret
PrintTitle ENDP

menu PROC

begin:                                      ;�L�Xpixel hocky
	call PrintTitle
	jmp STA	
	
STA:                                   ;随��start�肘困境�
	mov dl,0
	mov dh,20
	call Gotoxy
	mov edx,OFFSET empty
	call WriteString
	call WriteString
	call WriteString
	call WriteString
	mov dl,0
	mov dh,20
	call Gotoxy
	mov edx,OFFSET start               ;�L�X随��start�紺俺H
	call WriteString
	call Crlf
	mov edx,OFFSET setting1
	call WriteString
	call Crlf
	mov edx,OFFSET finish1
	call WriteString
	call Crlf
	mov edx,OFFSET operation1
	call WriteString
	call Crlf
	jmp L3                             ;翠�J槍�L�W�B�U��enter
	L3:
	mov eax,50
    call Delay
	call ReadKey                       ;的��槍�L翠�J
	cmp dx,+40
	je SET                             ;飴旗�譴U
	cmp dx,+38
	je OPERA                             ;飴旗�譴W
	cmp dx,+13                 
	je GAME_PART                       ;飴旗��enter
	
	jmp L3
SET:                                   ;随��setting�困境�
	mov dl,0
	mov dh,20
	call Gotoxy
	mov edx,OFFSET empty
	call WriteString
	call WriteString
	call WriteString
	call WriteString
	mov dl,0
	mov dh,20
	call Gotoxy
	mov edx,OFFSET start1
	call WriteString
	call Crlf
	mov edx,OFFSET setting
	call WriteString
	call Crlf
	mov edx,OFFSET finish1
	call WriteString
	call Crlf
	mov edx,OFFSET operation1
	call WriteString
	call Crlf
	jmp L1
	L1:                                 
	mov eax,50
    call Delay
	call ReadKey
	cmp dx,+40
	je FIN                            ;飴旗�譴U
	cmp dx,+38
	je STA                            ;飴旗�譴W
	cmp dx,+13
	je SET_PART                       ;飴旗��enter
	
	jmp L1
FIN:
	mov dl,0
	mov dh,20
	call Gotoxy
	mov edx,OFFSET empty
	call WriteString
	call WriteString
	call WriteString
	call WriteString
	mov dl,0
	mov dh,20
	call Gotoxy
	mov edx,OFFSET start1
	call WriteString
	call Crlf
	mov edx,OFFSET setting1
	call WriteString
	call Crlf
	mov edx,OFFSET finish
	call WriteString
	call Crlf
	mov edx,OFFSET operation1
	call WriteString
	call Crlf
	jmp L2
	L2:
	mov eax,50
    call Delay
	call ReadKey
	cmp dx,+40
	je OPERA
	cmp dx,+38
	je SET
	cmp dx,+13
	je FINISH_PART

	jmp L2
OPERA:
	mov dl,0
	mov dh,20
	call Gotoxy
	mov edx,OFFSET empty
	call WriteString
	call WriteString
	call WriteString
	call WriteString
	mov dl,0
	mov dh,20
	call Gotoxy
	mov edx,OFFSET start1               ;�L�X随��start�紺俺H
	call WriteString
	call Crlf
	mov edx,OFFSET setting1
	call WriteString
	call Crlf
	mov edx,OFFSET finish1
	call WriteString
	call Crlf
	mov edx,OFFSET operation
	call WriteString
	call Crlf
	jmp L4                             ;翠�J槍�L�W�B�U��enter
	L4:
	mov eax,50
    call Delay
	call ReadKey                       ;的��槍�L翠�J
	cmp dx,+40
	je STA                             ;飴旗�譴U
	cmp dx,+38
	je FIN                             ;飴旗�譴W
	cmp dx,+13                 
	je OPERATION_PART                       ;飴旗��enter
	
	jmp L4
GAME_PART:

SET_PART:
	
	call ClrScr
	jmp SET_COLOR

	SET_COLOR:
		mov dl,0
		mov dh,5
		call Gotoxy
		mov edx,OFFSET empty
		call WriteString
		call WriteString
		call WriteString
		mov dl,0
		mov dh,5
		call Gotoxy
		mov edx,OFFSET setting1
		call WriteString
		mov dl,0
		mov dh,9
		call Gotoxy
		mov edx,OFFSET color
		call WriteString
		mov edx,OFFSET colorbox
		mov eax,1d
	    call SetTextColor
		call WriteString
		mov eax,2d
	    call SetTextColor
		call WriteString
		mov eax,3d
	    call SetTextColor
		call WriteString
		mov eax,4d
	    call SetTextColor
		call WriteString
		mov eax,15d
	    call SetTextColor
		call Crlf
		call Crlf
		mov edx,OFFSET speed1
		call WriteString
		mov edx,OFFSET colorbox
		call WriteString
		call WriteString
		call WriteString
		call WriteString
		Call Crlf
		Call Crlf
		Call Crlf
		Call Crlf
		Call Crlf
		mov dl,0
		mov dh,25
		call Gotoxy
		mov edx,OFFSET back
		call WriteString
		jmp L6
		L6:
		mov eax,50
		call Delay
		call ReadKey
		cmp dx,+27
		je begin
		cmp dx,+38
		je SET_SPEED
		cmp dx,+40
		je SET_SPEED
		jmp L6

	SET_SPEED:
		mov dl,0
		mov dh,5
		call Gotoxy
		mov edx,OFFSET empty
		call WriteString
		call WriteString
		call WriteString
		mov dl,0
		mov dh,5
		call Gotoxy
		mov edx,OFFSET setting1
		call WriteString
		mov dl,0
		mov dh,9
		call Gotoxy
		mov edx,OFFSET color1
		call WriteString
		mov edx,OFFSET colorbox
		mov eax,1d
	    call SetTextColor
		call WriteString
		mov eax,2d
	    call SetTextColor
		call WriteString
		mov eax,3d
	    call SetTextColor
		call WriteString
		mov eax,4d
	    call SetTextColor
		call WriteString
		mov eax,15d
	    call SetTextColor
		call Crlf
		call Crlf
		mov edx,OFFSET speed
		call WriteString
		mov edx,OFFSET colorbox
		call WriteString
		call WriteString
		call WriteString
		call WriteString
		Call Crlf
		Call Crlf
		Call Crlf
		Call Crlf
		Call Crlf
		mov dl,0
		mov dh,25
		call Gotoxy
		mov edx,OFFSET back
		call WriteString
		jmp L7
		L7:
		mov eax,50
		call Delay
		call ReadKey
		cmp dx,+27
		je begin
		cmp dx,+38
		je SET_COLOR
		cmp dx,+40
		je SET_COLOR
		jmp L7



OPERATION_PART:
	call ClrScr
	mov dl,0
	mov dh,5
	call Gotoxy
	mov edx,OFFSET operation1
	call WriteString
	call Crlf
	call Crlf
	Call Crlf
	mov edx,OFFSET P1
	call WriteString
	Call Crlf
	Call Crlf
	mov edx,OFFSET P2
	call WriteString
	Call Crlf
	Call Crlf
	Call Crlf
	Call Crlf
	Call Crlf
	mov dl,0
	mov dh,25
	call Gotoxy
	mov edx,OFFSET back
	call WriteString
	jmp L5
	L5:
	mov eax,50
    call Delay
	call ReadKey
	cmp dx,+27
	je begin
	jmp L5


FINISH_PART:
	exit

menu ENDP


main PROC
call menu
main ENDP
END main