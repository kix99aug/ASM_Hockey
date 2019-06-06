INCLUDE Irvine32.inc
INCLUDE Macros.inc
include WINMM.inc

INCLUDELIB Winmm.lib
				
				
.data
	winwid EQU 120
	winhei EQU 30
	screen BYTE winhei DUP( winwid DUP (0) ) ;0.空 1.方塊 2.圓圈 10~19.大數字0~9
	change BYTE winhei DUP( winwid DUP (0) )
	player1pos BYTE 12
	player2pos BYTE 12
	oldscreen BYTE winhei DUP( winwid DUP ("A"),0)
	newscreen BYTE winhei DUP( winwid DUP ("■"))
	titlestr1 BYTE		"_______    __  ___   ___  _______  __",0
	titlestr2 BYTE		"|   _  \  |  | \  \ /  / |   ____||  |",0
	titlestr3 BYTE		"|  |_)  | |  |  \  V  /  |  |__   |  |",0
	titlestr4 BYTE		"|   ___/  |  |   >   <   |   __|  |  |",0
	titlestr5 BYTE		"|  |      |  |  /  ^  \  |  |____ |  `----.",0
	titlestr6 BYTE		"| _|      |__| /__/ \__\ |_______||_______|",0
	titlestr7 BYTE		" __    __    ______     _______   ___  ____  ________ ___    ___",0
	titlestr8 BYTE		"|  |  |  |  /  __  \   /       | |   |/   / |   _____|\  \  /  /",0
	titlestr9 BYTE		"|  |__|  | |  |  |  | |   ,----' |   '   /  |  |___    \  \/  /",0
	titlestr10 BYTE		"|   __   | |  |  |  | |   |      |      <   |   ___|    \    /",0
	titlestr11 BYTE		"|  |  |  | |  `--'  | |   `----. |   .   \  |  |_____    |  |",0
	titlestr12 BYTE		"|__|  |__|  \______/   \_______| |___|\___\ |________|   |__|",0
	zero1 BYTE		"  __  ",0
	zero2 BYTE		" /  \ ",0
	zero3 BYTE		" \__/ ",0
	one1 BYTE		"      ",0      
	one2 BYTE		"  /|  ",0
	one3 BYTE		"   |  ",0
	two1 BYTE		"  __  ",0
	two2 BYTE		"   _) ",0
	two3 BYTE		"  /__ ",0
	three1 BYTE	"  __  ",0
	three2 BYTE	"   _) ",0
	three3 BYTE	"  __) ",0   
	four1 BYTE		"      ",0
	four2 BYTE		" |__| ",0
	four3 BYTE		"    | ",0
	five1 BYTE		"  __  ",0
	five2 BYTE		" |_   ",0
	five3 BYTE		" __)  ",0
	six1 BYTE		"  __  ",0
	six2 BYTE		" /__  ",0
	six3 BYTE		" \__) ",0
	seven1 BYTE	" ___  ",0
	seven2 BYTE	"   /  ",0
	seven3 BYTE	"  /   ",0
	eight1 BYTE	"  __  ",0
	eight2 BYTE	" (__) ",0
	eight3 BYTE	" (__) ",0
	nine1 BYTE		"  __  ",0
	nine2 BYTE		" (__\ ",0
	nine3 BYTE		"  __/ ",0
	zero DWORD OFFSET zero1,OFFSET zero2,OFFSET zero3
	one DWORD OFFSET one1,OFFSET one2,OFFSET one3		
	two DWORD OFFSET two1,OFFSET two2,OFFSET two3
	three DWORD OFFSET three1,OFFSET three2,OFFSET three3
	four DWORD OFFSET four1,OFFSET four2,OFFSET four3
	five DWORD OFFSET five1,OFFSET five2,OFFSET five3
	six DWORD OFFSET six1,OFFSET six2,OFFSET six3
	seven DWORD OFFSET seven1,OFFSET seven2,OFFSET seven3
	eight DWORD OFFSET eight1,OFFSET eight2,OFFSET eight3
	nine DWORD OFFSET nine1,OFFSET nine2,OFFSET nine3
	titlestrs DWORD OFFSET titlestr1, OFFSET titlestr2, OFFSET titlestr3, OFFSET titlestr4, OFFSET titlestr5, OFFSET titlestr6, OFFSET titlestr7, OFFSET titlestr8, OFFSET titlestr9, OFFSET titlestr10, OFFSET titlestr11, OFFSET titlestr12
	start BYTE       "> START         ",0			
	setting BYTE     "> SETTING       ",0			
	finish BYTE      "> EXIT          ",0			
	operation BYTE   "> OPERATION     ",0
	start1 BYTE      "START           ",0
	setting1 BYTE    "SETTING         ",0
	finish1 BYTE     "EXIT            ",0
	operation1 BYTE  "OPERATION       ",0
	empty BYTE "                                                                                                                                 ",0
	color BYTE       "> Color   ",0
	color1 BYTE      "Color   ",0
	speed BYTE       "> Speed   ",0
	speed1 BYTE      "Speed   ",0
	ColorBox BYTE "■",0
	OneBox BYTE "■",0
	OneCircle BYTE "·",0
	P1 BYTE          "Player1: A(AirWall) D(SpeedUp) W(Up) S(Down)",0
	P2 BYTE          "Player2: ←(AirWall) →(SpeedUp) ↑(Up) ↓(Down)",0
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
	P1_score BYTE 10
	P2_score BYTE 10
	P1_mov BYTE 0
	P2_mov BYTE 0



	P1_skill_long DWORD 0
	P2_skill_long DWORD 0
	counter       BYTE 0


	SND_FILENAME				equ		20000h
	SND_SYNC            equ    0000h   ; play synchronously (default) 
	SND_ASYNC           equ    0001h   ; play asynchronously 
	SND_NODEFAULT       equ    0002h   ; don't use default sound 
	SND_MEMORY          equ    0004h   ; lpszSoundName points to a memory file 
	SND_LOOP            equ    0008h   ; loop the sound until next sndPlaySound 
	SND_NOSTOP          equ    0010h   ; don't stop any currently playing sound 

	loading BYTE "Loading...",0

	_click BYTE "KK.wav",0
	_okletsgo BYTE "oklet'sgo.wav",0
	_yeah BYTE "yeah.wav",0
	_hit_low BYTE "hit_low.wav",0
	_hit_hei BYTE "hit_hei.wav",0
	_hit_wall BYTE "hit_wall.wav",0
	_start_open BYTE "start開場音效.wav",0
	_get_point BYTE "get_point.wav",0
	_gameoverBGM BYTE "gameoverBGM.wav",0

	menusound1 BYTE "open menusound.wav type mpegvideo alias song1",0
	menusound2 BYTE "play song1 repeat",0
	menusound3 BYTE "close song1",0
	starbgm1 BYTE "open startBGM.mp3 type mpegvideo alias song2",0
	starbgm2 BYTE "play song2 repeat",0
	starbgm3 BYTE "close song2 ",0



	player1 BYTE ".______    __           ___   ____    ____  _______ .______",0
	player2 BYTE "|   _  \  |  |         /   \  \   \  /   / |   ____||   _  \",0
	player3 BYTE "|  |_)  | |  |        /  ^  \  \   \/   /  |  |__   |  |_)  |",0
	player4 BYTE "|   ___/  |  |       /  /_\  \  \_    _/   |   __|  |      /",0
	player5 BYTE "|  |      |  `----. /  _____  \   |  |     |  |____ |  |\  \----.",0
	player6 BYTE "| _|      |_______|/__/     \__\  |__|     |_______|| _| `._____|",0
	player DWORD OFFSET player1,OFFSET player2,OFFSET player3, OFFSET player4, OFFSET player5, OFFSET player6
	Pone1 BYTE "  ______   .__   __.  _______ ",0
	Pone2 BYTE " /  __  \  |  \ |  | |   ____|",0
	Pone3 BYTE "|  |  |  | |   \|  | |  |__   ",0
	Pone4 BYTE "|  |  |  | |  . `  | |   __|  ",0
	Pone5 BYTE "|  `--'  | |  |\   | |  |____ ",0
	Pone6 BYTE " \______/  |__| \__| |_______|",0
	Pone DWORD OFFSET Pone1,OFFSET Pone2,OFFSET Pone3, OFFSET Pone4, OFFSET Pone5, OFFSET Pone6
	Ptwo1 BYTE ".___________.____    __    ____  ______   ",0
	Ptwo2 BYTE "|           |\   \  /  \  /   / /  __  \  ",0
	Ptwo3 BYTE "`---|  |----` \   \/    \/   / |  |  |  | ",0
	Ptwo4 BYTE "    |  |       \            /  |  |  |  | ",0
	Ptwo5 BYTE "    |  |        \    /\    /   |  `--'  | ",0
	Ptwo6 BYTE "    |__|         \__/  \__/     \______/  ",0
	Ptwo DWORD OFFSET Ptwo1,OFFSET Ptwo2,OFFSET Ptwo3,OFFSET Ptwo4,OFFSET Ptwo5,OFFSET Ptwo6
	win1 BYTE "____    __    ____  __  .__   __.      _______.",0
	win2 BYTE "\   \  /  \  /   / |  | |  \ |  |     /       |",0
	win3 BYTE " \   \/    \/   /  |  | |   \|  |    |   (----`",0
	win4 BYTE "  \            /   |  | |  . `  |     \   \    ",0
	win5 BYTE "   \    /\    /    |  | |  |\   | .----)   |   ",0
	win6 BYTE "    \__/  \__/     |__| |__| \__| |_______/    ",0
	winner DWORD OFFSET win1,OFFSET win2,OFFSET win3, OFFSET win4, OFFSET win5, OFFSET win6
	SetConsoleDisplayMode PROTO STDCALL :DWORD,:DWORD,:DWORD
	SetCurrentConsoleFontEx PROTO STDCALL :DWORD, :DWORD, :DWORD
	GetCurrentConsoleFontEx PROTO STDCALL :DWORD, :DWORD, :DWORD
	CONSOLE_FONT_INFOEX STRUCT
    cbSize DWORD ?
    nFont DWORD ?
		dwFontSize COORD <>
		FontFamily DWORD ?
		FontWeight DWORD ?
		FaceName DWORD ?
	CONSOLE_FONT_INFOEX ENDS
.code
PrintTitle PROC USES EAX ECX EDX 
	mov ecx,0
	mov eax,6
	call SetTextColor 
PrintTitlePerLine:
	mov dl,38
	mov dh,cl
	cmp ecx,5
	jng NotGreaterThan5
	mov dl,27
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




MenuSound PROC 
	INVOKE mciSendString, OFFSET menusound1, NULL, 0, NULL
	INVOKE mciSendString, OFFSET menusound2, NULL, 0, NULL
	ret
MenuSound ENDP
StopMenuSound PROC 
	INVOKE mciSendString, OFFSET menusound3, NULL, 0, NULL
	ret
StopMenuSound ENDP

StartBGM PROC USES eax
	INVOKE mciSendString, OFFSET starbgm1, NULL, 0, NULL
	INVOKE mciSendString, OFFSET starbgm2, NULL, 0, NULL
	ret
StartBGM ENDP
StopStartBGM PROC USES eax
	INVOKE mciSendString, OFFSET starbgm3, NULL, 0, NULL
	;INVOKE mciSendString, OFFSET starbgm2, NULL, 0, NULL
	ret
StopStartBGM ENDP

Sound PROC USES eax
	mov eax,SND_FILENAME
	or eax,SND_ASYNC
	INVOKE PlaySound, OFFSET _click, NULL, eax
	ret
Sound ENDP

SetConsole PROC
.data?
	cci CONSOLE_CURSOR_INFO <>
	csbi CONSOLE_SCREEN_BUFFER_INFO <>
	cfi CONSOLE_FONT_INFOEX <>
	xy COORD <>
	rect SMALL_RECT <>
	chand dd ?
.code
	invoke GetStdHandle,STD_OUTPUT_HANDLE
	mov chand,eax
	invoke GetConsoleCursorInfo,chand,addr cci
	invoke GetConsoleScreenBufferInfo,chand,addr csbi
	mov rect.Right,winwid-1
	mov rect.Bottom,winhei
	mov xy.X,winwid
	mov xy.Y,winhei+1
	mov cci.bVisible,FALSE
	invoke SetConsoleDisplayMode,chand,1,NULL
	invoke SetConsoleCursorInfo,chand,addr cci
	invoke SetConsoleScreenBufferSize,chand,xy
	invoke SetConsoleWindowInfo,chand,TRUE,addr rect
	mov cfi.cbSize,84
	invoke GetCurrentConsoleFontEx,chand,FALSE,addr cfi
	mov cfi.dwFontSize.X,36
	mov cfi.dwFontSize.Y,29
	invoke SetCurrentConsoleFontEx,chand,FALSE,addr cfi
	ret
SetConsole ENDP


OKLETSGO PROC USES eax
	mov eax,SND_FILENAME
	or eax,SND_ASYNC
	INVOKE PlaySound, OFFSET _okletsgo, NULL, eax
	ret
OKLETSGO ENDP

soundyeah PROC
	INVOKE PlaySound, OFFSET _yeah, NULL, SND_FILENAME
	ret
soundyeah ENDP

hit_low PROC USES eax
	mov eax,SND_FILENAME
	or eax,SND_ASYNC
	INVOKE PlaySound, OFFSET _hit_low, NULL, eax
	ret
hit_low ENDP

hit_hei PROC USES eax
	mov eax,SND_FILENAME
	or eax,SND_ASYNC
	INVOKE PlaySound, OFFSET _hit_hei, NULL, eax
	ret
hit_hei ENDP

hit_wall PROC USES eax
	mov eax,SND_FILENAME
	or eax,SND_ASYNC
	INVOKE PlaySound, OFFSET _hit_wall, NULL, eax
	ret
hit_wall ENDP

start_open PROC USES eax
	mov eax,SND_FILENAME
	or eax,SND_ASYNC
	INVOKE PlaySound, OFFSET _start_open, NULL, eax
	ret
start_open ENDP

get_point PROC USES eax
	mov eax,SND_FILENAME
	or eax,SND_ASYNC
	INVOKE PlaySound, OFFSET _get_point, NULL, eax
	ret
get_point ENDP

gameoverBGM PROC USES eax
	mov eax,SND_FILENAME
	or eax,SND_ASYNC
	INVOKE PlaySound, OFFSET _gameoverBGM, NULL, eax
	ret
gameoverBGM ENDP


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

PrintWins PROC
	mov dl,28
	mov dh,4
	call Gotoxy
	mov eax ,0
	Print_player:
	push edx
	mov edx, player[eax]
	call WriteString
	pop edx
	inc dh
	call Gotoxy
	add eax,4
	cmp eax,+20
	jng Print_player

	.IF P1_score == 15
		call P1one
	.ElSEIF P2_score == 15
		call P2two
	.ENDIF
	mov eax ,0
	mov dl,36
	mov dh,18
	call Gotoxy
	Print_winner:
	push edx
	mov edx, winner[eax]
	call WriteString
	pop edx
	inc dh
	call Gotoxy
	add eax,4
	cmp eax,+20
	jng Print_winner
	call gameoverBGM
	ret
PrintWins ENDP

P1one PROC
	mov eax ,0
	mov dl,43
	mov dh,11
	call Gotoxy
	Print_one:
	push edx
	mov edx, Pone[eax]
	call WriteString
	pop edx
	inc dh
	call Gotoxy
	add eax,4
	cmp eax,+20
	jng Print_one
	ret
P1one ENDP
	
P2two PROC
	mov eax ,0
	mov dl,38
	mov dh,11
	call Gotoxy
	Print_two:
	push edx
	mov edx, Ptwo[eax]
	call WriteString
	pop edx
	inc dh
	call Gotoxy
	add eax,4
	cmp eax,+20
	jng Print_two
	ret
P2two ENDP

P1_score_plus PROC
	inc P1_score
	.IF P1_score == 15
		call PrintWins
	.ENDIF
	mov P1_score,10
	ret
P1_score_plus ENDP

P2_score_plus PROC
	inc P2_score
	.IF P2_score == 15
		call PrintWins
	.ENDIF
	mov P2_score,10
	ret
P2_score_plus ENDP

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
mov al,0FFH
call SetTextColor
mov ecx,0
Outer:
	.IF ecx == 0 || ecx == 5 || ecx == winhei-1
	call PrintLineOfBox
	.ELSEIF ecx < 15 || ecx > 19
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
	.ELSE
	mov dl,1
	mov dh,cl
	call Gotoxy
	mov eax,'|'
	call WriteChar
	mov dl,winwid-2
	mov dh,cl
	call Gotoxy
	call WriteChar
	.ENDIF
	inc ecx
	cmp ecx,winhei
jne Outer
mov eax,15
call SetTextColor
mov dl,59
mov dh,2
call Gotoxy
mov edx,OFFSET OneCircle
call WriteString
mov dl,59
mov dh,3
call Gotoxy
mov edx,OFFSET OneCircle
call WriteString
mov dl,0
mov dh,0
call Gotoxy

ret

PrintBorder ENDP

PrintNumber PROC USES eax ebx ecx edx x:BYTE, y:BYTE, number:BYTE
mov eax,15
call SetTextColor
mov dl,x
mov dh,y
mov ecx,0
Outer:
	call Gotoxy
	push edx
	.IF number == 10
		mov edx,zero[ecx]
	.ELSEIF  number == 11
		mov edx,one[ecx]
	.ELSEIF  number == 12
		mov edx,two[ecx]
	.ELSEIF  number == 13
		mov edx,three[ecx]
	.ELSEIF  number == 14
		mov edx,four[ecx]
	.ELSEIF  number == 15
		mov edx,five[ecx]
	.ELSEIF  number == 16
		mov edx,six[ecx]
	.ELSEIF  number == 17
		mov edx,seven[ecx]
	.ELSEIF  number == 18
		mov edx,eight[ecx]
	.ELSEIF  number == 19
		mov edx,nine[ecx]
	.ENDIF
	call WriteString
	pop edx
	inc dh
	add ecx,4
	cmp ecx,12
jne Outer
ret
PrintNumber ENDP

PrintScreen PROC
mov ecx,0
Outer:
	push ecx
	mov ebx,ecx
	mov ecx,0
	Inner:
		push ebx
		mov eax,winwid
		mul ebx
		add eax,ecx
		mov dl,change[eax]
		cmp dl,screen[eax]
		je Equal
		NotEqual:
			mov dl,cl
			mov dh,bl
			call Gotoxy
			push eax
			.IF change[eax] == 0
				.IF screen[eax] == 1 || screen[eax] == 2
					mov eax,' '
					call WriteChar
					inc dl
					call Gotoxy
					call WriteChar
				.ELSE
					mov eax,' '
					call WriteChar
				.ENDIF
			.ELSEIF change[eax] == 1
				.IF dl == 5
					mov eax,P1_color
					call SetTextColor
					mov edx,OFFSET OneBox
					call WriteString
					mov eax,15
					call SetTextColor
				.ELSE
					mov eax,P2_color
					call SetTextColor
					mov edx,OFFSET OneBox
					call WriteString
					mov eax,15
					call SetTextColor
				.ENDIF
			.ELSEIF change[eax] == 2
				mov edx,OFFSET OneCircle
				call SetTextColor
			.ELSEIF change[eax] >= 10 || change[eax] <= 19
				invoke PrintNumber,cl,bl,change[eax]
			.ELSE
				movzx eax,change[eax]
				call WriteChar
			.ENDIF
			pop eax
			mov bl,change[eax]
			mov screen[eax],bl
		Equal:
		mov change[eax],0
		pop ebx
		inc ecx
		cmp ecx,winwid
	jne Inner
	pop ecx
	inc ecx
	cmp ecx,winhei
jne Outer
ret
PrintScreen ENDP


SetPlayer1 PROC
mov ecx,0
ThreeBox1:
	mov eax,winwid
	mov ebx,0
	mov bl,player1pos
	add ebx,4
	add ebx,ecx
	mul ebx
	add eax,5
	mov change[eax],1
	inc ecx
	cmp ecx,3
jne ThreeBox1
	.IF P1_skill_long==2
	add eax,winwid
	mov change[eax],1
	add eax,winwid
	mov change[eax],1

	.ENDIF
ret
SetPlayer1 ENDP

SetPlayer2 PROC
mov ecx,0
ThreeBox2:
	mov eax,winwid
	mov ebx,0
	mov bl,player2pos
	add ebx,4
	add ebx,ecx
	mul ebx
	add eax,113
	mov change[eax],1
	inc ecx
	cmp ecx,3
jne ThreeBox2
	.IF P2_skill_long==2
	add eax,winwid
	mov change[eax],1
	add eax,winwid
	mov change[eax],1
	.ENDIF
ret
SetPlayer2 ENDP


ClearScreen PROC
mov ecx,0
Outer:
	push ecx
	mov ebx,ecx
	mov ecx,0
	Inner:
		mov eax,winwid
		mul ebx
		add eax,ecx
		mov screen[eax],0
		inc ecx
		cmp ecx,winwid
	jne Inner
	pop ecx
	inc ecx
	cmp ecx,winhei
jne Outer
ret
ClearScreen ENDP

SCORE PROC
mov al,P1_score
mov change[169],al
mov al,P2_score
mov change[185],al
ret
SCORE ENDP

p1_mov_up PROC
.IF player1pos != 2
	sub player1pos,1
.ENDIF
ret
p1_mov_up ENDP

p1_mov_down PROC
mov edx,22
sub edx,P1_skill_long
.IF player1pos != dl
	add player1pos,1
.ENDIF
ret
p1_mov_down ENDP

p2_mov_up PROC
.IF player2pos != 2
	sub player2pos,1
.ENDIF
ret
p2_mov_up ENDP

p2_mov_down PROC
mov edx,22
sub edx,P1_skill_long
.IF player2pos != dl
	add player2pos,1
.ENDIF
ret
p2_mov_down ENDP

P1_skill_A PROC
mov P1_skill_long,2
ret
P1_skill_A ENDP

GamePart PROC
call StartBGM
call PrintBorder
call SetPlayer1
call SetPlayer2
call SCORE
call PrintScreen
mov eax,300
call Delay
call start_open
call ClearScreen
jmp play_mov

play_mov:

mov eax,10
call Delay
call ReadKey
.IF dx == 38
call p2_mov_up
.ELSEIF dx == 40
call p2_mov_down
.ELSEIF dx == 87
call p1_mov_up
.ELSEIF dx == 83
call p1_mov_down
.ELSEIF dx == 65 || dx == 97
mov P1_skill_long,2
push ebx
mov ebx,0
.ENDIF

.IF P1_skill_long==2
add ebx,1

.IF ebx > 300
mov P1_skill_long,0
.ENDIF
.ENDIF
call SetPlayer1
call SetPlayer2
call SCORE
call PrintScreen
jmp play_mov
ret
GamePart ENDP
menu PROC
call SetConsole ; hide cursor, resize the window, fullscreen , etc
	call Clrscr
	mov dl,55
	mov dh,15
	call Gotoxy
	mov edx,OFFSET loading
	call WriteString
begin:                                      ;印出pixel hocky
	call MenuSound
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
	call StopMenuSound
	call ClrScr
	mov dl,55
	mov dh,15
	call Gotoxy
	mov edx,OFFSET loading
	call WriteString
	call OKLETSGO
	mov eax,1700
	call delay
	call ClrScr
	call GamePart
	call ClrScr
	
	call StopStartBGM
	;call soundyeah
	call PrintWins
	jmp test1
test1:
	mov eax,50
	call Delay
	call ReadKey
	cmp dx,+27
	je begin
	jmp test1
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
	cmp P2_color_point_local,62d
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
	add P2_color_point_local,2d			
	.IF P2_color_point_local == 56
	mov P2_color,1
	.ELSEIF P2_color_point_local == 58
	mov P2_color,2
	.ELSEIF P2_color_point_local == 60
	mov P2_color,3
	.ELSEIF P2_color_point_local == 62
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
	cmp P2_color_point_local,56d
	jne P2_movL_color
	mov P2_color_point_local,62d
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
	sub P2_color_point_local,2d	
	.IF P2_color_point_local == 56
	mov P2_color,1
	.ELSEIF P2_color_point_local == 58
	mov P2_color,2
	.ELSEIF P2_color_point_local == 60
	mov P2_color,3
	.ELSEIF P2_color_point_local == 62
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
	cmp P1_color_point_local,62d
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
	add P1_color_point_local,2d		
	.IF P1_color_point_local == 56
	mov P1_color,1
	.ELSEIF P1_color_point_local == 58
	mov P1_color,2
	.ELSEIF P1_color_point_local == 60
	mov P1_color,3
	.ELSEIF P1_color_point_local == 62
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
	cmp P1_color_point_local,56d
	jne P1_movL_color
	mov P1_color_point_local,62d
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
	sub P1_color_point_local,2d	
	.IF P1_color_point_local == 56
	mov P1_color,1
	.ELSEIF P1_color_point_local == 58
	mov P1_color,2
	.ELSEIF P1_color_point_local == 60
	mov P1_color,3
	.ELSEIF P1_color_point_local == 62
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
	cmp Speed_point_local,62d
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
	add Speed_point_local,2d
	.IF Speed_point_local == 56
	mov Speed_color,15
	.ELSEIF Speed_point_local == 58
	mov Speed_color,7
	.ELSEIF Speed_point_local == 60
	mov Speed_color,8
	.ELSEIF Speed_point_local == 62
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
	mov Speed_point_local,62d
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
	sub Speed_point_local,2d
	.IF Speed_point_local == 56
	mov Speed_color,15
	.ELSEIF Speed_point_local == 58
	mov Speed_color,7
	.ELSEIF Speed_point_local == 60
	mov Speed_color,8
	.ELSEIF Speed_point_local == 62
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
	mov dl,40
	mov dh,8
	call Gotoxy
	mov edx,OFFSET P1
	call WriteString
	mov dl,40
	mov dh,11
	call Gotoxy
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