INCLUDE Irvine32.inc
INCLUDE Macros.inc
INCLUDELIB Winmm.lib
PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD
.data
	winwid EQU 120
	winhei EQU 30
	bar BYTE 60 DUP ("■"),0
	oldscreen BYTE winhei DUP( winwid DUP ("A"),0)
	newscreen BYTE winhei DUP( winwid DUP ("■"))
	titlestr1 BYTE		"______________  __ _____ _     ",0
	titlestr2 BYTE		"| ___ \_   _\ \/ /|  ___| |    ",0
	titlestr3 BYTE		"| |_/ / | |  \  / | |__ | |    ",0
	titlestr4 BYTE		"|  __/  | |  /  \ |  __|| |    ",0
	titlestr5 BYTE		"| |    _| |_/ /\ \| |___| |____",0
	titlestr6 BYTE		"\_|    \___/\/  \/\____/\_____/",0
	titlestr7 BYTE		" _   _  ___   ____  _   __ _______   __",0
	titlestr8 BYTE		"| | | |/ _ \ / __ \| | / /|  ___\ \ / /",0
	titlestr9 BYTE		"| |_| | | | | /  \/| |/ / | |__  \ V / ",0
	titlestr10 BYTE	"|  _  | | | | |    |    \ |  __|  \ /  ",0
	titlestr11 BYTE	"| | | | \_/ | \__/\| |\  \| |___  | |  ",0
	titlestr12 BYTE	"\_| |_|\___/ \____/\_| \_/\____/  \_/  ",0
	titlestrs DWORD OFFSET titlestr1, OFFSET titlestr2, OFFSET titlestr3, OFFSET titlestr4, OFFSET titlestr5, OFFSET titlestr6, OFFSET titlestr7, OFFSET titlestr8, OFFSET titlestr9, OFFSET titlestr10, OFFSET titlestr11, OFFSET titlestr12
	start BYTE       "> START         ",0
	setting BYTE     "> SETTING       ",0
	finish BYTE      "> EXIT          ",0
	operation BYTE   "> OPERATION     ",0
	start1 BYTE      "START           ",0
	setting1 BYTE    "SETTING         ",0
	finish1 BYTE     "EXIT            ",0
	operation1 BYTE  "OPERATION       ",0
	empty BYTE "                                                                                                                          ",0
	color BYTE       "> Color   ",0
	color1 BYTE      "Color   ",0
	speed BYTE       "> Speed   ",0
	speed1 BYTE      "Speed   ",0
	ColorBox BYTE "■ ",0
	OneBox BYTE "■",0
	P1 BYTE          "                                         Player1: Q W E(Skill) F(Up) C(Down)",0
	P2 BYTE          "                                         Player2: I O P(Skill) 5(Up) 1(Down)",0
	back BYTE        "Press ESC to return...",0
	P1_color_choose BYTE "▼",0
	P2_color_choose BYTE "▲",0
	speed_choose BYTE "▼",0
	P1_color_point_local BYTE 56d ,0
	P2_color_point_local BYTE 56d ,0
	Speed_point_local BYTE 56d,0
	P1_SetColor_Click BYTE "Press Q to set.",0
	P2_SetColor_Click BYTE "Press 0 to set.",0
	P1_color DWORD 1d,0
	P2_color DWORD 1d,0
	Speed_color DWORD 15d,0
	SND_FILENAME DWORD 00020000h
	file BYTE "喀拉音效.wav",0
	player1 BYTE ".______    __           ___   ____    ____  _______ .______      ",0
	player2 BYTE "|   _  \  |  |         /   \  \   \  /   / |   ____||   _  \    ",0
	player3 BYTE "|  |_)  | |  |        /  ^  \  \   \/   /  |  |__   |  |_)  |   ",0
	player4 BYTE "|   ___/  |  |       /  /_\  \  \_    _/   |   __|  |      /    ",0
	player5 BYTE "|  |      |  `----. /  _____  \   |  |     |  |____ |  |\  \----.",0
	player6 BYTE "| _|      |_______|/__/     \__\  |__|     |_______|| _| `._____|",0
	Pone1 BYTE "  ______   .__   __.  _______ ",0
	Pone2 BYTE " /  __  \  |  \ |  | |   ____|",0
	Pone3 BYTE "|  |  |  | |   \|  | |  |__   ",0
	Pone4 BYTE "|  |  |  | |  . `  | |   __|  ",0
	Pone5 BYTE "|  `--'  | |  |\   | |  |____ ",0
	Pone6 BYTE " \______/  |__| \__| |_______|",0
	win1 BYTE "____    __    ____  __  .__   __.      _______.",0
	win2 BYTE "\   \  /  \  /   / |  | |  \ |  |     /       |",0
	win3 BYTE " \   \/    \/   /  |  | |   \|  |    |   (----`",0
	win4 BYTE "  \            /   |  | |  . `  |     \   \    ",0
	win5 BYTE "   \    /\    /    |  | |  |\   | .----)   |   ",0
	win6 BYTE "    \__/  \__/     |__| |__| \__| |_______/    ",0
.code
PrintTitle PROC USES EAX ECX EDX 
	mov ecx,0
	mov eax,6
	call SetTextColor 
PrintTitlePerLine:
	mov dl,43
	mov dh,cl
	cmp ecx,5
	jng NotGreaterThan5
	mov dl,39
NotGreaterThan5:
	add dh,3
	call Gotoxy
	mov eax,4
	mul ecx
	mov edx,titlestrs[eax]
	call WriteString
	inc ecx
	cmp ecx,12
	jl PrintTitlePerLine
	mov eax,15
	call SetTextColor
	ret
PrintTitle ENDP

Sound PROC
	INVOKE PlaySound, OFFSET file, NULL, SND_FILENAME
	ret
Sound ENDP

PrintAll PROC
mov ecx,0
Outer:
	mov eax,winwid+1
	mul ecx
	mov dl,0
	mov dh,cl
	call Gotoxy
	add eax ,OFFSET oldscreen
	mov edx,eax
	call WriteString
	inc ecx
	cmp ecx,winhei
jne Outer
ret
PrintAll ENDP

PrintP1Wins PROC
	
	mov edx,OFFSET player1
	call WriteString
	call Crlf
	mov edx,OFFSET player2
	call WriteString
	call Crlf
	mov edx,OFFSET player3
	call WriteString
	call Crlf
	mov edx,OFFSET player4
	call WriteString
	call Crlf
	mov edx,OFFSET player5
	call WriteString
	call Crlf
	mov edx,OFFSET player6
	call WriteString
	call Crlf
	call Crlf
	mov edx,OFFSET Pone1
	call WriteString
	call Crlf
	mov edx,OFFSET Pone2
	call WriteString
	call Crlf
	mov edx,OFFSET Pone3
	call WriteString
	call Crlf
	mov edx,OFFSET Pone4
	call WriteString
	call Crlf
	mov edx,OFFSET Pone5
	call WriteString
	call Crlf
	mov edx,OFFSET Pone6
	call WriteString
	call Crlf
	call Crlf
	mov edx,OFFSET win1
	call WriteString
	call Crlf
	mov edx,OFFSET win2
	call WriteString
	call Crlf
	mov edx,OFFSET win3
	call WriteString
	call Crlf
	mov edx,OFFSET win4
	call WriteString
	call Crlf
	mov edx,OFFSET win5
	call WriteString
	call Crlf
	mov edx,OFFSET win6
	call WriteString
	call Crlf
	ret
PrintP1Wins ENDP

PrintLineOfBox PROC
mov ebx,ecx
mov ecx,0
Outer:
	mov dl,cl
	mov dh,bl
	call Gotoxy
	mov edx,OFFSET OneBox
	call WriteString
	add ecx,2
	cmp ecx,winwid
jne Outer
mov ecx,ebx
ret
PrintLineOfBox ENDP

PrintBorder PROC
mov ecx,0
Outer:
	.IF ecx == 0
	call PrintLineOfBox
	.ELSEIF ecx == winhei-1
	call PrintLineOfBox
	.ELSE
	mov dl,0
	mov dh,cl
	call Gotoxy
	mov edx,OFFSET OneBox
	call WriteString
	mov dl,winwid-2
	mov dh,cl
	call Gotoxy
	mov edx,OFFSET OneBox
	call WriteString
	.ENDIF
	inc ecx
	cmp ecx,winhei
jne Outer
mov dl,0
mov dh,0
call Gotoxy
ret
PrintBorder ENDP

GamePart PROC
call PrintBorder
mov eax,10000
call Delay
ret
GamePart ENDP

menu PROC

begin:                                      ;印出pixel hocky
	
	call Clrscr
	call PrintTitle
	jmp STA	
	
STA:                                   ;選取start時的介面
	mov dl,53
	mov dh,20
	call Gotoxy
	mov edx,OFFSET start               ;印出選取start的假象
	call WriteString
	mov dl,53
	mov dh,21
	call Gotoxy
	mov edx,OFFSET setting1
	call WriteString
	mov dl,53
	mov dh,22
	call Gotoxy
	mov edx,OFFSET finish1
	call WriteString
	mov dl,53
	mov dh,23
	call Gotoxy
	mov edx,OFFSET operation1
	call WriteString
	call Sound
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
	je GAME_PART                      ;偵測到enter
	
	jmp L3
SET:                                   ;選取setting的介面
	mov dl,53
	mov dh,20
	call Gotoxy
	mov edx,OFFSET start1
	call WriteString
	mov dl,53
	mov dh,21
	call Gotoxy
	mov edx,OFFSET setting
	call WriteString
	mov dl,53
	mov dh,22
	call Gotoxy
	mov edx,OFFSET finish1
	call WriteString
	mov dl,53
	mov dh,23
	call Gotoxy
	mov edx,OFFSET operation1
	call WriteString
	call Sound
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
	mov dl,53
	mov dh,20
	call Gotoxy
	mov edx,OFFSET start1
	call WriteString
	mov dl,53
	mov dh,21
	call Gotoxy
	mov edx,OFFSET setting1
	call WriteString
	mov dl,53
	mov dh,22
	call Gotoxy
	mov edx,OFFSET finish
	call WriteString
	mov dl,53
	mov dh,23
	call Gotoxy
	mov edx,OFFSET operation1
	call WriteString
	call Sound
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
	mov dl,53
	mov dh,20
	call Gotoxy
	mov edx,OFFSET start1               ;印出選取start的假象
	call WriteString
	mov dl,53
	mov dh,21
	call Gotoxy
	mov edx,OFFSET setting1
	call WriteString
	mov dl,53
	mov dh,22
	call Gotoxy
	mov edx,OFFSET finish1
	call WriteString
	mov dl,53
	mov dh,23
	call Gotoxy
	mov edx,OFFSET operation
	call WriteString
	call Sound
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
	call ClrScr
	;call GamePart
	call ClrScr
	call PrintP1Wins
	jmp test1
test1:
	mov eax,50
	call Delay
	call ReadKey
	cmp dx,+27
	je begin
	jmp test1;
SET_PART:
	call Sound
	call ClrScr
SET_COLOR:
	mov dl,53
	mov dh,5
	call Gotoxy
	mov edx,OFFSET setting1
	call WriteString
	mov dl,P1_color_point_local
	mov dh,8
	call Gotoxy
	mov eax,P1_color
	call SetTextColor
	mov edx,OFFSET P1_color_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	;mov dl,68
	;mov dh,8
	;call Gotoxy
	;mov edx,OFFSET P1_SetColor_Click
	;call WriteString
	mov dl,48
	mov dh,9
	call Gotoxy
	mov edx,OFFSET color
	call WriteString
	mov dl,56
	mov dh,9
	call Gotoxy
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
	mov dl,P2_color_point_local
	mov dh,10
	call Gotoxy
	mov eax,P2_color
	call SetTextColor
	mov edx,OFFSET P2_color_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	mov eax,Speed_color
	call SetTextColor
	mov dl,Speed_point_local
	mov dh,12
	call Gotoxy
	mov edx,OFFSET speed_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	;mov dl,68
	;mov dh,10
	;call Gotoxy
	;mov edx,OFFSET P2_SetColor_Click
	;call WriteString
	mov dl,48
	mov dh,13
	call Gotoxy
	mov edx,OFFSET speed1
	call WriteString
	mov edx,OFFSET colorbox
	call WriteString
	mov eax,7d
	call SetTextColor
	call WriteString
	mov eax,8d
	call SetTextColor
	call WriteString
	mov eax,6d
	call SetTextColor
	call WriteString
	mov eax,15d
	call SetTextColor
	mov dl,48
	mov dh,25
	call Gotoxy
	mov edx,OFFSET back
	call WriteString
	call Sound
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
	cmp dx,+68
	je P1_color_point_right
	cmp dx,+65
	je P1_color_point_left
	cmp dx,+39
	je P2_color_point_right
	cmp dx,+37
	je P2_color_point_left
jmp L6
P2_color_point_right:
	mov dl,0
	mov dh,10
	call Gotoxy
	mov edx,OFFSET empty
	call WriteString
	;mov dl,68
	;mov dh,10
	;call Gotoxy
	;mov edx,OFFSET P2_SetColor_Click
	;call WriteString
	cmp P2_color_point_local,65d
	jne P2_movR_color
	mov P2_color_point_local,56d
	mov P2_color,1
	mov dl,P2_color_point_local
	mov dh,10
	call Gotoxy
	mov eax,P2_color
	call SetTextColor
	mov edx,OFFSET P2_color_choose
	call WriteString
	mov eax,15d
	call SetTextColor	
	call Sound
	jmp L6
P2_movR_color:
	add P2_color_point_local,3d			
	.IF P2_color_point_local == 56
	mov P2_color,1
	.ELSEIF P2_color_point_local == 59
	mov P2_color,2
	.ELSEIF P2_color_point_local == 62
	mov P2_color,3
	.ELSEIF P2_color_point_local == 65
	mov P2_color,4
	.ENDIF
	mov eax,P2_color
	call SetTextColor
	mov dl,P2_color_point_local
	mov dh,10
	call Gotoxy
	mov edx,OFFSET P2_color_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	call Sound
	jmp L6
P2_color_point_left:
	mov dl,0
	mov dh,10
	call Gotoxy
	mov edx,OFFSET empty
	call WriteString
	;mov dl,68
	;mov dh,10
	;call Gotoxy
	;mov edx,OFFSET P2_SetColor_Click
	;call WriteString
	cmp P2_color_point_local,56d
	jne P2_movL_color
	mov P2_color_point_local,65d
	mov P2_color,4
	mov dl,P2_color_point_local
	mov dh,10
	call Gotoxy
	mov eax,P2_color
	call SetTextColor
	mov edx,OFFSET P2_color_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	call Sound
	jmp L6
P2_movL_color:
	sub P2_color_point_local,3d	
	.IF P2_color_point_local == 56
	mov P2_color,1
	.ELSEIF P2_color_point_local == 59
	mov P2_color,2
	.ELSEIF P2_color_point_local == 62
	mov P2_color,3
	.ELSEIF P2_color_point_local == 65
	mov P2_color,4
	.ENDIF
	mov eax,P2_color
	call SetTextColor
	mov dl,P2_color_point_local
	mov dh,10
	call Gotoxy
	mov edx,OFFSET P2_color_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	call Sound
	jmp L6
P1_color_point_right:
	mov dl,0
	mov dh,8
	call Gotoxy
	mov edx,OFFSET empty
	call WriteString
	;mov dl,68
	;mov dh,8
	;call Gotoxy
	;mov edx,OFFSET P1_SetColor_Click
	;call WriteString
	cmp P1_color_point_local,65d
	jne P1_movR_color
	mov P1_color_point_local,56d
	mov P1_color,1
	mov dl,P1_color_point_local
	mov dh,8
	call Gotoxy
	mov eax,P1_color
	call SetTextColor
	mov edx,OFFSET P1_color_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	call Sound
	jmp L6
P1_movR_color:
	add P1_color_point_local,3d		
	.IF P1_color_point_local == 56
	mov P1_color,1
	.ELSEIF P1_color_point_local == 59
	mov P1_color,2
	.ELSEIF P1_color_point_local == 62
	mov P1_color,3
	.ELSEIF P1_color_point_local == 65
	mov P1_color,4
	.ENDIF
	mov dl,P1_color_point_local
	mov dh,8
	call Gotoxy
	mov eax,P1_color
	call SetTextColor
	mov edx,OFFSET P1_color_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	call Sound
	jmp L6
P1_color_point_left:
	mov dl,0
	mov dh,8
	call Gotoxy
	mov edx,OFFSET empty
	call WriteString
	;mov dl,68
	;mov dh,8
	;call Gotoxy
	;mov edx,OFFSET P1_SetColor_Click
	;call WriteString
	cmp P1_color_point_local,56d
	jne P1_movL_color
	mov P1_color_point_local,65d
	mov P1_color,4
	mov dl,P1_color_point_local
	mov dh,8
	call Gotoxy
	mov eax,P1_color
	call SetTextColor
	mov edx,OFFSET P1_color_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	call Sound
	jmp L6
P1_movL_color:
	sub P1_color_point_local,3d	
	.IF P1_color_point_local == 56
	mov P1_color,1
	.ELSEIF P1_color_point_local == 59
	mov P1_color,2
	.ELSEIF P1_color_point_local == 62
	mov P1_color,3
	.ELSEIF P1_color_point_local == 65
	mov P1_color,4
	.ENDIF
	mov eax,P1_color
	call SetTextColor
	mov dl,P1_color_point_local
	mov dh,8
	call Gotoxy
	mov edx,OFFSET P1_color_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	call Sound
	jmp L6
SET_SPEED:		
	mov dl,53
	mov dh,5
	call Gotoxy
	mov edx,OFFSET setting1
	call WriteString		
	mov dl,48
	mov dh,9
	call Gotoxy
	mov edx,OFFSET color1
	call WriteString
	mov dl,56
	mov dh,9
	call Gotoxy
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
	mov dl,48
	mov dh,13
	call Gotoxy
	mov edx,OFFSET speed
	call WriteString
	mov dl,56
	mov dh,13
	call Gotoxy
	mov edx,OFFSET colorbox
	call WriteString
	mov eax,7d
    call SetTextColor
	call WriteString
	mov eax,8d
    call SetTextColor
	call WriteString
	mov eax,6d
    call SetTextColor
	call WriteString
	mov eax,15d
    call SetTextColor
	mov dl,48
	mov dh,25
	call Gotoxy
	mov edx,OFFSET back
	call WriteString
	call Sound
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
	cmp dx,37
	je Speed_point_left
	cmp dx,39
	je Speed_point_right
	jmp L7
Speed_point_right:	
	mov dl,0
	mov dh,12
	call Gotoxy
	mov edx,OFFSET empty
	call WriteString
	cmp Speed_point_local,65d
	jne Speed_movR
	mov Speed_point_local,56d
	mov Speed_color,15d
	mov eax,Speed_color
	call SetTextColor
	mov dl,Speed_point_local
	mov dh,12
	call Gotoxy
	mov edx,OFFSET speed_choose
	call WriteString
	call Sound
	jmp L7
Speed_movR:
	add Speed_point_local,3d
	.IF Speed_point_local == 56
	mov Speed_color,15
	.ELSEIF Speed_point_local == 59
	mov Speed_color,7
	.ELSEIF Speed_point_local == 62
	mov Speed_color,8
	.ELSEIF Speed_point_local == 65
	mov Speed_color,6
	.ENDIF
	mov eax,Speed_color
	call SetTextColor		
	mov dl,Speed_point_local
	mov dh,12
	call Gotoxy
	mov edx,OFFSET speed_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	call Sound
	jmp L7
Speed_point_left:
	mov dl,0
	mov dh,12
	call Gotoxy
	mov edx,OFFSET empty
	call WriteString
	cmp Speed_point_local,56d
	jne Speed_movL
	mov Speed_point_local,65d
	mov Speed_color,6d
	mov eax,Speed_color
	call SetTextColor
	mov dl,Speed_point_local
	mov dh,12
	call Gotoxy
	mov edx,OFFSET speed_choose
	call WriteString
	call Sound
	jmp L7
Speed_movL:				
	sub Speed_point_local,3d
	.IF Speed_point_local == 56
	mov Speed_color,15
	.ELSEIF Speed_point_local == 59
	mov Speed_color,7
	.ELSEIF Speed_point_local == 62
	mov Speed_color,8
	.ELSEIF Speed_point_local == 65
	mov Speed_color,6
	.ENDIF
	mov dl,Speed_point_local
	mov dh,12
	call Gotoxy
	mov eax,Speed_color
	call SetTextColor
	mov edx,OFFSET speed_choose
	call WriteString
	mov eax,15d
	call SetTextColor
	call Sound
	jmp L7
OPERATION_PART:
	call Sound
	call ClrScr
	mov dl,53
	mov dh,5
	call Gotoxy
	mov edx,OFFSET operation1
	call WriteString
	mov dl,0
	mov dh,8
	call Gotoxy
	mov edx,OFFSET P1
	call WriteString
	Call Crlf
	Call Crlf
	mov edx,OFFSET P2
	call WriteString
	mov dl,48
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
	call Sound
	exit
menu ENDP

main PROC
call menu
main ENDP
END main