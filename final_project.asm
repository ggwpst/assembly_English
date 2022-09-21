INCLUDE Irvine32.inc

main          EQU start@0

.data
st1 BYTE " _    _                _           _                       ______                   ",0             ;宣告起始頁面的遊戲名稱，用符號刻出vocabulary game
st2 BYTE "| |  | |              | |         | |                     / _____)                  ",0
st3 BYTE "| |  | |__   ____ ____| | _  _   _| | ____  ____ _   _   | /  ___  ____ ____   ____ ",0
st4 BYTE " \ \/ / _ \ / ___) _  | || \| | | | |/ _  |/ ___) | | |  | | (___)/ _  |    \ / _  )",0
st5 BYTE "  \  / |_| ( (__( ( | | |_) ) |_| | ( ( | | |   | |_| |  | \____/( ( | | | | ( (/ / ",0
st6 BYTE "   \/ \___/ \____)_||_|____/ \____|_|\_||_|_|    \__  |   \_____/ \_||_|_|_|_|\____)",0
st7 BYTE "                                                (____/                              ",0

level BYTE ?                                                                                                   ;想要的英文單字等級
slength BYTE ?                                                                                                 ;想要的英文單字長度
buffer BYTE  50  DUP(?)                                                                                        ;輸入的英文單字                                              
start1 byte "press enter to start", 0                                                                          ;遊戲開始畫面顯示按下enter就跳到下一個頁面
str_idiot BYTE "YOU ERROR!!!!!!!!!!!!!!!!!!!!!!!!!", 0                                                         ;輸入的單字錯誤就輸出YOU ERROR!!!!!!!!!!!!!
print_level BYTE "Level(1~6) : ",0                                                                             ;顯示輸入LEVEL的地方
print_length BYTE "Length(3~9) : ",0                                                                           ;顯示輸入LENGTH的地方
Answer BYTE "Ans : ",0
consoleHandle DWORD ?                                                                                          ;內建:consoleHandle
xyInit COORD<28,4>                                                                                             ;游標起始位置
xyPos COORD<28,4>                                                                                              ;游標位置

str1 BYTE "Level1 (v.3) 行為,行事,舉止,表現",0                                                                 ;宣告單字和答案
str1_ans BYTE "act",0
str2 BYTE "Level1 (n.3) 螞蟻",0
str2_ans BYTE "ant",0
str3 BYTE "Level1 (n.4) 地區,區域",0
str3_ans BYTE "area",0
str4 BYTE "Level1 (n.4) 軍隊",0
str4_ans BYTE "army",0
str5 BYTE "Level1 (n.5) 成年人,成年動物",0
str5_ans BYTE "adult",0
str6 BYTE "Level1 (a.5) 基礎的,基本的,根本的",0
str6_ans BYTE "basic",0
str7 BYTE "Level1 (v.6) 應在…（地方）,適應,合得來",0
str7_ans BYTE "belong",0
str8 BYTE "Level1 (n.6) 中心點,中心,中央",0
str8_ans BYTE "center",0
str9 BYTE "Level1 (a.7) 正確的,無誤的,對的",0
str9_ans BYTE "correct",0
str10 BYTE "Level1 (n.7) 國家,國土",0
str10_ans BYTE "country",0
str11 BYTE "Level1 (v.8) 發現,找到",0
str11_ans BYTE "discover",0
str12 BYTE "Level1 (n.8) 小鴨,小鴨肉",0
str12_ans BYTE "duckling",0
str13 BYTE "Level1 (c.9) 除…外",0
str13_ans BYTE "excepting",0
str14 BYTE "Level1 (a.9) 必需的,重要的,珍貴的",0
str14_ans BYTE "important",0

str15 BYTE "Level2 (n.3) 幫助,支持",0
str15_ans BYTE "aid",0
str16 BYTE "Level2 (n.3) 目標,目的,意圖",0
str16_ans BYTE "aim",0
str17 BYTE "Level2 (n.4) 帳單",0
str17_ans BYTE "bill",0
str18 BYTE "Level2 (n.4) 老闆,上司,頭兒",0
str18_ans BYTE "boss",0
str19 BYTE "Level2 (a.5) 短暫的；簡短的",0
str19_ans BYTE "brief",0
str20 BYTE "Level2 (n.5) 刷子；畫筆",0
str20_ans BYTE "brush",0
str21 BYTE "Level2 (n.6) 蠟燭",0
str21_ans BYTE "candle",0
str22 BYTE "Level2 (v.6) 選擇,挑選,選取,選中",0
str22_ans BYTE "choose",0
str23 BYTE "Level2 (n.7) 文化",0
str23_ans BYTE "culture",0
str24 BYTE "Level2 (v.7) 命令；控制；管制；克制",0
str24_ans BYTE "control",0
str25 BYTE "Level2 (n.8) 決定；決策；選擇",0
str25_ans BYTE "decision",0
str26 BYTE "Level2 (v.8) 裝飾，裝扮，打扮",0
str26_ans BYTE "decorate",0
str27 BYTE "Level2 (a.9) 美味的",0
str27_ans BYTE "delicious",0
str28 BYTE "Level2 (n.9) 蜻蜓",0
str28_ans BYTE "dragonfly",0

str29 BYTE "Level3 (n.3) 灰，灰燼",0
str29_ans BYTE "ash",0
str30 BYTE "Level3 (n.3) 灣，海灣",0
str30_ans BYTE "bay",0
str31 BYTE "Level3 (v.4) 重擊；（使）發出巨響",0
str31_ans BYTE "bang",0
str32 BYTE "Level3 (n.4) 球莖，鱗莖",0
str32_ans BYTE "bulb",0
str33 BYTE "Level3 (n.5) 串；束；紮",0
str33_ans BYTE "bunch",0
str34 BYTE "Level3 (n.5) 獨木舟；皮划；划子",0
str34_ans BYTE "canoe",0
str35 BYTE "Level3 (n.6) 衣領，領口",0
str35_ans BYTE "collar",0
str36 BYTE "Level3 (n.6) 讚揚；讚許；榮譽",0
str36_ans BYTE "credit",0
str37 BYTE "Level3 (n.7) 蟋蟀",0
str37_ans BYTE "cricket",0
str38 BYTE "Level3 (v.7) 留下；存放",0
str38_ans BYTE "deposit",0
str39 BYTE "Level3 (n.8) 受僱者，僱員，員工",0
str39_ans BYTE "employee",0
str40 BYTE "Level3 (n.8) 焰火；煙花",0
str40_ans BYTE "firework",0
str41 BYTE "Level3 (v.9) 使灰心，使氣餒",0
str41_ans BYTE "frustrate",0
str42 BYTE "Level3 (n.9) 傢俱",0
str42_ans BYTE "furniture",0

str43 BYTE "Level4 (n.3) 暗示；信號",0
str43_ans BYTE "cue",0
str44 BYTE "Level4 (v.3) 給…染色",0
str44_ans BYTE "dye",0
str45 BYTE "Level4 (n.4) 基因",0
str45_ans BYTE "gene",0
str46 BYTE "Level4 (n.4) 泡沫",0
str46_ans BYTE "foam",0
str47 BYTE "Level4 (a.5) 濃的，濃密的；濃厚的",0
str47_ans BYTE "dense",0
str48 BYTE "Level4 (v.5) 滑行，滑動",0
str48_ans BYTE "glide",0
str49 BYTE "Level4 (n.6) 差事；跑腿",0
str49_ans BYTE "errand",0
str50 BYTE "Level4 (a.6) 沾滿油脂的；含脂肪的；油膩的",0
str50_ans BYTE "greasy",0
str51 BYTE "Level4 (n.7) 高速公路",0
str51_ans BYTE "freeway",0
str52 BYTE "Level4 (v.7) 探測；勘查；探索；研究",0
str52_ans BYTE "explore",0
str53 BYTE "Level4 (n.8) 商業；商務；貿易；交易",0
str53_ans BYTE "commerce",0
str54 BYTE "Level4 (n.8) 地標；標誌性建築",0
str54_ans BYTE "landmark",0
str55 BYTE "Level4 (a.9) 悠閒的，休閒的",0
str55_ans BYTE "leisurely",0
str56 BYTE "Level4 (n.9) 意圖，打算",0
str56_ans BYTE "intention",0

str57 BYTE "Level5 (n.3) 擅長…的人，精通…的人；能手",0
str57_ans BYTE "ace",0
str58 BYTE "Level5 (n.3) 泥塘；沼澤；沼澤地",0
str58_ans BYTE "bog",0
str59 BYTE "Level5 (n.4) 蛤，蛤蜊，蚌",0
str59_ans BYTE "clam",0
str60 BYTE "Level5 (v.4) 控制；限制，約束；抑制",0
str60_ans BYTE "curb",0
str61 BYTE "Level5 (v.5) （火山）爆發，噴發",0
str61_ans BYTE "erupt",0
str62 BYTE "Level5 (v.5) 擅長，善於；突出",0
str62_ans BYTE "excel",0
str63 BYTE "Level5 (a.6) 熱情的；精力充沛的",0
str63_ans BYTE "hearty",0
str64 BYTE "Level5 (a.6) 英勇的，英雄的",0
str64_ans BYTE "heroic",0
str65 BYTE "Level5 (n.7) 英里數",0
str65_ans BYTE "mileage",0
str66 BYTE "Level5 (n.7) 細胞核",0
str66_ans BYTE "nucleus",0
str67 BYTE "Level5 (n.8) 代表",0
str67_ans BYTE "delegate",0
str68 BYTE "Level5 (a.8) 青少年的",0
str68_ans BYTE "juvenile",0
str69 BYTE "Level5 (a.9) 男性的，男子氣概的",0
str69_ans BYTE "masculine",0
str70 BYTE "Level5 (v.9) 制服，擊敗，征服",0
str70_ans BYTE "overwhelm",0

str71 BYTE "Level6 (v.3) 退潮",0
str71_ans BYTE "ebb",0
str72 BYTE "Level6 (v.3) 損壞；破壞；損傷",0
str72_ans BYTE "mar",0
str73 BYTE "Level6 (a.4) 鬱鬱蔥蔥的，植被茂盛的",0
str73_ans BYTE "lush",0
str74 BYTE "Level6 (n.4) 氖氣",0
str74_ans BYTE "neon",0
str75 BYTE "Level6 (n.5) 具有諷刺意味的情況；出乎意料的情況；令人啼笑皆非的事情",0
str75_ans BYTE "irony",0
str76 BYTE "Level6 (n.5) 階段，時期",0
str76_ans BYTE "phase",0
str77 BYTE "Level6 (n.6) 磨難；苦難；嚴峻考驗；煎熬",0
str77_ans BYTE "ordeal",0
str78 BYTE "Level6 (n.6) 選擇，選項；選擇權",0
str78_ans BYTE "option",0
str79 BYTE "Level6 (n.7) 陶罐",0
str79_ans BYTE "pitcher",0
str80 BYTE "Level6 (n.7) 前景；展望",0
str80_ans BYTE "outlook",0
str81 BYTE "Level6 (v.8) 居住於，生活於",0
str81_ans BYTE "populate",0
str82 BYTE "Level6 (n.8) 制裁",0
str82_ans BYTE "sanction",0
str83 BYTE "Level6 (n.9) 污染物，污染物質",0
str83_ans BYTE "pollutant",0
str84 BYTE "Level6 (v.9) 保護，保衛；捍衛，維護",0
str84_ans BYTE "safeguard",0

.code
startpage PROC uses eax
	call Clrscr                                                                                      ;清除頁面
	                                                                                                 ;起始頁面vocabulary game的第一行以此類推到第七行
	mov  dl,15                                                                                       ;column                                                                              
    	mov  dh,10                                                                                       ;row
    	call Gotoxy                                                                                      ;,SetTextColor,Writestring,Clrscr,
	mov eax, green+(black*16)                                                                        ;字體顏色
    	call SetTextColor                                                                                ;設定字體顏色
	mov edx, offset st1                                                                              ;輸出第一行
	call Writestring                                                                                 ;顯示第一行

	mov  dl,15  ;column
    	mov  dh,11  ;row
    	call Gotoxy ;,SetTextColor,Writestring,Clrscr,
	mov eax, green+(black*16)
    	call SetTextColor
	mov edx, offset st2
	call Writestring

	mov  dl,15  ;column
    	mov  dh,12  ;row
    	call Gotoxy ;,SetTextColor,Writestring,Clrscr,
	mov eax, green+(black*16)
    	call SetTextColor
	mov edx, offset st3
	call Writestring

	mov  dl,15  ;column
    	mov  dh,13  ;row
    	call Gotoxy ;,SetTextColor,Writestring,Clrscr,
	mov eax, green+(black*16)
    	call SetTextColor
	mov edx, offset st4
	call Writestring

	mov  dl,15  ;column
    	mov  dh,14  ;row
    	call Gotoxy ;,SetTextColor,Writestring,Clrscr,
	mov eax, green+(black*16)
    	call SetTextColor
	mov edx, offset st5
	call Writestring

	mov  dl,15  ;column
    	mov  dh,15  ;row
    	call Gotoxy ;,SetTextColor,Writestring,Clrscr,
	mov eax, green+(black*16)
    	call SetTextColor
	mov edx, offset st6
	call Writestring

	mov  dl,15  ;column
    	mov  dh,16  ;row
    	call Gotoxy ;,SetTextColor,Writestring,Clrscr,
	mov eax, green+(black*16)
    	call SetTextColor
	mov edx, offset st7
	call Writestring
                                                                                                  ;顯示press enter to start
	mov  dl,48                                                                                ;column                                                                          
    	mov  dh,22                                                                                ;row
    	call Gotoxy                                                                               ;,SetTextColor,Writestring,Clrscr,
	mov eax, white+(black*16)
    	call SetTextColor
	mov edx, offset start1
	call Writestring
	
	ret
startpage	ENDP
main PROC
Start:	
	call Clrscr
	call startpage					                                           ;開始畫面
	checkspace:
		call ReadChar				                                           ;判斷按什麼鍵
		.IF ax == 1C0Dh                                                                    ;案enter跳到輸入level跟length的畫面
			jmp INIT
		.ELSEIF ax == 011Bh                                                                ;按esc跳出程式
			exit
		.ENDIF
	mov ecx, 2
	loop checkspace
	ret

INIT:
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov consoleHandle, eax
	call Clrscr                                                                                 ;清除畫面

	
	INVOKE SetConsoleCursorPosition, consoleHandle, xyPos                                       ;滑鼠位置

	mov edx, OFFSET print_level                                                                 ;把Level(1~6)的第一個char放到edx
	call WriteString                                                                            ;把edx裡的東西印出來
	call ReadChar                                                                               ;輸入字元
	call WriteChar                                                                              ;把eax裡的東西印出來
	sub al, 48                                                                                  ;把字元變成數字
	mov level, al                                                                               ;把輸入的數字放到level裡
	call Crlf                                                                                   ;換行

	inc xyPos.y                                                                                 ;換到滑鼠位置的下一行
	INVOKE SetConsoleCursorPosition, consoleHandle, xyPos                                       ;取得滑鼠位置
	mov edx, OFFSET print_length                                                                ;把Length(3~9)的第一個char放到edx
	call WriteString                                                                            ;把edx裡的東西印出來
	call ReadChar                                                                               ;輸入字元
	call WriteChar                                                                              ;把eax裡的東西印出來
	inc xyPos.y                                                                                 ;換到滑鼠位置的下一行
	sub al, 48                                                                                  ;把字元變成數字
	mov slength, al                                                                             ;把輸入的數字放到length裡
	INVOKE SetConsoleCursorPosition, consoleHandle, xyPos                                       ;取得滑鼠位置
	call WaitMsg                                                                                ;顯示press any key to continue
	.IF slength==02h || slength==01h || slength==00h                                            ;如果輸入的數字不是3~9就跳回去重新輸入
		dec xyPos.y
		dec xyPos.y
		jmp INIT
	.ENDIF
	call Clrscr

	cmp level, 1                                                                                ;若level不是1~6就跳回去重新輸入，若是就跳到對應的level
	je level1
	cmp level, 2
	je level2
	cmp level, 3
	je level3
	cmp level, 4
	je level4
	cmp level, 5
	je level5
	cmp level, 6
	je level6
	dec xyPos.y
	dec xyPos.y
	jmp INIT

level1:
	mov edx, OFFSET str1                                                                         ;等級1的第一個單字輸出
scan1:
	mov bl, slength                                                                              ;尋找同等級對應長度的單字
	add bl, 48                                                                                   ;把數字變回字元 
	cmp [edx+10], bl                                                                             ;比較字串第十一個字的單字長度
	mov ecx, 4                                                               
	jne nextstr1                                                                                 ;若不是這個長度的就往下繼續找
	call WriteString                                                                             ;印出單字中文意思
	call Crlf                                                                                    ;換行
	push edx                                                                                     
	mov edx, OFFSET buffer                                                                       ;輸入回答單字的字串
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx 
	call StrLength                                                                               ;取得字串長度準備往下跳行
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	
	mov ebx, edx
	push ebx

	cld
	mov esi, OFFSET buffer
	mov edi, edx
	movzx ecx, slength                                                                            ;把字串長度放到ecx表示要比較的字元次數
cmp1_one:	
	cmpsb                                                                                         ;比較esi, edi裡面的東西是否一樣
	jne error1_one                                                                                ;若不一樣就跳到error1_one
	loop cmp1_one                                                                                 ;迴圈往下跳字元個數的行數
	call Clrscr                                                                                   ;清除頁面
	jmp nextproblem1                                                                              ;無條件跳到nextproblem1 
nextstr1:
	push ecx
	call StrLength                                                                                ;取得字串長度準備往下跳行
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	pop ecx
	loop nextstr1
	jmp scan1                                                                                     ;跳會去找到符合長度的單字
error1_one:
	push edx
	call Clrscr
	
	
	
	mov edx, OFFSET str_idiot                                                                     ;輸出YOU ERROR!!!!!!!!!!!!!
	call WriteString
	call Crlf

	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf

	call WaitMsg	
	call Clrscr
	pop edx
nextproblem1:
	call StrLength                                                                                 ;取得字串長度準備往下跳行
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	call WriteString
	call Crlf
	
	call ReadChar                                                                                   ;若玩到第二題不想玩了就按ESC跳到Start畫面
	.IF ax==011Bh
		
		dec xyPos.y
		dec xyPos.y

		jmp Start
	.ENDIF

	push edx
	mov edx, OFFSET buffer                                                                          ;輸入第二題回答單字的字串                                          
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx
	call StrLength                                                                                  ;取得字串長度準備往下跳行
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax

	mov ebx, edx
	push ebx

	mov esi, OFFSET buffer
	mov edi, edx
	movzx ecx, slength                                                                               ;把第二題字串長度放到ecx表示要比較的字元次數
cmp1_two:
	cmpsb                                                                                            ;比較esi, edi裡面的東西是否一樣
	jne error1_two                                                                                   ;若不一樣就跳到error1_one
	loop cmp1_two 

	dec xyPos.y
	dec xyPos.y
                                                                                   ;迴圈往下跳字元個數的行數
	jmp INIT                                                                                         ;第二題結束後就跳回去重新輸入等級 長度
error1_two:
	push edx
	mov edx, OFFSET str_idiot                                                                        ;輸出YOU ERROR!!!!!!!!!!!!!
	call Clrscr
	call WriteString
	call Crlf

	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf

	pop edx
	call WaitMsg
	
	dec xyPos.y
	dec xyPos.y
	
	jmp INIT



level2:                                            ;這裡是2
	mov edx, OFFSET str15
scan2:
	mov bl, slength
	add bl, 48
	cmp [edx+10], bl
	mov ecx, 4
	jne nextstr2
	call WriteString
	call Crlf
	push edx
	mov edx, OFFSET buffer
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx 
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	mov ebx, edx
	push ebx
	cld
	mov esi, OFFSET buffer
	mov edi, edx
	movzx ecx, slength
cmp2_one:	
	cmpsb
	jne error2_one
	loop cmp2_one
	call Clrscr
	jmp nextproblem2
nextstr2:
	push ecx
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	pop ecx
	loop nextstr2
	jmp scan2
error2_one:
	push edx
	call Clrscr
	mov edx, OFFSET str_idiot
	call WriteString
	call Crlf
	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf
	call WaitMsg	
	call Clrscr
	pop edx
nextproblem2:
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	call WriteString
	call Crlf
	call ReadChar
	.IF ax==011Bh
		dec xyPos.y
		dec xyPos.y
		jmp Start
	.ENDIF
	push edx
	mov edx, OFFSET buffer
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	mov ebx, edx
	push ebx
	mov esi, OFFSET buffer
	mov edi, edx

	movzx ecx, slength
cmp2_two:
	cmpsb 
	jne error2_two
	loop cmp2_two
	dec xyPos.y
	dec xyPos.y
	jmp INIT
error2_two:
	push edx
	mov edx, OFFSET str_idiot
	call Clrscr
	call WriteString
	call Crlf
	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf
	pop edx
	call WaitMsg
	dec xyPos.y
	dec xyPos.y
	jmp INIT


level3:                                            ;這裡是3
	mov edx, OFFSET str29
scan3:
	mov bl, slength
	add bl, 48
	cmp [edx+10], bl
	mov ecx, 4
	jne nextstr3
	call WriteString
	call Crlf
	push edx
	mov edx, OFFSET buffer
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx 
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	mov ebx, edx
	push ebx
	cld
	mov esi, OFFSET buffer
	mov edi, edx
	movzx ecx, slength
cmp3_one:	
	cmpsb
	jne error3_one
	loop cmp3_one
	call Clrscr
	jmp nextproblem3
nextstr3:
	push ecx
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	pop ecx
	loop nextstr3
	jmp scan3
error3_one:
	push edx
	call Clrscr
	mov edx, OFFSET str_idiot
	call WriteString
	call Crlf
	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf
	call WaitMsg	
	call Clrscr
	pop edx
nextproblem3:
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	call WriteString
	call Crlf
	call ReadChar
	.IF ax==011Bh
		dec xyPos.y
		dec xyPos.y
		jmp Start
	.ENDIF
	push edx
	mov edx, OFFSET buffer
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	mov ebx, edx
	push ebx
	mov esi, OFFSET buffer
	mov edi, edx

	movzx ecx, slength
cmp3_two:
	cmpsb 
	jne error3_two
	loop cmp3_two
	dec xyPos.y
	dec xyPos.y
	jmp INIT
error3_two:
	push edx
	mov edx, OFFSET str_idiot
	call Clrscr
	call WriteString
	call Crlf
	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf
	pop edx
	call WaitMsg
	dec xyPos.y
	dec xyPos.y
	jmp INIT


level4:                                            ;這裡是4
	mov edx, OFFSET str43
scan4:
	mov bl, slength
	add bl, 48
	cmp [edx+10], bl
	mov ecx, 4
	jne nextstr4
	call WriteString
	call Crlf
	push edx
	mov edx, OFFSET buffer
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx 
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	mov ebx, edx
	push ebx
	cld
	mov esi, OFFSET buffer
	mov edi, edx
	movzx ecx, slength
cmp4_one:	
	cmpsb
	jne error4_one
	loop cmp4_one
	call Clrscr
	jmp nextproblem4
nextstr4:
	push ecx
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	pop ecx
	loop nextstr4
	jmp scan4
error4_one:
	push edx
	call Clrscr
	mov edx, OFFSET str_idiot
	call WriteString
	call Crlf
	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf
	call WaitMsg	
	call Clrscr
	pop edx
nextproblem4:
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	call WriteString
	call Crlf
	call ReadChar
	.IF ax==011Bh
		dec xyPos.y
		dec xyPos.y
		jmp Start
	.ENDIF
	push edx
	mov edx, OFFSET buffer
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	mov ebx, edx
	push ebx
	mov esi, OFFSET buffer
	mov edi, edx

	movzx ecx, slength
cmp4_two:
	cmpsb 
	jne error4_two
	loop cmp4_two
	dec xyPos.y
	dec xyPos.y
	jmp INIT
error4_two:
	push edx
	mov edx, OFFSET str_idiot
	call Clrscr
	call WriteString
	call Crlf
	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf
	pop edx
	call WaitMsg
	dec xyPos.y
	dec xyPos.y
	jmp INIT


level5:                                            ;這裡是5
	mov edx, OFFSET str57
scan5:
	mov bl, slength
	add bl, 48
	cmp [edx+10], bl
	mov ecx, 4
	jne nextstr5
	call WriteString
	call Crlf
	push edx
	mov edx, OFFSET buffer
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx 
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	mov ebx, edx
	push ebx
	cld
	mov esi, OFFSET buffer
	mov edi, edx
	movzx ecx, slength
cmp5_one:	
	cmpsb
	jne error5_one
	loop cmp5_one
	call Clrscr
	jmp nextproblem5
nextstr5:
	push ecx
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	pop ecx
	loop nextstr5
	jmp scan5
error5_one:
	push edx
	call Clrscr
	mov edx, OFFSET str_idiot
	call WriteString
	call Crlf
	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf
	call WaitMsg	
	call Clrscr
	pop edx
nextproblem5:
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	call WriteString
	call Crlf
	call ReadChar
	.IF ax==011Bh
		dec xyPos.y
		dec xyPos.y
		jmp Start
	.ENDIF
	push edx
	mov edx, OFFSET buffer
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	mov ebx, edx
	push ebx
	mov esi, OFFSET buffer
	mov edi, edx

	movzx ecx, slength
cmp5_two:
	cmpsb 
	jne error5_two
	loop cmp5_two
	dec xyPos.y
	dec xyPos.y
	jmp INIT
error5_two:
	push edx
	mov edx, OFFSET str_idiot
	call Clrscr
	call WriteString
	call Crlf
	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf
	pop edx
	call WaitMsg
	dec xyPos.y
	dec xyPos.y
	jmp INIT


level6:                                            ;這裡是6
	mov edx, OFFSET str71
scan6:
	mov bl, slength
	add bl, 48
	cmp [edx+10], bl
	mov ecx, 4
	jne nextstr6
	call WriteString
	call Crlf
	push edx
	mov edx, OFFSET buffer
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx 
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	mov ebx, edx
	push ebx
	cld
	mov esi, OFFSET buffer
	mov edi, edx
	movzx ecx, slength
cmp6_one:	
	cmpsb
	jne error6_one
	loop cmp6_one
	call Clrscr
	jmp nextproblem6
nextstr6:
	push ecx
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	pop ecx
	loop nextstr6
	jmp scan6
error6_one:
	push edx
	call Clrscr
	mov edx, OFFSET str_idiot
	call WriteString
	call Crlf
	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf
	call WaitMsg	
	call Clrscr
	pop edx
nextproblem6:
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	call WriteString
	call Crlf
	call ReadChar
	.IF ax==011Bh
		dec xyPos.y
		dec xyPos.y
		jmp Start
	.ENDIF
	push edx
	mov edx, OFFSET buffer
	mov ecx, ( SIZEOF buffer ) - 1
	call ReadString
	pop edx
	call StrLength
	inc al
	mov cl, type BYTE
	mul cl
	add edx, eax
	mov ebx, edx
	push ebx
	mov esi, OFFSET buffer
	mov edi, edx

	movzx ecx, slength
cmp6_two:
	cmpsb 
	jne error6_two
	loop cmp6_two
	dec xyPos.y
	dec xyPos.y
	jmp INIT
error6_two:
	push edx
	mov edx, OFFSET str_idiot
	call Clrscr
	call WriteString
	call Crlf
	pop ebx
	mov edx, OFFSET Answer
	call WriteString
	mov edx, ebx
	call WriteString
	call Crlf
	pop edx
	call WaitMsg
	dec xyPos.y
	dec xyPos.y
	jmp INIT
main ENDP
END main