INCLUDE Irvine32.inc
INCLUDE Macros.inc
include WINMM.inc
INCLUDELIB Winmm.lib

.data
	winwid EQU 120
	winhei EQU 30
	screen BYTE winhei DUP( winwid DUP (0) ) ;0.空 1.方塊 2.圓圈 3.一半的方塊 10~19.大數字0~9
	change BYTE winhei DUP( winwid DUP (0) )
	player1pos BYTE 12
	player2pos BYTE 12
	ballU EQU 7 ;OK
	ballD EQU 27 ;OK
	ballL EQU 3
	ballR EQU 115 ;OK
	ballspeed DWORD 4
	ballx DWORD 59
	bally DWORD 17
	ballx2 SDWORD 1
	bally2 SDWORD 1
	ballRealX DWORD 5900
	ballRealY DWORD 1700
	vectorX SDWORD -70
	vectorY DWORD 70
	balltimer DWORD 0
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
	OneCircle BYTE "●",0
	OneDot BYTE "·",0
	P1 BYTE          "Player1: Ａ(Enhanced plate) Ｄ(SpeedUp) Ｗ(Up) Ｓ(Down)",0
	P2 BYTE          "Player2: ←(Enhanced plate) →(SpeedUp) ↑(Up) ↓(Down)",0
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
	P1_skill1_times BYTE 0
	P2_skill1_times BYTE 0
	P1_skill2_times BYTE 0
	P2_skill2_times BYTE 0
	timer1 DWORD 0
	timer2 DWORD 0
	playboard BYTE 1

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
	hit_wall1 BYTE "open hit_wall.wav type WAVEAudio alias hit_wall",0
	hit_wall2 BYTE "play hit_wall from 0",0
	hit_wall3 BYTE "stop hit_wall",0
	hit_wall4 BYTE "close song2 ",0
  skillbox1 BYTE " |-..-|",0
  skillbox2 BYTE "\|(00)|/",0
  skillbox3 BYTE " |    |",0
  skillbox4 BYTE "()____() ",0
	skillbox DWORD OFFSET skillbox1,OFFSET skillbox2,OFFSET skillbox3, OFFSET skillbox4
	skillbar BYTE "▄",0
	BigA BYTE "Ａ",0
	BigD BYTE "Ｄ",0
	BigL BYTE "←",0
	BigR BYTE "→",0
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
	victory BYTE 0
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
.data
	setvolume BYTE "setaudio song2 volume to 900",0
.code
	INVOKE mciSendString, OFFSET starbgm1, NULL, 0, NULL
	INVOKE mciSendString, OFFSET setvolume, NULL, 0, NULL
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
	;mov eax,SND_FILENAME
	;or eax,SND_ASYNC
	;INVOKE PlaySound, OFFSET _hit_wall, NULL, eax
	INVOKE mciSendString, OFFSET hit_wall1, NULL, 0, NULL
	INVOKE mciSendString, OFFSET hit_wall2, NULL, 0, NULL
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
	mov P1_skill1_times,0
	mov P2_skill1_times,0
	mov P1_skill2_times,0
	mov P2_skill2_times,0
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

	.IF P1_score >=15
		call P1one
	.ELSE
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
	mov	P1_score , 10
	mov	P2_score , 10
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
	.ENDIF
	inc ecx
	cmp ecx,winhei
jne Outer
mov eax,15
call SetTextColor
mov dl,59
mov dh,2
call Gotoxy
mov edx,OFFSET OneDot
call WriteString
mov dl,59
mov dh,3
call Gotoxy
mov edx,OFFSET OneDot
call WriteString
mov al,black*16+yellow
call SetTextColor
mov dl,0
mov dh,0
call Gotoxy
mov dl,6
mov dh,1
call Gotoxy
mov edx,OFFSET skillbox1
call WriteString
mov dl,6
mov dh,2
call Gotoxy
mov edx,OFFSET skillbox2
call WriteString
mov dl,6
mov dh,3
call Gotoxy
mov edx,OFFSET skillbox3
call WriteString
mov dl,6
mov dh,4
call Gotoxy
mov edx,OFFSET skillbox4
call WriteString
mov dl,26
mov dh,1
call Gotoxy
mov edx,OFFSET skillbox1
call WriteString
mov dl,26
mov dh,2
call Gotoxy
mov edx,OFFSET skillbox2
call WriteString
mov dl,26
mov dh,3
call Gotoxy
mov edx,OFFSET skillbox3
call WriteString
mov dl,26
mov dh,4
call Gotoxy
mov edx,OFFSET skillbox4
call WriteString
mov dl,82
mov dh,1
call Gotoxy
mov edx,OFFSET skillbox1
call WriteString
mov dl,82
mov dh,2
call Gotoxy
mov edx,OFFSET skillbox2
call WriteString
mov dl,82
mov dh,3
call Gotoxy
mov edx,OFFSET skillbox3
call WriteString
mov dl,82
mov dh,4
call Gotoxy
mov edx,OFFSET skillbox4
call WriteString
mov dl,102
mov dh,1
call Gotoxy
mov edx,OFFSET skillbox1
call WriteString
mov dl,102
mov dh,2
call Gotoxy
mov edx,OFFSET skillbox2
call WriteString
mov dl,102
mov dh,3
call Gotoxy
mov edx,OFFSET skillbox3
call WriteString
mov dl,102
mov dh,4
call Gotoxy
mov edx,OFFSET skillbox4
call WriteString
mov al,16*yellow+black
call SetTextColor
mov dl,9
mov dh,3
call Gotoxy
mov edx,OFFSET BigA
call WriteString
mov dl,29
mov dh,3
call Gotoxy
mov edx,OFFSET BigD
call WriteString
mov dl,85
mov dh,3
call Gotoxy
mov edx,OFFSET BigL
call WriteString
mov dl,105
mov dh,3
call Gotoxy
mov edx,OFFSET BigR
call WriteString

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
				.IF screen[eax] == 1 || screen[eax] == 2 || screen[eax] == 3
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
					mov edx,16
					mul edx
					add eax,P1_color
					call SetTextColor
					mov edx,OFFSET OneBox
					call WriteString
					mov eax,15
					call SetTextColor
				.ELSE
					mov eax,P2_color
					mov edx,16
					mul edx
					add eax,P2_color
					call SetTextColor
					mov edx,OFFSET OneBox
					call WriteString
					mov eax,15
					call SetTextColor
				.ENDIF
			.ELSEIF change[eax] == 2
				mov edx,OFFSET OneCircle
				call WriteString
				;call SetTextColor
				.ELSEIF change[eax] == 3
				mov edx,OFFSET skillbar
				call WriteString
				;call SetTextColor
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
SetVectorX PROC
.data
	numtobesqrt DWORD ?
.code
	mov eax,vectorY
	mov ecx,vectorX
	imul eax
	mov ebx,10000
	sub ebx,eax
	cmp ebx,0
	mov numtobesqrt,ebx
	fild numtobesqrt
	fsqrt
	fistp vectorX
	mov ebx,vectorX
	cmp ecx,0
	jng positive
		neg vectorX
	positive:
	ret
SetVectorX ENDP
SetVectorY PROC USES edx
	mov eax,100
	mov ebx,vectorY
	cmp ebx,0
	jg postive
	neg ebx
	postive:
	sub eax,ebx
	cdq
	mov ebx,2
	idiv ebx
	.IF ballx < 59
	movzx edx, player1pos
	add edx,3
	.ELSE
	movzx edx,player2pos
	add edx,3
	.ENDIF
	add edx,2
	sub edx,bally
	imul edx
	mov ebx,2
	cdq
	idiv ebx
	sub vectorY,eax
	ret
SetVectorY ENDP
ResetGame PROC
.IF P1_score >= 15 || P2_score >= 15
mov victory,1
.ELSE
call   Randomize
mov eax , 100 
call RandomRange
mov ballx,59
mov bally,17
mov ballRealX,5900
mov ballRealY,1700
mov Player1pos,12
mov Player2pos,12
mov balltimer,0
mov vectorY,eax
call SetVectorX
call SCORE
call PrintScreen
call SetBall
call SetSkillBar
call SetPlayer1
call SetPlayer2
call PrintScreen
mov eax,1000
call Delay
.ENDIF
ret
ResetGame ENDP
SetBall PROC USES eax ebx ecx edx
	mov ecx,0
	mov eax,winwid
	mov ebx,0
	add ebx,bally
	mul ebx
	add eax,ballx
	mov change[eax],2
	add balltimer,1
	mov ecx,balltimer
	cmp ecx,ballspeed
	jle nomove
		mov balltimer,0
		.IF ballx > ballR+1
			inc P1_score
			call ResetGame
		.ELSEIF  ballx < ballL-1
			inc P2_score
			call ResetGame
		.ENDIF
		.IF bally > ballD
			mov bally,27
			mov ballRealY,2700
			neg vectorY
			call hit_wall
		.ELSEIF bally < ballU
			mov bally,7
			mov ballRealY,700
			neg vectorY
			call hit_wall
		.ENDIF
		mov ecx,vectorX
		add ballRealX,ecx
		mov ecx,vectorY
		add ballRealY,ecx
		mov eax,ballRealX
		mov ebx,100
		cdq
		div ebx
		.IF edx > 50
		inc eax
		.ENDIF
		mov ballx,eax
		mov eax,ballRealY
		mov ebx,100
		cdq
		div ebx
		.IF edx > 50
		inc eax
		.ENDIF
		mov bally,eax
		.IF ballx >= 2 && ballx <= 7
		movsx eax,player1pos
		add eax,3

		mov ebx,eax
		add ebx,4
		add ebx,P1_skill_long
		.IF bally >= eax && bally <= ebx
		call hit_hei
			.IF bally == eax || bally == ebx
				.IF bally == eax
					dec bally
					sub ballRealY,100
				.ELSE
					inc bally
					add ballRealY,100
				.ENDIF
				neg vectorY
			.ELSE
			add ballX,4
			add ballRealX,400
			call SetVectorY
			call SetVectorX
			.ENDIF
		.ENDIF
		.ENDIF
		.IF ballx >= 111 && ballx <= 116
		movsx eax,player2pos
		add eax,3
		mov ebx,eax
		add ebx,4
		add ebx,P2_skill_long
		.IF bally >= eax && bally <= ebx
		call hit_low
			.IF bally == eax || bally == ebx
				.IF bally == eax
					dec bally
					sub ballRealY,100
				.ELSE
					inc bally
					add ballRealY,100
				.ENDIF
				neg vectorY
			.ELSE
			sub ballX,4
			sub ballRealX,400
			call SetVectorY
			call SetVectorX
			.ENDIF
		.ENDIF
		.ENDIF
	nomove:
ret
SetBall ENDP
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
	.IF P1_skill_long == 2 && player1pos != 22 && player1pos != 21
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
	.IF P2_skill_long==2 && player2pos != 22 && player2pos !=21
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
	mov cl,playboard
	sub player1pos,cl
.ENDIF
ret
p1_mov_up ENDP
p1_mov_down PROC
mov edx,22
sub edx,P1_skill_long
.IF player1pos != dl
	mov cl,playboard
	add player1pos,cl
.ENDIF
ret
p1_mov_down ENDP
p2_mov_up PROC
.IF player2pos != 2
	mov cl,playboard
	sub player2pos,cl
.ENDIF
ret
p2_mov_up ENDP
p2_mov_down PROC
mov edx,22
sub edx,P2_skill_long
.IF player2pos != dl
	mov cl,playboard
	add player2pos,cl
.ENDIF
ret
p2_mov_down ENDP
P1_skill_A PROC
mov P1_skill_long,2
ret
P1_skill_A ENDP
SetSkillBar PROC
mov change[240+17],3
mov change[360+17],3
mov change[480+17],3
mov change[240+37],3
mov change[360+37],3
mov change[480+37],3
mov change[240+93],3
mov change[360+93],3
mov change[480+93],3
mov change[240+113],3
mov change[360+113],3
mov change[480+113],3
mov ecx,0
P1_SKILL1:
cmp cl,P1_SKILL1_times
jg L2
mov eax,120
mul ecx
mov change[eax+120+17],0
inc ecx
jmp P1_SKILL1
L2:
mov ecx,0
P1_SKILL2:
cmp cl,P1_SKILL2_times
jg L3
mov eax,120
mul ecx
mov change[eax+120+37],0
inc ecx
jmp P1_SKILL2
L3:
mov ecx,0
P2_SKILL1:
cmp cl,P2_SKILL1_times
jg L4
mov eax,120
mul ecx
mov change[eax+120+93],0
inc ecx
jmp P2_SKILL1
L4:
mov ecx,0
P2_SKILL2:
cmp cl,P2_SKILL2_times
jg endr
mov eax,120
mul ecx
mov change[eax+120+113],0
inc ecx
jmp P2_SKILL2
endr:
ret
SetSkillBar ENDP
GamePart PROC
call StartBGM
call PrintBorder
call SetPlayer1
call SetPlayer2
call   Randomize
mov eax , 100 
call RandomRange
mov vectorY,eax
call SetVectorX
call SetBall
call SCORE
call PrintScreen
mov eax,300
call Delay
call start_open
play_mov:

call SetSkillBar
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
.ELSEIF dx == 65 && P1_skill1_times != 3 && P1_skill_long != 2
add P1_skill1_times,1
mov P1_skill_long,2
mov change[240+17],0
push ebp
mov ebp,0
.ELSEIF dx == 37 && P2_skill1_times != 3 && P2_skill_long != 2
add P2_skill1_times,1
mov P2_skill_long,2
mov change[240+17],0
push esi
mov esi,0
.ElSEIF dx == 68 && P1_skill2_times != 3 && timer1 == 0 && timer2 == 0 
inc P1_skill2_times
mov ballspeed,1
add timer1,500
.ElSEIF dx == 39 && P2_skill2_times != 3 && timer2 == 0 && timer1 == 0
inc P2_skill2_times
mov ballspeed,1
add timer2,500
.ENDIF

.IF timer1!=0
	sub timer1,1
.ENDIF
.IF timer2 != 0
	sub timer2,1
.ENDIF
.IF timer1 == 0 && timer2 == 0
	mov ballspeed,4
.ENDIF

.IF P1_skill_long==2
	add ebp,1
		.IF ebp > 500
			mov P1_skill_long,0
			pop ebp
		.ENDIF
.ENDIF
.IF P2_skill_long==2
	add esi,1
		.IF esi > 500
			mov P2_skill_long,0
			pop esi
		.ENDIF
.ENDIF

call SetPlayer1
call SetPlayer2
call SetBall
call SCORE
call PrintScreen
cmp victory,1
jne play_mov
call ClearScreen
call Clrscr
call ResetGame
mov	P1_mov , 0
mov	P2_mov , 0
mov	P1_skill_long , 0
mov	P2_skill_long , 0
mov	counter       , 0
mov	P1_skill1_times , 0
mov	P2_skill1_times , 0
mov	P1_skill2_times , 0
mov	P2_skill2_times , 0
mov	timer1 , 0
mov	timer2 , 0
mov victory,0
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
	mov playboard,1
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
	mov playboard,1
	.ELSEIF Speed_point_local == 58
	mov Speed_color,7
	mov playboard,1
	.ELSEIF Speed_point_local == 60
	mov Speed_color,8
	mov playboard,2
	.ELSEIF Speed_point_local == 62
	mov Speed_color,6
	mov playboard,2
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
	mov playboard,2
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
	mov playboard,1
	.ELSEIF Speed_point_local == 58
	mov Speed_color,7
	mov playboard,1
	.ELSEIF Speed_point_local == 60
	mov Speed_color,8
	mov playboard,2
	.ELSEIF Speed_point_local == 62
	mov Speed_color,6
	mov playboard,2
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