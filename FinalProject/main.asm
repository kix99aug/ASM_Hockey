INCLUDE Irvine32.inc
INCLUDE Macros.inc
.data
;push test
	prompt1 BYTE		"______ _______   __ _____ _     ",0
	prompt2 BYTE		"| ___ \_   _\ \ / /|  ___| |    ",0
	prompt3 BYTE		"| |_/ / | |  \ V / | |__ | |    ",0
	prompt4 BYTE		"|  __/  | |  /   \ |  __|| |    ",0
	prompt5 BYTE		"| |    _| |_/ /^\ \| |___| |____",0
	prompt6 BYTE		"\_|    \___/\/   \/\____/\_____/",0
	prompt7 BYTE		" _   _ _____ _____  _   __ _______   __",0
	prompt8 BYTE		"| | | |  _  /  __ \| | / /|  ___\ \ / /",0
	prompt9 BYTE		"| |_| | | | | /  \/| |/ / | |__  \ V / ",0
	prompt10 BYTE	"|  _  | | | | |    |    \ |  __|  \ /  ",0
	prompt11 BYTE	"| | | \ \_/ / \__/\| |\  \| |___  | |  ",0
	prompt12 BYTE	"\_| |_/\___/ \____/\_| \_/\____/  \_/  ",0
	prompts DWORD OFFSET prompt1, OFFSET prompt2, OFFSET prompt3, OFFSET prompt4, OFFSET prompt5, OFFSET prompt6, OFFSET prompt7, OFFSET prompt8, OFFSET prompt9, OFFSET prompt10, OFFSET prompt11, OFFSET prompt12
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
	ColorBox BYTE "■ ",0
	P1 BYTE          "                                         Player1: Q W E(Skill) F(Up) C(Down)",0
	P2 BYTE          "                                         Player2: I O P(Skill) 5(Up) 1(Down)",0
	back BYTE        "                                                Press ESC to return...",0
	P1_c_choose BYTE "																											 ",0
.code
PrintTitle PROC USES EAX ECX EDX 
	mov ecx,0
PrintTitlePerLine:
	mov dl,24
	mov dh,cl
	cmp ecx,5
	jng NotGreaterThan5
	mov dl,14
	add dh,1
NotGreaterThan5:
	add dh,3
	call Gotoxy
	mov eax,4
	mul ecx
	mov edx,prompts[eax]
	call WriteString
	inc ecx
	cmp ecx,12
	jl PrintTitlePerLine
	ret
PrintTitle ENDP

menu PROC

begin:                                      ;印出pixel hocky
	call Clrscr
	call PrintTitle
	jmp STA	
	
STA:                                   ;選取start時的介面
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
	mov edx,OFFSET start               ;印出選取start的假象
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
	jmp L3                             ;輸入鍵盤上、下或enter
	L3:
	mov eax,50
    call Delay
	call ReadKey                       ;讀取鍵盤輸入
	cmp dx,+40
	je SET                             ;偵測到下
	cmp dx,+38
	je OPERA                             ;偵測到上
	cmp dx,+13                 
	je GAME_PART                       ;偵測到enter
	
	jmp L3
SET:                                   ;選取setting的介面
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
	je FIN                            ;偵測到下
	cmp dx,+38
	je STA                            ;偵測到上
	cmp dx,+13
	je SET_PART                       ;偵測到enter
	
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
	mov edx,OFFSET start1               ;印出選取start的假象
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
	jmp L4                             ;輸入鍵盤上、下或enter
	L4:
	mov eax,50
    call Delay
	call ReadKey                       ;讀取鍵盤輸入
	cmp dx,+40
	je STA                             ;偵測到下
	cmp dx,+38
	je FIN                             ;偵測到上
	cmp dx,+13                 
	je OPERATION_PART                       ;偵測到enter
	
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