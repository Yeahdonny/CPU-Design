;----------------------------------------------------------------------------
;	PROGRAM NAME : cpudemo.ASM
;	PURPOSE : To design an internal structure of a processor and elevate assembly programming skill
;
;	PROCEDURE												
;      *u_micro PROC : Function to print 'MICRO' at screen
;      *a_macro PROC : Function to print 'MACRO' at screen
;	   *show PROC : Function to show current value
;      *a_mac_dis PROC : Function to display information on the CPU
;      *a_write PROC : Function to distinguish what is written on dosbox
;      *a_mac_mem PROC : Function to put information at address where user wants to move
;      *a_mac_checkp PROC : Function to distinguish if user writes 'c'
;	   *A_MAC_CON_PRINT PROC: Function to print 6digit-number instruction code if user writes 'c'
;	   *a_mac_con proc : Function to call procedure according to instruction code
;	   *CHK_MO PROC :  Function to identify MOV's Addressing Mode and call procedure about Addressing Mode
;	   *MO_REG PROC :  Function to what is first Register when MOV's Addressing Mode is Register Adressing Mode	
;	   *MO_REG_R0 PROC : Function to what is second Register && Register's MOV calculation 
;						 when MOV's Addressing Mode is Register Adressing Mode and first Register is RO
;	   *MO_REG_R1 PROC : Function to what is second Register && Register's MOV calculation 
;						 when MOV's Addressing Mode is Register Adressing Mode and first Register is R1
;	   *MO_REG_R2 PROC : Function to what is second Register && Register's MOV calculation 
;						 when MOV's Addressing Mode is Register Adressing Mode and first Register is R2
;	   *MO_IMM PROC : Function to MOV calculation when MOV's Addressing Mode is Immediate
;	   *MO_DIR PROC : Function to MOV calculation when MOV's Addressing Mode is Direct Addressing Mode
;	   *CHK_AD PROC : Function to identify ADD's Addressing Mode and call procedure about Addressing Mode
;	   *AD_REG PROC : Function to what is first Register when ADD's Addressing Mode is Register Adressing Mode	
;	   *AD_REG_R0 PROC : Function to what is second Register && Register's ADD calculation 
;						 when ADD's Addressing Mode is Register Adressing Mode and first Register is RO	
;	   *AD_REG_R1 PROC : Function to what is second Register && Register's ADD calculation 
;						 when ADD's Addressing Mode is Register Adressing Mode and first Register is R1
;	   *AD_REG_R2 PROC : Function to what is second Register && Register's ADD calculation 
;						 when ADD's Addressing Mode is Register Adressing Mode and first Register is R2
;	   *AD_IMM PROC : Function to ADD calculation when ADD's Addressing Mode is Immediate
;	   *AD_DIR PROC : Function to ADD calculation when ADD's Addressing Mode is Direct Addressing Mode
;	   *CHK_SU PROC : Function to identify SUB's Addressing Mode and call procedure about Addressing Mode
;	   *SU_REG PROC : Function to what is first Register when SUB's Addressing Mode is Register Adressing Mode	
;	   *SU_REG_R0 PROC : Function to what is second Register && Register's SUB calculation 
;						 when SUB's Addressing Mode is Register Adressing Mode and first Register is RO	
;	   *SU_REG_R1 PROC : Function to what is second Register && Register's SUB calculation 
;						 when SUB's Addressing Mode is Register Adressing Mode and first Register is R1
;	   *SU_REG_R2 PROC : Function to what is second Register && Register's SUB calculation 
;						 when SUB's Addressing Mode is Register Adressing Mode and first Register is R2
;	   *SU_IMM PROC : Function to SUB calculation when SUB's Addressing Mode is Immediate
;	   *SU_DIR PROC : Function to SUB calculation when SUB's Addressing Mode is Direct Addressing Mode
;	   *CHK_AND PROC : Function to identify AND's Addressing Mode and call procedure about Addressing Mode
;	   *AND_REG PROC : Function to what is first Register when AND's Addressing Mode is Register Adressing Mode	
;	   *AND_REG_R0 PROC : Function to what is second Register && Register's AND calculation 
;						  when AND's Addressing Mode is Register Adressing Mode and first Register is RO	
;	   *AND_REG_R1 PROC : Function to what is second Register && Register's AND calculation 
;						  when AND's Addressing Mode is Register Adressing Mode and first Register is R1
;	   *AND_REG_R2 PROC : Function to what is second Register && Register's AND calculation 
;						  when AND's Addressing Mode is Register Adressing Mode and first Register is R2 	
;	   *AND_IMM PROC : Function to AND calculation when AND's Addressing Mode is Immediate
;	   *AND_DIR PROC : Function to AND calculation when AND's Addressing Mode is Direct Addressing Mode
;	   *CHK_OR PROC : Function to identify OR's Addressing Mode and call procedure about Addressing Mode
;	   *OR_REG PROC : Function to what is first Register when OR's Addressing Mode is Register Adressing Mode
;	   *OR_REG_R0 PROC : Function to what is second Register && Register's OR calculation 
;						 when OR's Addressing Mode is Register Adressing Mode and first Register is RO
;	   *OR_REG_R1 PROC : Function to what is second Register && Register's OR calculation 
;						 when OR's Addressing Mode is Register Adressing Mode and first Register is R1 
;	   *OR_REG_R2 PROC : Function to what is second Register && Register's OR calculation 
;						 when OR's Addressing Mode is Register Adressing Mode and first Register is R2
;	   *OR_IMM PROC : Function to OR calculation when OR's Addressing Mode is Immediate
;	   *OR_DIR PROC : Function to OR calculation when OR's Addressing Mode is Direct Addressing Mode
;	   *CHK_NOT PROC : Function to NOT calculation
;	   *CHK_HLT PROC : Function to stop CPU
;	   *CHK_INC PROC : Function to increase valu
;	   *CHK_DEC PROC : Function to decrease value
;	   *CHK_CMP PROC : Function to compare A with B(ex. CMP A, B)
;	   *CHK_CMP PROC : Function to divide CMP operation what addressing mode implements.
;	   *CMP_REG_R0 PROC : Function to implements Register addressing mode R0 at CMP
;	   *CMP_REG_R1 PROC : Function to implements Register addressing mode R1 at CMP
;	   *CMP_REG_R2 PROC : Function to implements Register addressing mode R2 at CMP
;	   *CMP_IMM PROC : Function to implements Register addressing mode R1 at CMP
;	   *CMP_DIR PROC : Function to Direct address
;	   *P_PSW PROC : Function to add 1 at PSW
;	   *CHK_BEQ PROC : Function to check PSW number and determine what you want simulator command
;	   *CHK_SHR PROC : Function to move a bit left and rigth and then, check the number to decide on direction
;	   *JUDGE_ADD PROC : Function to add right ASKII to make chracter type integer
;	   *JUDGE_SUB PROC : Function to subtract right ASKII to make integer
;	   *ADDRESS_PC_MAKE PROC : Function to make PC number to work to address
;	   *MAKE_ADDRESS PROC : Function to make address  
;	   *u_write PROC : Function to distinguish what is written on dosbox
;	   *c_mic_con proc : Function to call procedure according to instruction code
;	   *c_ir proc : Function to put the instruction in Instruction Register
;	   *c_marmdr proc : Function to load the Mar with the address of the operand and store the content of register
;	   *i_mic_interrupt PROC : Function to trigger an interrupt/ load the cpu's registers into the interrupt
;	   *r_mic_return  PROC : Function to return from interrupt, execute normal sequence
;      *CHK_ZERO PROC : Function to compare whether blank is zero or not 
;	   *EN  PROC : Function to exit the program
;      *ERROR_MESSAGE PROC : Function to print error message
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;
;	PROGRAM VERSION
;      Creation Date : NOV 22, 2016.11.22
;      1st   modification : Nov 25, 2016		
;				Fixed the Calculation routine
;	   2nd	 modification : Nov 27, 2016			
;				Be able to do input instruction 			
;	   3rd	 modification : Nov 29, 2016
;				Instruction Implementation
;      4th   modification : DEC 3,  2016
;				Added block documentation
;	   5th   modification : DEC 4,  2016
;				Added block documentation and fixed block documentation
;	   6th	 modification : DEC 8,  2016		
;				Implement Micro Function
;	   7th	modification : DEC 17, 2016
;				Express Error Message, make Start Screen and Set Blank Character
;			Last Modified On DEC 17, 2016
;----------------------------------------------------------------------------

DATA SEGMENT
   MICRO DB "MICRO",'$'			; u 입력시 MICRO
   AMACRO DB "MACRO",'$'		; a 입력시 MACRO
   ERRORMESSAGE DB ">>>>!!!ERROR!!!<<<<",'$' ; 에러 메시지

   R0 dw 0					; 초기 RO의 값
   R1 dw 0					; 초기 R1의 값
   R2 dw 0					; 초기 R2의 값
   PSW DW 0					; 초기 PSW의 값 (Flag)
   PC DW 0					; 초기 PC(Program Counter)의 값

   MEM Dw 4096 DUP (?)			; 임의로 값을 저장하기 위해 배열 선언

   VAR_D DW 1					; 임의의 변수 VAR_D=1선언

   PROM DB ">" ,'$'				; '>' 출력을 위함
   EQUAL DB " = ",'$'			; ' = ' 출력을 위함
    
   R0_R DB "R0$"				; Display시 R0의 값을 출력하기 위함
   R1_R DB "R1$"				; Display시 R1의 값을 출력하기 위함
   R2_R DB "R2$"				; Display시 R2의 값을 출력하기 위함
   PC_R DB "pc$"				; Display시 PC의 값을 출력하기 위함
   PSW_R DB "psw$"				; Display시 PSW의 값을 출력하기 위함
   COMA DB ", $"				; ',' 출력을 위함

   PREVAL DB 10 dup (?)			; OPCODE를 저장
   IME DB 10 DUP (?)				; 데이터의 값을 저장
   ADDRESS DB 10 dup(?)			; ADDRESS를 저장
   ALL DB 10 dup(?)				; 입력했을 때 전체를 저장하기 위함
   STKM DB	10 DUP	(?)			;스택	

   uMAR_R DB "mar<- $"			; Display시 mar의 값을 출력하기 위함			
   uPC_R DB "pc<- $"				; Display시 pc의 값을 출력하기 위함						
   uIR_R DB "ir<- $"				; Display시 ir의 값을 출력하기 위함			
   uMDR_R DB "mdr<- $"			; Display시 mdr의 값을 출력하기 위함			
   uIST_R DB "ist<- $"				; Display시 ist의 값을 출력하기 위함
   EXPLAIN0 DB  "=========================================================$"
	EXPLAIN1 DB "		a : macro		u : micro$" 
	EXPLAIN2 DB "		e : exit			d : display$"
	EXPLAIN3 DB "		c : execute	       pc : program counter$"
	EXPLAIN4 DB "		r : return		i : interrupt$"  
	EXPLAIN5 DB "		m : input the instruction$" 
DATA ENDS

MAIN SEGMENT
    ASSUME CS:MAIN,DS:DATA

START:      
    MOV AX, DATA    
    MOV DS, AX 
	MOV ES, AX
	   
	MOV AH, 0				;비디오 모드 설정
	MOV AL, 2				;화면 클리어
	INT 10H
	MOV DX,OFFSET explain0		;'===========================' 출력
	MOV AH,09H				; 문자열 출력을 위한 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DX,OFFSET explain1			;'a : macro	u : micro' 출력
	MOV AH,09H				; 문자열 출력을 위한 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DX,OFFSET explain2			;'e : exit	d : display' 출력
	MOV AH,09H				; 문자열 출력을 위한 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DX,OFFSET explain3			;'c : execute
						;  pc : program counter' 출력
	MOV AH,09H				; 문자열 출력을 위한 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DX,OFFSET explain4			;'r : return	i : interrupt$' 출력
	MOV AH,09H				; 문자열 출력을 위한 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DX,OFFSET explain5			;'m : input the instruction' 출력
	MOV AH,09H				; 문자열 출력을 위한 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	MOV DX,OFFSET explain0		; '==========================' 출력
	MOV AH,09H				; 문자열 출력을 위한 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
GUESS1:
   MOV DX,OFFSET PROM			;'>' 출력
   MOV AH,09H					; 문자열 출력을 위한 FUNCTION(9)
   INT 21H					; 인터럽트

   MOV AH, 01H				; 입력을 위한 FUNCTION(1)
   INT 21H					; 인터럽트         
   MOV DL, AL					; 입력을 받은 AL을 DL로 이동
   JMP CHECK					; CHECK 로
GUESS2:
   MOV AH, 01H				; 입력을 위한 FUNCTION(1)
   INT 21H					; 인터럽트
   CMP AL, 0DH					; AL과 0DH (엔터)비교
   JE CHECK_AU            ; AL에 들어간 값이 0DH(엔터)와 같다면 CHECK_AU로 이동       
   JNE GUESS3			; AL에 들어간 값이 0DH(엔터)와 다르면 GUESS3로 이동      
GUESS3:
   MOV AH, 01H				; 입력을 위한 FUNCTION(1)
   INT 21H					; 인터럽트
   CMP AL, 0DH					; AL과 0DH(엔터) 비교
   JE GUESS1					; AL에 들어간 값이 0DH(엔터)와 같다면 GUESS1로 이동  
   LOOP GUESS3				; LOOP
CHECK:																										
    CMP DL,  'a'            			; DL값이 'a'인지 아닌지 비교
   je GUESS2					; 'a'라면 GUESS2로 이동
   jne GUESS3					; 'u'가 아니라면 GUESS3으로
CHECK_AU:
   CMP DL,  'a'					; DL값이 'a'인지 아닌지 비교
   je a_macro					; 같다면 a_macro로 이동  
   jne GUESS1

;----------------------------------------------------------------------------
;	PROCEDURE NAME - u_micro PROC
;	Function : Function to print 'MICRO' at screen
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;      Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------

u_micro PROC	
	MOV DL, 0AH				; 줄바꿈	
   MOV AH, 2					; 출력을 위한 FUNCTION(2)
   INT 21H					; 인터럽트			
   MOV DX,OFFSET MICRO			; 'MICRO' 출력
   MOV AH,09H					; 문자열 출력을 위한 FUNCTION(9)
   INT 21H					; 인터럽트
   
   MOV DL, 0AH				; 줄바꿈	
   MOV AH, 2					; 출력을 위한 FUNCTION(2)
   INT 21H					; 인터럽트
   
   call u_write					; u_write 프로시저 호출
   RET
u_micro   ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - a_macro PROC
;	Function :  : Function to print 'MACRO' at screen
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;      Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------

a_macro PROC					; <<a_macro함수>>
   MOV DX,OFFSET AMACRO			; 'MACRO' 출력
   MOV AH,09H					; 문자열 출력을 하는 FUNCTION(9)
   INT 21H					; 인터럽트
 
   MOV DL, 0AH				; 줄바꿈	
   MOV AH, 2					; 출력을 위한 FUNCTION(2)
   INT 21H					; 인터럽트
   
   call a_write					; a_write 프로시저 호출
   RET				
a_macro ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - show PROC
;	Function : Function to show current value
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;      Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------
show proc
	mov dx, 0				; DX에 0 MOV
	MOV DX, bx				; BX를 DX로 MOV
	MOV DL, DH		; DH를 DL로 MOV	(ADDRESS[0]을 알기 위해서)
	call judge_add				; judge_add 프로시저 호출
	MOV AH, 02H				; 출력을 하는 FUNCTION(2)
	INT 21H					; 인터럽트
	
	mov dx, 0				; DX를 0으로 초기화
	MOV DX, bx				; BX를 DX로 MOV
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; ADDRESS[1]을 알기 위해서
	call judge_add				; judge_add 프로시저 호출
	MOV AH, 02H				; 출력을 하는 FUNCTION(2)
	INT 21H					; 인터럽트

	mov dx, 0				; DX를 0으로 초기화
	MOV DX, bx				; BX를 DX로
	SHL DL, 1				; DL<<4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; ADDRESS[2]를 알기 위해서
	call judge_add				; judge_add 프로시저 호출
	MOV AH, 02H				; 출력을 하는 FUNCTION(2)
	INT 21H					; 인터럽트
 ret
show endp

;----------------------------------------------------------------------------
;	PROCEDURE NAME - a_mac_dis PROC
;	Function : Function to display information on the CPU	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------

a_mac_dis PROC				; << d를 입력했을때의 프로시저(display)>> 
	MOV DL, 0AH				; 줄바꿈
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	MOV DX, OFFSET R0_R			; 'R0'를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	MOV DX, OFFSET EQUAL			; ' = '를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	mov bx, 0				; BX를 0으로 초기화
	MOV bx,  R0				; RO를 BX로 MOV
	call show				; SHOW 프로시저 호출
     
	MOV DX, OFFSET COMA			; ','를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
   
	MOV DX, OFFSET R1_R			; 'R1'를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	MOV DX, OFFSET EQUAL			; ' = '를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	mov bx, 0				; BX를 0으로 초기화
	MOV BX,  R1				; R1을 BX로 MOV
	call show				; SHOW 프로시저 호출

	MOV DX, OFFSET COMA			; ','를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	MOV DX, OFFSET R2_R			; 'R2'를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	MOV DX, OFFSET EQUAL			; ' = '를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	MOV bX,  0				; BX를 0으로 초기화
	mov bx, R2				; R2를 BX로 MOV
    call show					; SHOW 프로시저 호출

	MOV DX, OFFSET COMA			; ','를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	MOV DX, OFFSET PC_R			; 'PC'을 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
   
   MOV DX, OFFSET EQUAL			; ' = '를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	mov bx, 0				; BX를 0으로 초기화
	MOV bX,  PC				; PC를 BX로 MOV
	call show				; SHOW 프로시저 호출

	MOV DX, OFFSET COMA			; ',' 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	MOV DX, OFFSET PSW_R			; 'PSW'을 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
   
   MOV DX, OFFSET EQUAL			; ' = '를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	mov bx, 0				; BX를 0으로 초기화
	MOV bX,  PSW				; PSW를 BX로 MOV
	call show				; SHOW 프로시저 호출

    MOV DL, 0AH				; 줄바꿈
	MOV AH, 2				; 출력을 하는 FUNCTION(2)
	INT 21H					; 인터럽트
	call a_write				; a_write 프로시저 호출
ret
a_mac_dis endp					; mac_dis 프로시저 종료

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - a_write PROC
;	Function : Function to distinguish what is written on dosbox	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------
a_write proc
	MOV DX,OFFSET PROM			; '>' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
   
	MOV AH, 01H				; 문자 입력을 하는 FUNCTION(1)
	INT 21H					; 인터럽트

	cmp al, 'd'			; 입력된 문자가 'd'인지 아닌지 비교한다
	je d					; 입력된 문자가 'd'이면 d로
	CMP AL, 'm'			; 입력된 문자가 'm'인지 아닌지 비교한다
	je a_mac_mem			; 입력된 문자가 'm'이면 a_mac_mem으로
	cmp al, 'p'			; 입력된 문자가 'p'인지 아닌지 비교한다
	je p					; 입력된 문자가 'p'이면 p로
	cmp al, 'c'			; 입력된 문자가 'c'인지 아닌지 비교한다
	je c					; 입력된 문자가 'c'이면 c로
	cmp al, 'e'			; 입력된 문자가 'e'인지 아닌지 비교한다
	je e					; 입력된 문자가 'e'이면 e로
	CMP al, 'u'			; 입력된 문자가 'u'인지 아닌지 비교한다
	je u					; 입력된 문자가 'u'이면 u로
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 
						; ERRORMESSAGE 프로시저 호출
d:			
	call a_mac_dis				; a_mac_dis(display) 프로시저 호출
m:
	call a_mac_mem				; a_mac_mem 프로시저 호출
p:
   call a_mac_checkp				; a_mac_checkp 프로시저 호출
c:
	call a_mac_con				; a_mac_con 프로시저 호출
e:
	call en					; en 프로시저 호출
u:
	call u_micro				; u_micro 프로시저 호출
   RET
a_write ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - a_mac_mem PROC
;	Function : Function to put information at address where user wants to move	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		 Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------

a_mac_mem proc
	mov si, 0				; SOURCE INDEX에 0값 INPUT
	mov di, 0				; DESTINATION INDEX 에 0값 INPUT
	mov ALL[SI], AL				; ALL[SI]에 AL의 값 MOV
l1:
	MOV AH, 01H				; 입력을 위한 FUNCTION(1)
	INT 21H					; 인터럽트
	INC SI					; SOURCE INDEX ++
    CMP AL,20H					; AL이 20(SPACE) 인지 아닌지
	JE SPACE				; 20(SPACE)이면 SPACE로
	CMP AL, 0DH				; AL과 0DH(ENTER)인지 비교
	JE COMPARE				; 0DH(ENTER) 이면 COMPARE로
	MOV ALL[SI],AL				; AL값을 ALL[SI]로 MOV
	CMP AL, 39H				; AL과 39H(10진수 9)를 비교
	JLE ADR					; 39H(10진수 9)보다 작으면 ADR로
	loop l1					; LOOP
ADR: 
	mov ADDRESS[DI], AL			; AL의 값을 ADDRESS[DI]로
	INC DI					; DESTINATION INDEX++
	jmp l1					; L1로 JUMP
space:						
	mov ADDRESS[DI], '$'			; ADDRESS[DI]에 '$'추가
	MOV ALL[SI], '='				; ALL[SI]에 '=' 추가
	mov di, 0				; DESTINATION INDEX를 0으로
W_PREVAL:
	MOV AH, 01H				; 입력을 위한 FUNCTION(1)
	INT 21H					; 인터럽트
	INC SI					; SOURCE INDEX++
	CMP AL, 0DH				; AL과 0DH(ENTER)인지 비교
	JE COMPARE				; 0DH(ENTER) 이면 COMPARE로
	cmp di, 3				; DI와 3을 비교
	je D_PREVAL				; DI와 3이 같다면 D_PREVAL로
	mov PREVAL[di], AL			; 입력한 AL값을 PREVAL[DI]로
	MOV ALL[si], al				; 입력한 AL값을 ALL[SI]로
	inc di					; DESTINATION INDEX++
	loop W_PREVAL				; LOOP
D_PREVAL:
	MOV PREVAL[DI],'$'			; PREVAL[DI]에 '$'추가
	MOV DI, 0				; DI를 0으로 초기화
IME_W:
	MOV ALL[SI], AL				; AL을 ALL[SI]위치로 이동
	MOV IME[DI], AL				; AL을 IME[DI]위치로 이동
	INC SI					; SOURCE INDEX++
	INC DI					; DESTINATION INDEX++
	MOV AH, 01H				; 입력을 위한 FUNCTION(1)
	INT 21H					; 인터럽트  
	CMP AL, 0DH				; AL과 0DH(ENTER)인지 비교
	JE COMPARE				; 0DH(ENTER) 이면 COMPARE로
	LOOP IME_W				; LOOP

COMPARE:	
	CMP SI, 13				; SI와 13을 비교
	jne error_all				; SI가 13이 아니면 ERROR_ALL로
	CMP DI, 3				; DI와 3을 비교
	JNE ERROR_ALL				; DI가 3이 아니면 ERROR_ALL로
	JMP PR
ERROR_ALL:
	CALL ERROR_MESSAGE			; ERROR_MESSAGE프로시저 호출

pr:
	MOV ALL[SI],'$'				; ALL[SI]에 '$'추가
	mov IME[di],'$'				; IME[DI]에 '$'추가
   
	mov dx, offset ALL			; ALL의 출력을 위해 DX로
	mov ah, 09h				; 문자열 출력을 하는 FUNCTION(9)
	int 21h					; 인터럽트

   CALL ADDRESS_PC_MAKE			; ADDRESS_PC_MAKE 프로시저 호출

	;;;;;;;;;;;;;;;;;;;;;;;;; PREVAL 처리

	MOV DL, 0AH				; 줄바꿈
	MOV AH, 2				; 문자 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	
	mov ax, 0				; AX를 0으로 초기화
	MOV DX, 0				; DX를 0으로 초기화
	MOV AL, PREVAL[0]			; PREVAL[0]의 값을 AL로 MOV


    CALL JUDGE_SUB				; JUDGE_SUB 프로시저 호출
	MOV DH, AL				; AL의 값을 DH로 이동
	mov ax, 0				; AX를 0으로 초기화
	MOV AL, PREVAL[1]			; PREVAL[1]의 값을 AL로 MOV

	CALL JUDGE_SUB			; JUDGE_SUB 프로시저 호출

	MOV DL, AL				; AL의 값을 DL로 이동

	SHL DL, 1				; DL << 4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	
	mov ax, 0				; AX를 0으로 초기화
	MOV AL, PREVAL[2]			; PREVAL[2]의 값을 AL로 MOV
   
	CALL JUDGE_SUB			; JUDGE_SUB 프로시저 호출

	ADD DL, AL				; AL의 값을 DL로 이동

	MOV BX, PC				; PC를 BX로 이동
	mov mem[bx],0				; MEM[BX]의 값을 0으로 초기화
	mov MEM[BX], DX			; DX를 MEM[BX]로 MOV

	
	;;;;;;;;;;;;;;;;;;;;;;;;; IMMEDIATE 처리

	mov ax, 0				; AX를 0으로 초기화		
	MOV DX, 0				; DX를 0으로 초기화
	MOV AL, IME[0]				; IME[0]의 값을 AL로 MOV
	
    CALL JUDGE_SUB				; JUDGE_SUB 프로시저 호출

	MOV DH, AL				; AL의 값을 DH로 이동

	mov ax, 0				; AX를 0으로 초기화	
	MOV AL, IME[1]				; IME[1]의 값을 AL로 MOV

    CALL JUDGE_SUB				; JUDGE_SUB 프로시저 호출
	
	ADD DL, AL				; AL의 값을 DL로 이동
	SHL DL, 1				; DL << 4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	
	mov ax, 0				; AX를 0으로 초기화	
	MOV AL, IME[2]				; IME[2]의 값을 AL로 MOV
	
	CALL JUDGE_SUB			; JUDGE_SUB 프로시저 호출

	ADD DL, AL				; AL의 값을 DL로 이동

	ADD PC, 2				; PC = PC + 2
	MOV BX, PC				; PC를 BX로 MOV
	mov mem[bx],0				; MEM[BX]의 값을 0으로 초기화
	mov MEM[BX], DX			; DX를 MEM[BX]로 MOV
	

	CALL A_WRITE				; A_WRITE 프로시저 호출
	ret
a_mac_mem endp

;----------------------------------------------------------------------------
;	PROCEDURE NAME - a_mac_checkup PROC
;	Function : Function to distinguish if user writes 'c'	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------


a_mac_checkp proc
	mov ALL,0				; ALL을 0으로 초기화
	mov si,0					; SI를 0으로 초기화
	mov di,0				; DI를 0으로 초기화
	mov ALL[si],al				; AL을 ALL[SI]로
    inc si					; SOURCE INDEX++
	MOV AH, 01H				; 입력을 위한 FUNCTION(1)
	INT 21H					; 인터럽트  
	cmp al, 'c'				; AL과 'c'를 비교
	je check_pc				; AL과 'c'가 같다면 check_pc로
	call a_write				; a_write 프로시저 호출
	ret
a_mac_checkp endp

;----------------------------------------------------------------------------
 check_pc:
	mov ALL[si],al				; AL을 ALL[SI]로 MOV
    inc si					; SOURCE INDEX++

    MOV AH, 01H				; 입력을 위한 FUNCTION(1)
	INT 21H					; 인터럽트
    cmp al, 20H					; AL과 20H(SPACE)를 비교
    je pc_space					; AL이 20H(SPCAE)이면 pc_space로
	call a_write				; a_write 프로시저 호출

pc_space:		
	mov ALL[si],'='				; ALL[SI]위치에 '='를 MOV
	jmp pc_add				; pc_add로

pc_add:
	MOV AH, 01H				; 입력을 위한 FUNCTION(1)
	INT 21H					; 인터럽트 
	cmp al, 0dh				; 입력된 값 AL과 0DH(ENTER)를 비교
	je pc_print			; 입력된 값이 0DH(ENTER)이면 pc_print로
	inc si					; SOURCE INDEX++	
    mov ALL[si],al				; 입력된 값 AL을 ALL[SI]로
    mov address[di],al				; 입력된 값 AL을 ADDRESS[DI]로
    inc di					; DESTINATION INDEX++
loop pc_add					; LOOP

pc_print:
   inc si						; SOURCE INDEX++				
   MOV ALL[SI],'$'				; ALL[SI]위치에 '$'를 MOV
   mov address[di],'$'				; ADDRESS[DI]위치에 '$'를 MOV
   mov dx, offset ALL				; ALL을 출력
   MOV AH,09H					; 문자열 출력을 위한 FUNCTION(9)
   INT 21H					; 인터럽트
   CALL ADDRESS_PC_MAKE			; ADDRESS_PC_MAKE 프로시저 호출
   MOV DL, 0AH				; 줄바꿈	
   MOV AH, 2					; 출력을 위한 FUNCTION(2)
   INT 21H					; 인터럽트
   call a_write					; a_wrtie 프로시저 호출

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - A_MAC_CON_PRINT PROC
;	Function : Function to print 6digit-number instruction code if user writes 'c'
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 27, 2016.11.27
;----------------------------------------------------------------------------
A_MAC_CON_PRINT PROC
	MOV BX, PC				; PC를 BX로 MOV
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	MOV DL, DH				; DH를 DL로 MOV
				;( ADDRESS[0]/PC+2의 ADDRESS[0]을 출력하기 위함)

	CALL JUDGE_ADD			; JUDGE_ADD 프로시저 호출

	MOV AH, 02H				; 명령어 6자리중 첫번째/네번째 출력, 
						; 출력을 하는 FUNCTION(2)
	INT 21H					; 인터럽트
	MOV DX, 0
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV 
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1		   ; ADDRESS[1]/PC+2의 ADDRESS[1]을 출력하기 위함
	
	CALL JUDGE_ADD			; JUDGE_ADD 프로시저 호출

	MOV AH, 02H				; 명령어 6자리중 두번째/다섯번째 출력, 						; 출력을 하는 FUNCTION(2)
	INT 21H					; 인터럽트
	MOV DX, 0
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	SHL DL, 1				; DL<<4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1		; ADDRESS[2]/PC+2의 ADDRESS[2]를 출력하기 위함

	CALL JUDGE_ADD			; JUDGE_ADD 프로시저 호출

	MOV AH, 02H				; 명령어 6자리중 세번째/여섯번째 출력, 
						;출력을 하는 FUNCTION(2)
	INT 21H					; 인터럽트
RET
A_MAC_CON_PRINT ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - a_mac_con proc
;	Function : Function to call procedure according to instruction code
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 27, 2016.11.27
;----------------------------------------------------------------------------

a_mac_con proc
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	CALL A_MAC_CON_PRINT		; A_MAC_CON_PRINT 프로시저 호출 
 						; ADDRESS[0],[1],[2] 출력
	ADD PC, 2				; PC = PC + 2
	CALL A_MAC_CON_PRINT		; A_MAC_CON_PRINT 프로시저 호출 PC+2의 
						; ADDRESS[0],[1],[2] 출력
	SUB PC, 2				; PC = PC - 2

 	mov bx, pc				; PC를 BX로 MOV
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
			
	cmp dh, 1				; DH와 1(MOV 명령어코드)을 비교
	je WHAT_CHK_MO			; DH가 1이라면 WHAT_CHK_MO로

	cmp dh, 2			      ; DH와 2(ADD(더하기) 명령어코드)을 비교
	je WHAT_CHK_AD			; DH가 2라면 WHAT_CHK_AD로

	cmp dh, 3				; DH와 3(SUB(빼기) 명령어코드)을 비교
	je WHAT_CHK_SU			; DH가 3이라면 WHAT_CHK_SU로

	cmp dh, 4				; DH와 4(AND 명령어코드)를 비교
	je WHAT_CHK_AND			; DH가 4라면 WHAT_CHK_AND로

	CMP DH, 5				; DH와 5(OR 명령어코드)를 비교
	JE WHAT_CHK_OR			; DH가 5라면 WHAT_CHK_OR로

	CMP DH, 6				; DH와 6(NOT 명령어코드)을 비교
	JE WHAT_CHK_NOT			; DH가 6이라면 WHAT_CHK_NOT로

	CMP DH, 7				; DH와 7(HLT(정지) 명령어코드)을 비교
	JE WHAT_CHK_HLT			; DH가 7이라면 WHAT_CHK_HLT로

	cmp dh, 8				; DH와 8(INC(증가) 명령어코드)을 비교
	je WHAT_CHK_INC			; DH가 8이라면 WHAT_CHK_INC로

	cmp dh, 9				; DH와 9(DEC(감소) 명령어코드)를 비교
	JE WHAT_CHK_DEC			; DH가 9라면 WHAT_CHK_DEC로

	CMP DH, 10			      ; DH와 10(CMP(비교) 명령어코드)을 비교
	JE WHAT_CHK_CMP			; DH가 10이라면 WHAT_CHK_CMP로

	CMP DH, 11				; DH와 11(BEQ 명령어코드)을 비교
	JE WHAT_CHK_BEQ			; DH가 11이라면 WHAT_CHK_BEQ로

	cmp dh, 12				; DH와 12(SHR 명령어코드)를 비교
	je WHAT_CHK_SHR			; DH가 12라면 WHAT_CHK_SHR로
	
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
WHAT_CHK_MO:
	CALL CHK_MO				; CALL CHK_MO 프로시저 호출
WHAT_CHK_AD:
	CALL CHK_AD				; CALL CHK_AD 프로시저 호출
WHAT_CHK_SU:
	CALL CHK_SU				; CALL CHK_SU 프로시저 호출
WHAT_CHK_AND:
	CALL CHK_AND				; CALL CHK_AND 프로시저 호출
WHAT_CHK_OR:
	CALL CHK_OR				; CALL CHK_OR 프로시저 호출
WHAT_CHK_NOT:
	CALL CHK_NOT				; CALL CHK_NOT 프로시저 호출
WHAT_CHK_HLT:	
	CALL CHK_HLT				; CALL CHK_HLT 프로시저 호출
WHAT_CHK_INC:	
	CALL CHK_INC				; CALL CHK_INC 프로시저 호출
WHAT_CHK_DEC:
	CALL CHK_DEC				; CALL CHK_DEC 프로시저 호출
WHAT_CHK_CMP:
	CALL CHK_CMP				; CALL CHK_CMP 프로시저 호출
WHAT_CHK_BEQ:
	CALL CHK_BEQ				; CALL CHK_BEQ 프로시저 호출
WHAT_CHK_SHR:
	CALL CHK_SHR				; CALL CHK_SHR 프로시저 호출
	ret
a_mac_con endp
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_MO PROC
;	Function : Function to identify MOV's Addressing Mode and call procedure about Addressing Mode
;
;=======111111=========<<<<<<<<<<MOV 이동>>>>>>>>>>>==========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

CHK_MO PROC
	shr dl, 1				; DL>>6 ADDRESS방식을 확인하기 위함
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1
	cmp dl, 0			; DL이 0(Register Addressing Mode)인지 비교
	je WHAT_MO_REG			; DL이 0이라면 WHAT_MO_REG로
	cmp dl, 1		      ; DL이 1(Immediate Addressing Mode)인지 비교
	JE WHAT_MO_IMM			; DL이 1이라면 WHAT_MO_IMM로
	cmp dl, 2			; DL이 2(Direct Addressing Mode)인지 비교
	JE WHAT_MO_DIR			; DL이 2이라면 WHAT_MO_DIR로
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
WHAT_MO_REG:
	CALL MO_REG				; CALL MO_REG 프로시저 호출		
WHAT_MO_IMM:
	CALL MO_IMM				; CALL MO_IMM 프로시저 호출
WHAT_MO_DIR:
	CALL MO_DIR				; CALL MO_DIR 프로시저 호출
RET
CHK_MO ENDP
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_REG PROC
;	Function : Function to what is first Register when MOV's Addressing Mode is Register Adressing Mode	
;
;=========111111======<<<<<<<<<<MOV 이동>>>>>>>>>>>============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_REG PROC
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				; DL이 0인지 비교
	JE WHAT_MO_REG_R0			; DL이 0이라면 WHAT_MO_REG_R0로
	CMP DL, 1				; DL이 1인지 비교
	JE WHAT_MO_REG_R1			; DL이 1이라면 WHAT_MO_REG_R1로
	CMP DL, 2				; DL이 2인지 비교
	JE WHAT_MO_REG_R2			; DL이 2라면 WHAT_MO_REG_R2로
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
WHAT_MO_REG_R0:
	CALL MO_REG_R0	; MO_REG_R0 프로시저 호출 (첫번째 레지스터가 R0)
WHAT_MO_REG_R1:
	CALL MO_REG_R1	; MO_REG_R1 프로시저 호출 (첫번째 레지스터가 R1)
WHAT_MO_REG_R2:
	CALL MO_REG_R2	; MO_REG_R2 프로시저 호출 (첫번째 레지스터가 R2)
RET
MO_REG ENDP
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_REG_R0 PROC
;	Function :  Function to what is second Register && Register's MOV calculation 
;				when MOV's Addressing Mode is Register Adressing Mode and first Register is RO	
;				MOV의 Addressing Mode가 Register이고 첫번째 레지스터가 R0인 경우 두번째 레지스터가 무엇인지 & 레지스터에 맞는 mov연산
;
;=========111111=======<<<<<<<<<<MOV 이동>>>>>>>>>>>===========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_REG_R0 PROC

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	
	SHL DL, 1				; DL<<4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1

	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; DL 8자리중 뒤의 4자리를 알기 위해서

	CMP DL, 0				; DL이 0(0000)인지 아닌지 비교
	JE MO_REG_R0R0			; DL이 0이라면 MO_REG_R0R0로
	CMP DL, 4				; DL이 4(0100)인지 아닌지 비교
	JE MO_REG_R0R1			; DL이 4라면 MO_REG_R0R1로
	CMP DL, 8				; DL이 8(1000)인지 아닌지 비교
	JE MO_REG_R0R2			; DL이 8이라면 MO_REG_R0R2로
	CMP DL, 12				; DL이 12(1100)인지 아닌지 비교
	JE MO_REG_R0AD			; DL이 12라면 MO_REG_R0AD로
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
MO_REG_R0R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, R0				; RO를 DX로 MOV
	MOV R0, DX		; DX를 R0로 MOV (MOV의 기능 : R0를 R0로 이동)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_REG_R0R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, R1				; R1를 DX로 MOV
	MOV R0, DX				; DX를 R0로 MOV (MOV의 기능 : R1을 R0로 이동)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; DX를 0으로 초기화
	MOV DX, R2				; R2를 DX로 MOV
	MOV R0, DX				; DX를 R0로 MOV (MOV의 기능 : R2를 R0로 이동)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_REG_R0AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출 
	MOV DX, BX				; BX를 DX로 이동시킨다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0를 DX로 MOV
	MOV MEM[BX], DX			; DX를 MEM[BX]로 MOV
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
	RET
MO_REG_R0 ENDP
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_REG_R1 PROC
;	Function :  Function to what is second Register && Register's MOV calculation 
;				when MOV's Addressing Mode is Register Adressing Mode and first Register is R1
;
;==========111111=======<<<<<<<<<<MOV 이동>>>>>>>>>>>=========
;	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_REG_R1 PROC

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	
	SHL DL, 1				; DL<<4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1

	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; DL 8자리중 뒤의 4자리를 알기 위해서

	CMP DL, 0				; DL이 0인지 아닌지 비교
	JE MO_REG_R1R0			; DL이 0이라면 MO_REG_R1R0로 
	CMP DL, 4				; DL이 4인지 아닌지 비교
	JE MO_REG_R1R1			; DL이 4라면 MO_REG_R1R1로 
	CMP DL, 8				; DL이 8인지 아닌지 비교
	JE MO_REG_R1R2			; DL이 8이라면 MO_REG_R1R2로 
	CMP DL, 12				; DL이 12인지 아닌지 비교
	JE MO_REG_R1AD			; DL이 12라면 MO_REG_R1AD로 
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
MO_REG_R1R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, R0				; RO을 DX로 MOV
	MOV R1, DX		; DX를 R1으로 MOV (MOV의 기능 : R0를 R1으로 이동)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_REG_R1R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, R1				; R1을 DX로 MOV
	MOV R1, DX		; DX를 R1으로 MOV (MOV의 기능 : R1을 R1으로 이동)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_REG_R1R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; DX를 0으로 초기화
	MOV DX, R2				; R2를 DX로 MOV
	MOV R1, DX				; DX를 R1으로 MOV (MOV의 기능 : R2를 R1으로 이동)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_REG_R1AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				; BX를 0으로 초기화
	MOV DX, 0				; DX를 0으로 초기화
	MOV BX, PC				; PC를 BX로 MOV
	MOV DX, R1				; R1을 DX로 MOV
	MOV MEM[BX], DX			; DX를 MEM[BX]로
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
	RET
MO_REG_R1 ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_REG_R2 PROC
;	Function :  Function to what is second Register && Register's MOV calculation 
;				when MOV's Addressing Mode is Register Adressing Mode and first Register is R2
;
;=======111111========<<<<<<<<<<MOV 이동>>>>>>>>>>>===========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_REG_R2 PROC

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	
	SHL DL, 1				; DL<<4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1

	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; DL 8자리중 뒤의 4자리를 알기 위해서

	CMP DL, 0				; DL이 0인지 아닌지 비교
	JE MO_REG_R2R0			; DL이 0이라면 MO_REG_R2R0로
	CMP DL, 4				; DL이 4인지 아닌지 비교
	JE MO_REG_R2R1			; DL이 4라면 MO_REG_R2R1로
	CMP DL, 8				; DL이 8인지 아닌지 비교
	JE MO_REG_R2R2			; DL이 8이라면 MO_REG_R2R2로
	CMP DL, 12				; DL이 12인지 아닌지 비교
	JE MO_REG_R2AD			; DL이 12라면 MO_REG_R2AD로
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
MO_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, R0				; RO를 DX로 MOV
	MOV R2, DX				; DX를 R2로 MOV (MOV의 기능 : R0를 R2로 이동)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_REG_R2R1:	
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, R1				; R1을 DX로 MOV
	MOV R2, DX				; DX를 R2로 MOV (MOV의 기능 : R1을 R2로 이동)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; DX를 0으로 초기화
	MOV DX, R2				; R2를 DX로 MOV
	MOV R2, DX				; DX를 R2로 MOV (MOV의 기능 : R2를 R2로 이동)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_REG_R2AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				; BX를 0으로 초기화
	MOV DX, 0				; DX를 0으로 초기화
	MOV BX, PC				; PC를 BX로 MOV
	MOV DX, R2				; R2를 DX로 MOV
	MOV MEM[BX], DX			; DX를 MEM[BX]로 MOV
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
	RET
MO_REG_R2 ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_IMM PROC	
;	Function : Function to MOV calculation when MOV's Addressing Mode is Immediate
;
;=====111111==========<<<<<<<<<<MOV 이동>>>>>>>>>>==========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_IMM PROC		

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_MOVIMM			; 아니라면 ERROR_MOVIMM로

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL의 앞의 4자리중 뒤의 2자리를 알기 위해서

	CMP DL, 4				; DL이 0인지 아닌지 비교
	JE MO_IMM_R0				; DL이 0이라면 MO_IMM_R0로
	CMP DL, 5				; DL이 1인지 아닌지 비교
	JE MO_IMM_R1				; DL이 1이라면 MO_IMM_R1으로
	CMP DL, 6				; DL이 2인지 아닌지 비교
	JE MO_IMM_R2				; DL이 2라면 MO_IMM_R2로
	CMP DL, 7				; DL이 3인지 아닌지 비교
	JE MO_IMM_AD				; DL이 3이라면 MO_IMM_AD로
ERROR_MOVIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
MO_IMM_R0:
	ADD PC, 2				; PC = PC + 2
	MOV BX, PC				; PC를 BX로 MOV
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	MOV R0, DX				; DX를 R0로 MOV
	ADD PC, 2				; PC = PC + 2
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_IMM_R1:
	ADD PC, 2				; PC = PC + 2
	MOV BX, PC				; PC를 BX로 MOV
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	MOV R1, DX				; DX를 R1으로 MOV
	ADD PC, 2				; PC = PC + 2
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_IMM_R2:
	ADD PC, 2				; PC = PC + 2
	MOV BX, PC				; PC를 BX로 MOV
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	MOV R2, DX				; DX를 R2로 MOV
	ADD PC, 2				; PC = PC + 2
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_IMM_AD:
	ADD PC, 2				; PC = PC + 2
	MOV BX, PC				; PC를 BX로 MOV
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	SUB PC, 2				; PC = PC - 2
	MOV BX, PC				; PC를 BX로
	MOV MEM[BX], DX			; DX를 MEM[BX]로
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출	
	RET
MO_IMM ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_DIR PROC
;	Function : Function to MOV calculation when MOV's Addressing Mode is Direct Addressing Mode
;
;========111111=========<<<<<<<<<<MOV 이동>>>>>>>>>>>==========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_DIR PROC			

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_MOVDIR			; 아니라면 ERROR_MOVDIR로

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	SHL DL, 1				; DL<<2
	SHL DL, 1
	SHR DL, 1				; DL>>6
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL의 앞의 4자리중 뒤의 2자리를 알기 위해서

	CMP DL, 0				; DL이 0인지 아닌지 비교
	JE MO_DIR_R0				; DL이 0이라면 MO_DIR_R0로
	CMP DL, 1				; DL이 1인지 아닌지 비교
	JE MO_DIR_R1				; DL이 1이라면 MO_DIR_R1으로
	CMP DL, 2				; DL이 2인지 아닌지 비교
	JE MO_DIR_R2				; DL이 2라면 MO_DIR_R2로
ERROR_MOVDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
MO_DIR_R0:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 MOV
	MOV BX, 0				; BX를 0으로 초기화
	MOV BX, PC				; PC를 BX로 MOV
	MOV PC, DX				; DX를 PC로 MOV
	ADD PC, 2				; PC = PC + 2
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	MOV R0, DX				; DX를 R0로 MOV
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_DIR_R1:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 MOV
	MOV BX, 0				; BX를 0으로 초기화
	MOV BX, PC				; PC를 BX로 MOV
	MOV PC, DX				; DX를 PC로 MOV
	ADD PC, 2				; PC = PC + 2
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	MOV R1, DX				; DX를 R1으로 MOV
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
MO_DIR_R2:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 MOV
	MOV BX, 0				; BX를 0으로 초기화
	MOV BX, PC				; PC를 BX로 MOV
	MOV PC, DX				; DX를 PC로 MOV
	ADD PC, 2				; PC = PC + 2
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	MOV R2, DX				; DX를 R2로 MOV
	call a_mac_dis				; a_mac_dis 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출

	RET
	MO_DIR ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_AD PROC
;	Function : Function to identify ADD's Addressing Mode and call procedure about Addressing Mode
;
;========222222========<<<<<<<<<<더하기>>>>>>>>>>>=============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

CHK_AD PROC
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1				; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	cmp dl, 0			; DL이 0(Register Addressing Mode)인지 비교
	je WHAT_AD_REG			; DL과 0같으면 WHAT_AD_REG로 점프
	cmp dl, 1		       ; DL이 1(Immediate Addressing Mode)인지 비교
	JE WHAT_AD_IMM			; DL과 1같으면 WHAT_AD_IMM로 점프
	cmp dl, 2			; DL이 0(Direct Addressing Mode)인지 비교
	JE WHAT_AD_DIR			; DL과 2같으면 WHAT_AD_DIR로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
WHAT_AD_REG:
	CALL AD_REG				; AD_REG 프로시저를 호출
WHAT_AD_IMM:
	CALL AD_IMM				; AD_IMM 프로시저를 호출
WHAT_AD_DIR:
	CALL AD_DIR				; AD_DIR 프로시저를 호출
	RET
	CHK_AD ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_REG PROC
;	Function : Function to what is first Register when ADD's Addressing Mode is Register Adressing Mode	
;
;=============222222==========<<<<<<<<<<더하기>>>>>>>>>>>=====================
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;---------------------------------------------------------------------------

AD_REG PROC				
	MOV DX, 0           			; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]	    	; MEM[BX]위치에 있는 값을 DX에 넣는다
	
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1	    		; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0           			; 0을 DL과 비교한다
	JE WHAT_AD_REG_R0          	; DL과 0이 같으면 WHAT_AD_REG_R0으로 점프
	CMP DL, 1           			; 1을 DL과 비교한다
	JE WHAT_AD_REG_R1         	; DL과 1이 같으면 WHAT_AD_REG_R1으로 점프
	CMP DL, 2           			; 2를 DL과 비교한다
	JE WHAT_AD_REG_R2   		; DL과 2가 같으면 WHAT_AD_REG_R2으로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
WHAT_AD_REG_R0:
	CALL AD_REG_R0  			; AD_REG_R0 프로시저를 호출
WHAT_AD_REG_R1:
	CALL AD_REG_R1				; AD_REG_R1 프로시저를 호출
WHAT_AD_REG_R2:
	CALL AD_REG_R2				; AD_REG_R2 프로시저를 호출
	
;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_REG_R0 PROC
;	Function :  Function to what is second Register && Register's ADD calculation 
;				when ADD's Addressing Mode is Register Adressing Mode and first Register is RO	
;
;=======222222========<<<<<<<<<<더하기>>>>>>>>>>>==============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AD_REG_R0 PROC
	

	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다


	CMP DL, 0				; 0을 DL과 비교한다
	JE AD_REG_R0R0			; DL과 0이 같으면 AD_REG_R0R0으로 점프
	CMP DL, 4				; 4를 DL과 비교한다
	JE AD_REG_R0R1			; DL과 4가 같으면 AD_REG_R0R1로 점프
	CMP DL, 8				; 8을 DL과 비교한다
	JE AD_REG_R0R2			; DL과 8이 같으면 AD_REG_R0R2로 점프
	CMP DL, 12				; 12를 DL과 비교한다
	JE AD_REG_R0AD			; DL과 12가 같으면 AD_REG_R0AD로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						; ERRORMESSAGE 프로시저 호출
	
AD_REG_R0R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	ADD R0, DX				; R0에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출
	CALL A_WRITE				; A_WRITE 프로시저를 호출
AD_REG_R0R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	ADD R0, DX				; R0에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출
	CALL A_WRITE				; A_WRITE 프로시저를 호출
AD_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	ADD R0, DX				; R0에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출
	CALL A_WRITE				; A_WRITE 프로시저를 호출
	RET
	AD_REG_R0 ENDP	
AD_REG_R0AD:
	CALL MAKE_ADDRESS		       ; MAKE_ADDRESS 프로시저를 호출한다
	MOV BX, 0 				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	ADD MEM[BX], DX		      ; MEM[BX]위치에 있는 값에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출한다
	CALL A_WRITE				; A_WRITE 프로시저를 호출한다
	RET

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_REG_R1 PROC
;	Function :  Function to what is second Register && Register's ADD calculation 
;				when ADD's Addressing Mode is Register Adressing Mode and first Register is R1
;
;=====222222=========<<<<<<<<<<더하기>>>>>>>>>>>===============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AD_REG_R1 PROC

	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE AD_REG_R1R0			; DL과 0이 같으면 AD_REG_R1R0으로 점프
	CMP DL, 4				; DL과 4를 비교한다
	JE AD_REG_R1R1			; DL과 4가 같으면 AD_REG_R1R1으로 점프
	CMP DL, 8				; DL과 8를 비교한다
	JE AD_REG_R1R2			; DL과 8이 같으면 AD_REG_R1R2로 점프
	CMP DL, 12				; DL과 12를 비교한다
	JE AD_REG_R1AD			; DL과 12가 같으면 AD_REG_R1AD로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 
						; ERRORMESSAGE 프로시저 호출
	
AD_REG_R1R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	ADD R1, DX				; R1에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출한다
	CALL A_WRITE				; A_WRITE 프로시저를 호출한다
AD_REG_R1R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	ADD R1, DX				; R1에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출한다
	CALL A_WRITE				; A_WRITE 프로시저를 호출한다
AD_REG_R1R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	ADD R1, DX				; R1에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출한다
	CALL A_WRITE				; A_WRITE 프로시저를 호출한다
AD_REG_R1AD:
	CALL MAKE_ADDRESS		       ; MAKE_ADDRESS 프로시저를 호출한다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	ADD MEM[BX], DX	    	      ; MEM[BX]위치에 있는 값에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출한다
	CALL A_WRITE				; A_WRITE 프로시저를 호출한다
	RET
	AD_REG_R1 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_REG_R2 PROC
;	Function :  Function to what is second Register && Register's ADD calculation 
;				when ADD's Addressing Mode is Register Adressing Mode and first Register is R2
;
;=======222222=========<<<<<<<<<<더하기>>>>>>>>>>>==============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AD_REG_R2 PROC	
	
	MOV DX, 0				; 0을 BX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE AD_REG_R2R0			; DL과 0이 같으면 AD_REG_R2R0으로 점프
	CMP DL, 4				; DL과 4를 비교한다
	JE AD_REG_R2R1			; DL과 4가 같으면 AD_REG_R2R1으로 점프
	CMP DL, 8				; DL과 8을 비교한다
	JE AD_REG_R2R2			; DL과 8이 같으면 AD_REG_R2R2로 점프
	CMP DL, 12				; DL과 12를 비교한다
	JE AD_REG_R2AD			; DL과 12가 같으면 AD_REG_R2AD로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						; ERRORMESSAGE 프로시저 호출
	
AD_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	ADD R2, DX				; R2에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출한다
	CALL A_WRITE				; A_WRITE 프로시저를 호출한다
AD_REG_R2R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	ADD R2, DX				; R2에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출한다
	CALL A_WRITE				; A_WRITE 프로시저를 호출한다
AD_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	ADD R2, DX				; R2에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출한다
	CALL A_WRITE				; A_WRITE 프로시저를 호출한다
AD_REG_R2AD:
	CALL MAKE_ADDRESS		       ; MAKE_ADDRESS 프로시저를 호출한다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	ADD MEM[BX], DX		      ; MEM[BX]위치에 있는 값에 DX를 더한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출한다
	CALL A_WRITE				; A_WRITE 프로시저를 호출한다
	RET
AD_REG_R2 ENDP
	RET
AD_REG ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_IMM PROC		
;	Function : Function to ADD calculation when ADD's Addressing Mode is Immediate
;
;=======222222==========<<<<<<<<<<더하기>>>>>>>>>>>=========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AD_IMM PROC					; immediate	

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_ADIMM			; 아니라면 ERROR_ADIMM로

	MOV DX, 0				; 0을 BX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 2비트 이동시킨다
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE AD_IMM_R0				; DL과 0이 같으면 AD_IMM_R0로 점프
	CMP DL, 1				; DL과 1을 비교한다
	JE AD_IMM_R1				; DL과 1이 같으면 AD_IMM_R1로 점프
	CMP DL, 2				; DL과 2를 비교한다
	JE AD_IMM_R2				; DL과 2가 같으면 AD_IMM_R2로 점프
ERROR_ADIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출

AD_IMM_R0:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]	   	      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	ADD R0, DX				; R0에 DX를 더한다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출
	CALL A_WRITE				; A_WRITE 프로시저를 호출
AD_IMM_R1:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]			; MEM[BX]위치에 있는 값을 DX에 넣는다
	ADD R1, DX				; R1에 DX를 더한다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출
	CALL A_WRITE				; A_WRITE 프로시저를 호출
AD_IMM_R2:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	ADD R2, DX				; R2에 DX를 더한다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저를 호출
	CALL A_WRITE				; A_WRITE프로시저를 호출
	RET
AD_IMM ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_DIR PROC
;	Function : Function to ADD calculation when ADD's Addressing Mode is Direct Addressing Mode
;
;========222222=======<<<<<<<<<<더하기>>>>>>>>>>>===============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AD_DIR PROC					; direct

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_ADDIR			; 아니라면 ERROR_ADDIR로
	
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 2비트 이동시킨다
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE AD_DIR_R0				; DL과 0이 같으면 AD_DIR_R0로 이동
	CMP DL, 1				; DL과 1을 비교한다
	JE AD_DIR_R1				; DL과 1이 같으면 AD_DIR_R1로 이동
	CMP DL, 2				; DL과 2를 비교한다
	JE AD_DIR_R2				; DL과 2가 같으면 AD_DIR_R2로 이동
ERROR_ADDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
AD_DIR_R0:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 이동시킨다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	ADD R0, DX				; R0에 DX를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AD_DIR_R1:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
MOV DX, BX
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; BX를 DX를 이동시킨다
	MOV PC, DX				; BX를 DX를 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; BX를 DX를 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	ADD R1, DX				; R1에 DX를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AD_DIR_R2:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
MOV DX, BX
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	ADD R2, DX				; R2에 DX를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
RET
AD_DIR ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_SU PROC
;	Function : Function to identify SUB's Addressing Mode and call procedure about Addressing Mode
;
;========33333======<<<<<<<<<<빼기>>>>>>>>>>>===============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

CHK_SU PROC
	shr dl, 1	
	shr dl, 1	
	shr dl, 1	
	shr dl, 1	
	shr dl, 1	
	shr dl, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	cmp dl, 0			; DL이 0(Register Addressing Mode)인지 비교
	je WHAT_SU_REG		; DL과 0이 같다면 WHAT_SU_REG로 점프
	cmp dl, 1		      ; DL이 1(Immediate Addressing Mode)인지 비교
	JE WHAT_SU_IMM		; DL과 1이 같다면 WHAT_SU_IMM로 점프
	cmp dl, 2			; DL이 2(Direct Addressing Mode)인지 비교
	JE WHAT_SU_DIR		; DL과 2가 같다면 WHAT_SU_DIR로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
WHAT_SU_REG:
	CALL SU_REG				; SU_REG 프로시저 호출
WHAT_SU_IMM:
	CALL SU_IMM				; SU_IMM 프로시저 호출
WHAT_SU_DIR:
	CALL SU_DIR				; SU_DIR 프로시저 호출
	RET
	CHK_SU ENDP	

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_REG PROC
;	Function : Function to what is first Register when SUB's Addressing Mode is Register Adressing Mode	
;
;======33333========<<<<<<<<<<빼기>>>>>>>>>>>==================
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

SU_REG PROC					; register
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE WHAT_SU_REG_R0		; DL과 0이 같다면 WHAT_SU_REG_R0로 점프
	CMP DL, 1				; DL과 1을 비교한다
	JE WHAT_SU_REG_R1		; DL과 1이 같다면 WHAT_SU_REG_R1로 점프
	CMP DL, 2				; DL과 2를 비교한다
	JE WHAT_SU_REG_R2		; DL과 2가 같다면 WHAT_SU_REG_R2로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
WHAT_SU_REG_R0:
	CALL SU_REG_R0				; SU_REG_R0 프로시저 호출
WHAT_SU_REG_R1:
	CALL SU_REG_R1				; SU_REG_R1 프로시저 호출
WHAT_SU_REG_R2:
	CALL SU_REG_R2				; SU_REG_R2 프로시저 호출
	RET
SU_REG ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_REG_R0 PROC
;	Function :  Function to what is second Register && Register's SUB calculation 
;				when SUB's Addressing Mode is Register Adressing Mode and first Register is RO	
;
;========33333========<<<<<<<<<<빼기>>>>>>>>>>>===============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

SU_REG_R0 PROC	

	
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEMBX위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE SU_REG_R0R0			; DL과 0이 같으면 SU_REG_R0R0으로 점프
	CMP DL, 4				; DL과 4를 비교한다
	JE SU_REG_R0R1			; DL과 4가 같으면 SU_REG_R0R1으로 점프
	CMP DL, 8				; DL과 8을 비교한다
	JE SU_REG_R0R2			; DL과 8이 같으면 SU_REG_R0R2로 점프
	CMP DL, 12				; DL과 12를 비교한다
	JE SU_REG_R0AD			; DL과 12가 같으면 SU_REG_R0AD로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
SU_REG_R0R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	SUB R0, DX				; R0에서 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_REG_R0R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	SUB R0, DX				; R0에서 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	SUB R0, DX				; R0에서 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_REG_R0AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC을 BX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	SUB MEM[BX], DX			; MEM[BX]위치에 있는 값에 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
	RET
	SU_REG_R0 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_REG_R1 PROC
;	Function :  Function to what is second Register && Register's SUB calculation 
;				when SUB's Addressing Mode is Register Adressing Mode and first Register is R1	
;
;========33333========<<<<<<<<<<빼기>>>>>>>>>>>==============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

SU_REG_R1 PROC

	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE SU_REG_R1R0			; DL과 0이 같으면 SU_REG_R1R0으로 점프
	CMP DL, 4				; DL과 4를 비교한다
	JE SU_REG_R1R1			; DL과 4가 같으면 SU_REG_R1R1으로 점프
	CMP DL, 8				; DL과 8을 비교한다
	JE SU_REG_R1R2			; DL과 8이 같으면 SU_REG_R1R2로 점프
	CMP DL, 12				; DL과 12를 비교한다
	JE SU_REG_R1AD			; DL과 12가 같으면 SU_REG_R1AD로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
SU_REG_R1R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	SUB R1, DX				; R1에서 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_REG_R1R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	SUB R1, DX				; R1에서 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_REG_R1R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	SUB R1, DX				; R1에서 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_REG_R1AD:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	SUB MEM[BX], DX			; MEM[BX]위치에 있는 값에 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
	RET
	SU_REG_R1 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_REG_R2 PROC
;	Function :  Function to what is second Register && Register's SUB calculation 
;				when SUB's Addressing Mode is Register Adressing Mode and first Register is R2	
;
;========33333=========<<<<<<<<<<빼기>>>>>>>>>>>=============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

SU_REG_R2 PROC

	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE SU_REG_R2R0			; DL과 0이 같으면 SU_REG_R2R0으로 점프
	CMP DL, 4				; DL과 4를 비교한다
	JE SU_REG_R2R1			; DL과 4가 같으면 SU_REG_R2R1으로 점프
	CMP DL, 8				; DL과 8을 비교한다
	JE SU_REG_R2R2			; DL과 8이 같으면 SU_REG_R2R2로 점프
	CMP DL, 12				; DL과 12를 비교한다
	JE SU_REG_R2AD			; DL과 12가 같으면 SU_REG_R2AD로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						; ERRORMESSAGE 프로시저 호출
	
SU_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	SUB R2, DX				; R2에서 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_REG_R2R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	SUB R2, DX				; R2에서 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	SUB R2, DX				; R2에서 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_REG_R2AD:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	SUB MEM[BX], DX			; MEM[BX]위치에 있는 값에 DX를 뺀다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
	RET
SU_REG_R2 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_IMM PROC		
;	Function : Function to SUB calculation when SUB's Addressing Mode is Immediate
;
;========33333==========<<<<<<<<<<빼기>>>>>>>>>>>=========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

SU_IMM PROC					; immediate	

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_SUIMM			; 아니라면 ERROR_SUIMM로
	
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 2비트 이동시킨다
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE SU_IMM_R0				; DL과 0이 같으면 SU_IMM_R0로 점프
	CMP DL, 1				; DL과 1을 비교한다
	JE SU_IMM_R1				; DL과 1이 같으면 SU_IMM_R1로 점프
	CMP DL, 2				; DL과 2를 비교한다
	JE SU_IMM_R2				; DL과 2가 같으면 SU_IMM_R2로 점프
ERROR_SUIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
SU_IMM_R0:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	SUB R0, DX				; R0에서 DX를 뺀다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_IMM_R1:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	SUB R1, DX				; R1에서 DX를 뺀다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis 				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_IMM_R2:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	SUB R2, DX				; R2에서 DX를 뺀다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출

	RET
SU_IMM ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_DIR PROC
;	Function : Function to SUB calculation when SUB's Addressing Mode is Direct Addressing Mode
;
;=======33333==========<<<<<<<<<<빼기>>>>>>>>>>>==============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;-------------------------------------------------------------------------------

SU_DIR PROC					; direct

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_SUDIR			; 아니라면 ERROR_SUDIR로

	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 2비트 이동시킨다
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE SU_DIR_R0				; DL과 0이 같으면 SU_DIR_R0로 점프
	CMP DL, 1				; DL과 1을 비교한다
	JE SU_DIR_R1				; DL과 1이 같으면 SU_DIR_R1로 점프
	CMP DL, 2				; DL과 2를 비교한다
	JE SU_DIR_R2				; DL과 2가 같으면 SU_DIR_R2로 점프
ERROR_SUDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
SU_DIR_R0:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 이동시킨다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]	    	      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	SUB R0, DX				; R0에서 DX를 뺀다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_DIR_R1:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 이동시킨다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	SUB R1, DX				; R1에서 DX를 뺀다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
SU_DIR_R2:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 이동시킨다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	SUB R2, DX				; R2에서 DX를 뺀다

	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
RET
SU_DIR ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_AND PROC
;	Function : Function to identify AND's Addressing Mode and call procedure about Addressing Mode
;
;=========44444======= <<<<<<<<<<AND>>>>>>>>>>===== ==========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

CHK_AND PROC
	shr dl, 1	
	shr dl, 1	
	shr dl, 1	
	shr dl, 1	
	shr dl, 1	
	shr dl, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	cmp dl, 0			; DL이 0(Register Addressing Mode)인지 비교
	je WHAT_AND_REG		; DL과 0이 같으면 WHAT_AND_REG로 점프
	cmp dl, 1		      ; DL이 1(Immediate Addressing Mode)인지 비교
	JE WHAT_AND_IMM		; DL과 1이 같으면 WHAT_AND_IMM로 점프
	cmp dl, 2			; DL이 2(Direct Addressing Mode)인지 비교
	JE WHAT_AND_DIR		; DL과 2가 같으면 WHAT_AND_DIR로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
WHAT_AND_REG:
	CALL AND_REG				; AND_REG 프로시저 호출
WHAT_AND_IMM:
	CALL AND_IMM				; AND_IMM 프로시저 호출
WHAT_AND_DIR:
	CALL AND_DIR				; AND_DIR 프로시저 호출
	RET
	CHK_AND ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AND_REG PROC
;	Function : Function to what is first Register when AND's Addressing Mode is Register Adressing Mode	
;
;=========44444======== <<<<<<<<<AND>>>>>>>>>>======== =======
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AND_REG PROC					; register
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 2비트 이동시킨다
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE WHAT_AND_REG_R0		; DL과 0이 같으면 WHAT_AND_REG_R0로 점프
	CMP DL, 1				; DL과 1을 비교한다
	JE WHAT_AND_REG_R1		; DL과 1이 같으면 WHAT_AND_REG_R1로 점프
	CMP DL, 2				; DL과 2를 비교한다
	JE WHAT_AND_REG_R2		; DL과 2가 같으면 WHAT_AND_REG_R2로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						; ERRORMESSAGE 프로시저 호출
	
WHAT_AND_REG_R0:
	CALL AND_REG_R0			; AND_REG_R0 프로시저 호출
WHAT_AND_REG_R1:
	CALL AND_REG_R1			; AND_REG_R1 프로시저 호출
WHAT_AND_REG_R2:
	CALL AND_REG_R2			; AND_REG_R2 프로시저 호출
	RET
AND_REG ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AND_REG_R0 PROC
;	Function :  Function to what is second Register && Register's AND calculation 
;				when AND's Addressing Mode is Register Adressing Mode and first Register is RO	
;
;=========44444===== ==<<<<<<<<<<AND>>>>>>>>>>===== ===========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AND_REG_R0 PROC

	
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		       ; MEMBX위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE AND_REG_R0R0		; DL과 0이 같으면 AND_REG_R0R0으로 점프
	CMP DL, 4				; DL과 4를 비교한다
	JE AND_REG_R0R1		; DL과 4가 같으면 AND_REG_R0R1으로 점프
	CMP DL, 8				; DL과 8을 비교한다
	JE AND_REG_R0R2		; DL과 8이 같으면 AND_REG_R0R2로 점프
	CMP DL, 12				; DL과 12를 비교한다
	JE AND_REG_R0AD		; DL과 12가 같으면 AND_REG_R0AD로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						; ERRORMESSAGE 프로시저 호출
	
AND_REG_R0R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	AND R0, DX				; R0과 DX를 AND연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_REG_R0R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	AND R0, DX				; R0과 DX를 AND연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	AND R0, DX				; R0과 DX를 AND연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_REG_R0AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	AND MEM[BX], DX	; MEM[BX]위치에 있는 값과 DX를 AND연산 한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
	RET
	AND_REG_R0 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AND_REG_R1 PROC
;	Function :  Function to what is second Register && Register's AND calculation 
;				when AND's Addressing Mode is Register Adressing Mode and first Register is R1	
;
;=========44444======== ===<<<<<<<<<<AND>>>>>>>>>>=========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AND_REG_R1 PROC

	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE AND_REG_R1R0		; DL과 0이 같으면 AND_REG_R1R0으로 점프
	CMP DL, 4				; DL과 4를 비교한다
	JE AND_REG_R1R1		; DL과 4가 같으면 AND_REG_R1R1으로 점프
	CMP DL, 8				; DL과 8을 비교한다
	JE AND_REG_R1R2		; DL과 8이 같으면 AND_REG_R1R2로 점프
	CMP DL, 12				; DL과 12를 비교한다
	JE AND_REG_R1AD		; DL과 12가 같으면 AND_REG_R1AD로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
AND_REG_R1R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0를 DX로 이동시킨다
	AND R1, DX				; R1과 DX를 AND연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_REG_R1R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	AND R1, DX				; R1과 DX를 AND연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_REG_R1R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	AND R1, DX				; R1과 DX를 AND연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_REG_R1AD:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	AND MEM[BX], DX	; MEM[BX]위치에 있는 값과 DX를 AND 연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
	RET
	AND_REG_R1 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AND_REG_R2 PROC
;	Function :  Function to what is second Register && Register's AND calculation 
;				when AND's Addressing Mode is Register Adressing Mode and first Register is R2	
;
;=========44444==========<<<<<<<<<<AND>>>>>>>>>>============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
AND_REG_R2 PROC
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]	  	      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE AND_REG_R2R0		; DL과 0이 같으면 AND_REG_R2R0으로 점프
	CMP DL, 4				; DL과 4를 비교한다
	JE AND_REG_R2R1		; DL과 4가 같으면 AND_REG_R2R1으로 점프
	CMP DL, 8				; DL과 8을 비교한다
	JE AND_REG_R2R2		; DL과 8이 같으면 AND_REG_R2R2로 점프
	CMP DL, 12				; DL과 12를 비교한다
	JE AND_REG_R2AD		; DL과 12가 같으면 AND_REG_R2AD로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
AND_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	AND R2, DX				; R2와 DX를 AND연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_REG_R2R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	AND R2, DX				; R2와 DX를 AND연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	AND R2, DX				; R2와 DX를 AND연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_REG_R2AD:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	AND MEM[BX], DX		; MEM[BX]위치에 있는 값과 DX를 AND연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
	RET
AND_REG_R2 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AND_IMM PROC		
;	Function : Function to AND calculation when AND's Addressing Mode is Immediate
;
;=========44444=========<<<<<<<<<<AND>>>>>>>>>>==============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AND_IMM PROC					; immediate	

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_ANDIMM			; 아니라면 ERROR_ANDIMM로
	
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		       ; MEMBX위치에 있는 값을 DX에 넣는다
	SHL DL, 1
	SHL DL, 1			   ; DL에 있는 값을 왼쪽으로 2비트 이동시킨다

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE AND_IMM_R0			      ; DL과 0이 같으면 ADD_IMM_R0로 점프
	CMP DL, 1				; DL과 1을 비교한다
	JE AND_IMM_R1			      ; DL과 1이 같으면 ADD_IMM_R1로 점프
	CMP DL, 2				; DL과 2를 비교한다
	JE AND_IMM_R2			      ; DL과 2가 같으면 ADD_IMM_R2로 점프
ERROR_ANDIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
AND_IMM_R0:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	AND R0, DX				; R0과 DX를 AND연산한다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_IMM_R1:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	AND R1, DX				; R1과 DX를 AND연산한다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_IMM_R2:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]	    	      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	AND R2, DX				; R2와 DX를 AND연산한다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출

	RET
AND_IMM ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AND_DIR PROC
;	Function : Function to AND calculation when AND's Addressing Mode is Direct Addressing Mode
;
;=========44444=========<<<<<<<<<<AND>>>>>>>>>>==============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AND_DIR PROC					; direct

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_ANDDIR			; 아니라면 ERROR_ANDDIR로

	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 2비트 이동시킨다
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			 ; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE AND_DIR_R0			     ; DL과 0이 같으면 AND_DIR_R0으로 점프
	CMP DL, 1				; DL과 1을 비교한다
	JE AND_DIR_R1			     ; DL과 1이 같으면 AND_DIR_R1으로 점프
	CMP DL, 2				; DL과 2를 비교한다
	JE AND_DIR_R2			       ; DL과 2가 같으면 AND_DIR_R2로 점프

ERROR_ANDDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
AND_DIR_R0:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 이동시킨다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다	
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	AND R0, DX				; R0과 DX를 AND연산한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_DIR_R1:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 이동시킨다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]	              ; MEM[BX]위치에 있는 값을 DX에 넣는다
	AND R1, DX				; R1과 DX를 AND연산한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출	
	CALL A_WRITE				; A_WRITE 프로시저 호출
AND_DIR_R2:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 이동시킨다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	AND R2, DX				; R2와 DX를 AND연산한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
RET
AND_DIR ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_OR PROC
;	Function : Function to identify OR's Addressing Mode and call procedure about Addressing Mode
;
;==========55555=========<<<<<<<<<<OR>>>>>>>>>>=============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

CHK_OR PROC
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	cmp dl, 0			; DL이 0(Register Addressing Mode)인지 비교
	je WHAT_OR_REG		; DL과 0이 같으면 WHAT_OR_REC로 점프
	cmp dl, 1		      ; DL이 1(Immediate Addressing Mode)인지 비교
	JE WHAT_OR_IMM		; DL과 1이 같으면 WHAT_OR_IMM로 점프
	cmp dl, 2			; DL이 2(Direct Addressing Mode)인지 비교
	JE WHAT_OR_DIR		; DL과 2가 같으면 WHAT_OR_DIR로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
WHAT_OR_REG:
	CALL OR_REG				; OR_REC 프로시저 호출
WHAT_OR_IMM:
	CALL OR_IMM				; OR_IMM 프로시저 호출
WHAT_OR_DIR:
	CALL OR_DIR				; OF_DIR 프로시저 호출
	RET
	CHK_OR ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - OR_REG PROC
;	Function : Function to what is first Register when OR's Addressing Mode is Register Adressing Mode	
;
;====================55555=========<<<<<<<<<<OR>>>>>>>>>>===================
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

OR_REG PROC					; register
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 2비트 이동시킨다
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE WHAT_OR_REG_R0		; DL과 0이 같으면 WHAT_OR_REC_R0로 점프
	CMP DL, 1				; DL과 1을 비교한다
	JE WHAT_OR_REG_R1		; DL과 1이 같으면 WHAT_OR_REC_R1로 점프
	CMP DL, 2				; DL과 2를 비교한다
	JE WHAT_OR_REG_R2		; DL과 2가 같으면 WHAT_OR_REC_R2로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
WHAT_OR_REG_R0:
	CALL OR_REG_R0				; OR_REG_R0 프로시저 호출
WHAT_OR_REG_R1:
	CALL OR_REG_R1				; OR_REG_R1 프로시저 호출
WHAT_OR_REG_R2:
	CALL OR_REG_R2				; OR_REG_R2 프로시저 호출
	RET
OR_REG ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - OR_REG_R0 PROC
;	Function :  Function to what is second Register && Register's OR calculation 
;				when OR's Addressing Mode is Register Adressing Mode and first Register is RO	
;
;==========55555=========<<<<<<<<<<OR>>>>>>>>>>===============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

OR_REG_R0 PROC
	
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE OR_REG_R0R0			; DL과 0이 같으면 OR_REG_R0R0으로 점프
	CMP DL, 4				; DL과 4를 비교한다
	JE OR_REG_R0R1			; DL과 4가 같으면 OR_REG_R0R1으로 점프
	CMP DL, 8				; DL과 8을 비교한다
	JE OR_REG_R0R2			; DL과 8이 같으면 OR_REG_R0R2로 점프
	CMP DL, 12				; DL과 12를 비교한다
	JE OR_REG_R0AD			; DL과 12가 같으면 OR_REG_R0AD로 점프
	call ERROR_MESSAGE			; 이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
OR_REG_R0R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	OR R0, DX				; R0과 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
OR_REG_R0R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	OR R0, DX				; R0과 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
OR_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0 				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2을 DX로 이동시킨다
	OR R0, DX				; R0과 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
OR_REG_R0AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	OR MEM[BX], DX		; MEM[BX]위치에 있는 값과 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
	RET
	OR_REG_R0 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - OR_REG_R1 PROC
;	Function :  Function to what is second Register && Register's OR calculation 
;				when OR's Addressing Mode is Register Adressing Mode and first Register is R1
;
;======55555=========<<<<<<<<<<OR>>>>>>>>>>===================
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
OR_REG_R1 PROC

	
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE OR_REG_R1R0			; DL과 0이 같으면 OR_REG_R1R0으로 점프
	CMP DL, 4				; DL과 4를 비교한다
	JE OR_REG_R1R1			; DL과 4가 같으면 OR_REG_R1R1으로 점프
	CMP DL, 8				; DL과 8을 비교한다
	JE OR_REG_R1R2			; DL과 8이 같으면 OR_REG_R1R2로 점프
	CMP DL, 12				; DL과 12를 비교한다
	JE OR_REG_R1AD			; DL과 12가 같으면 OR_REG_R1AD로 점프
	call ERROR_MESSAGE		; 이외에 다른 문자를 입력했을 경우 						
							;ERRORMESSAGE 프로시저 호출
	
OR_REG_R1R0:
	CALL CHK_ZERO			; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	OR R1, DX				; R1과 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis			; A_MAC_DIS 프로시저 호출
	CALL A_WRITE			; A_WRITE 프로시저 호출
OR_REG_R1R1:
	CALL CHK_ZERO			; CHK_ZERO프로시저 호출
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	OR R1, DX				; R1과 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis			; A_MAC_DIS 프로시저 호출
	CALL A_WRITE			; A_WRITE 프로시저 호출
OR_REG_R1R2:
	CALL CHK_ZERO			; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	OR R1, DX				; R1과 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis			; A_MAC_DIS 프로시저 호출
	CALL A_WRITE			; A_WRITE 프로시저 호출
OR_REG_R1AD:
	CALL MAKE_ADDRESS		; MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC를 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	OR MEM[BX], DX			; MEM[BX]위치에 있는 값과 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis			; A_MAC_DIS 프로시저 호출
	CALL A_WRITE			; A_WRITE 프로시저 호출
	RET
	OR_REG_R1 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - OR_REG_R2 PROC
;	Function :  Function to what is second Register && Register's OR calculation 
;				when OR's Addressing Mode is Register Adressing Mode and first Register is R2	
;
;========55555=========<<<<<<<<<<OR>>>>>>>>>>=================
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

OR_REG_R2 PROC
	
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]			; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL에 있는 값을 왼쪽으로 4비트 이동시킨다

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; DL에 있는 값을 오른쪽으로 4비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE OR_REG_R2R0			; DL과 0이 같으면 OR_REG_R2R0으로 점프
	CMP DL, 4				; DL과 4를 비교한다
	JE OR_REG_R2R1			; DL과 4가 같으면 OR_REG_R2R1으로 점프
	CMP DL, 8				; DL과 8을 비교한다
	JE OR_REG_R2R2			; DL과 8이 같으면 OR_REG_R2R2로 점프
	CMP DL, 12				; DL과 12를 비교한다
	JE OR_REG_R2AD			; DL과 12가 같으면 OR_REG_R2AD로 점프
	call ERROR_MESSAGE		; 이외에 다른 문자를 입력했을 경우 						
							; ERRORMESSAGE 프로시저 호출
	
OR_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R0				; R0을 DX로 이동시킨다
	OR R2, DX				; R2와 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
OR_REG_R2R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R1				; R1을 DX로 이동시킨다
	OR R2, DX				; R2와 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
OR_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				; 0을 DX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	OR R2, DX				; R2와 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
OR_REG_R2AD:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, R2				; R2를 DX로 이동시킨다
	OR MEM[BX], DX		; MEM[BX]위치에 있는 값과 DX를 OR연산한다
	ADD PC, 4				; PC에 4를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
	RET
OR_REG_R2 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - OR_IMM PROC		
;	Function : Function to OR calculation when OR's Addressing Mode is Immediate
;
;=======55555=========<<<<<<<<<<OR>>>>>>>>>>==================
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

OR_IMM PROC					; immediate	

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_ORIMM			; 아니라면 ERROR_ORIMM로

	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 2비트 이동시킨다
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE OR_IMM_R0			; DL과 0이 같으면 OR_IMM_R0으로 점프
	CMP DL, 1				; DL과 1을 비교한다
	JE OR_IMM_R1			; DL과 1이 같으면 OR_IMM_R1으로 점프
	CMP DL, 2				; DL과 2를 비교한다
	JE OR_IMM_R2				; DL과 2가 같으면 OR_IMM_R2로 점프
	
ERROR_ORIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출

OR_IMM_R0:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	OR R0, DX				; R0과 DX를 OR연산한다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
OR_IMM_R1:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]		; MEMBX위치에 있는 값을 DX에 넣는다
	OR R1, DX				; R1과 DX를 OR연산한다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
OR_IMM_R2:
	ADD PC, 2				; PC에 2를 더한다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	OR R2, DX				; R2과 DX를 OR연산한다
	ADD PC, 2				; PC에 2를 더한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출

	RET
OR_IMM ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - OR_DIR PROC
;	Function : Function to OR calculation when OR's Addressing Mode is Direct Addressing Mode
;
;=========55555=========<<<<<<<<<<OR>>>>>>>>>>================
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

OR_DIR PROC					; direct

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_ORDIR			; 아니라면 ERROR_ORDIR로

	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 2비트 이동시킨다
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL에 있는 값을 오른쪽으로 6비트 이동시킨다
	CMP DL, 0				; DL과 0을 비교한다
	JE OR_DIR_R0				;DL과 0이 같으면 OR_DIR_R0으로 점프
	CMP DL, 1				; DL과 1을 비교한다
	JE OR_DIR_R1				;DL과 1이 같으면 OR_DIR_R1으로 점프
	CMP DL, 2				; DL과 2를 비교한다
	JE OR_DIR_R2				; DL과 2가 같으면 OR_DIR_R2로 점프
ERROR_ORDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출

OR_DIR_R0:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 이동시킨다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		       ;MEM[BX]위치에 있는 값을 DX에 넣는다
	OR R0, DX				; R0과 DX를 OR연산한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
OR_DIR_R1:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 이동시킨다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	OR R1, DX				; R1과 DX를 OR연산한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
OR_DIR_R2:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				; BX를 DX로 이동시킨다
	MOV BX, 0				; 0을 BX로 이동시킨다
	MOV BX, PC				; PC를 BX로 이동시킨다
	MOV PC, DX				; DX를 PC로 이동시킨다
	ADD PC, 2				; PC에 2를 더한다
	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		      ; MEM[BX]위치에 있는 값을 DX에 넣는다
	OR R2, DX				; R2와 DX를 OR연산한다
	call a_mac_dis				; A_MAC_DIS 프로시저 호출
	CALL A_WRITE				; A_WRITE 프로시저 호출
RET
OR_DIR ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_NOT PROC
;	Function : Function to NOT calculation
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_NOT PROC					;not 프로시저

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_NOT				; 아니라면 ERROR_NOT로

	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1				;dl의 값 왼쪽으로 2비트 이동
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				;dl의 값 왼쪽으로 6비트 이동
	CMP DL, 0				;dl값이 0인지 비교
	JE NOT_R0				;0이면 not_R0레이블로 이동
	CMP DL, 1				;dl값이 1인지 비교
	JE NOT_R1				;1이면 not_R01레이블로 이동
	CMP DL, 2				;dl값이 2인지 비교
	JE NOT_R2				;2이면 not_R02레이블로 이동
ERROR_NOT:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
NOT_R0:						;R0 레지스터 not
	NOT R0					;R0 not 수행
	mov dx, 0				;dx에 0을 넣어준다
	mov dx, r0				;dx에 r0 레지스터 넣어준다.
	shl dh, 1					
	shl dh, 1				;dh의 값 왼쪽으로 2비트 이동
	shl dh, 1
	shl dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1				;dh의 값 왼쪽으로 6비트 이동
	mov R0, dx				;dx의 값 레지스터 r0에 넣어준다.
	ADD PC, 4				;pc값 4증가 후
	call a_mac_dis				;출력
	CALL A_WRITE
NOT_R1:						;R1 레지스터 not
	NOT R1					;R1 not 수행
	mov dx, 0				;dx에 0을 넣어준다
	mov dx, r1				;dx에 r1 레지스터 넣어준다.
	shl dh, 1
	shl dh, 1				;dh의 값 왼쪽으로 2비트 이동
	shl dh, 1
	shl dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1				;dh의 값 왼쪽으로 6비트 이동
	mov R1, dx				;dx의 값 레지스터 r1에 넣어준다.
	ADD PC, 4				;pc값 4증가 후
	call a_mac_dis				;출력
	CALL A_WRITE
NOT_R2:						;R2 레지스터 not
	NOT R2					;R2 not 수행
	mov dx, 0				;dx에 0을 넣어준다
	mov dx, r2				;dx에 r2 레지스터 넣어준다.
	shl dh, 1
	shl dh, 1				;dh의 값 왼쪽으로 2비트 이동
	shl dh, 1
	shl dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1				;dh의 값 왼쪽으로 6비트 이동
	mov R2, dx				;dx의 값 레지스터 r2에 넣어준다.
	ADD PC, 4				;pc값 4증가 후
	call a_mac_dis				;출력
	CALL A_WRITE
RET
CHK_NOT ENDP
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_HLT
;	Function : Function to stop CPU
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_HLT PROC					;cpu 정지 하는 프로시저
	HLT
RET						;리턴 어드레스
CHK_HLT ENDP					;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_INC
;	Function : Function to increase value
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_INC PROC					;increment 프로시저

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_INC				; 아니라면 ERROR_INC로

	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1				;dl의 값 왼쪽으로 2비트 이동
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				;dl의 값 왼쪽으로 6비트 이동
	CMP DL, 0				;dl의 값이 0인지 비교
	JE INC_R0				;맞다면 inc_r0 레이블로 이동
	CMP DL, 1				;dl의 값이 1인지 비교
	JE INC_R1				;맞다면 inc_r1 레이블로 이동
	CMP DL, 2				;dl의 값이 2인지 비교
	JE INC_R2				;맞다면 inc_r2 레이블로 이동
ERROR_INC:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
INC_R0:
	INC R0					;r0의 값 증가
	ADD PC, 4				;pc값 +4
	call a_mac_dis				;디스플레이
	CALL A_WRITE
INC_R1:
	INC R1					;r1의 값 증가
	ADD PC, 4
	call a_mac_dis
	CALL A_WRITE
INC_R2:
	INC R2					;r2의 값 증가
	ADD PC, 4
	call a_mac_dis
	CALL A_WRITE
RET						;리턴 어드레스
CHK_INC ENDP					;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_DEC
;	Function : Function to decrease value
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_DEC PROC					;decrement 프로시저
	
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_DEC				; 아니라면 ERROR_DEC로

	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1				;dl의 값 왼쪽으로 2비트 이동
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				;dl의 값 왼쪽으로 6비트 이동
	CMP DL, 0				;dl의 값이 0인지 비교
	JE DEC_R0				;맞다면 dec_r0 레이블로 이동
	CMP DL, 1				;dl의 값이 1인지 비교
	JE DEC_R1				;맞다면 dec_r1 레이블로 이동
	CMP DL, 2				;dl의 값이 2인지 비교
	JE DEC_R2				;맞다면 dec_r2 레이블로 이동
ERROR_DEC:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출	
DEC_R0:
	DEC R0					;r0의 값을 감소시킨다
	ADD PC, 4				;pc 값 +4
	call a_mac_dis				;display
	CALL A_WRITE
DEC_R1:
	DEC R1					;r1의 값을 감소시킨다
	ADD PC, 4
	call a_mac_dis
	CALL A_WRITE
DEC_R2:
	DEC R2					;r2의 값을 감소시킨다
	ADD PC, 4
	call a_mac_dis
	CALL A_WRITE
RET						;리턴 어드레스
CHK_DEC ENDP					;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_CMP
;	Function : Function to compare A with B(ex. CMP A, B)
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_CMP PROC					;명령어가 cmp(101010)인지 확인
	shr dl, 1					
	shr dl, 1					;dl 왼쪽으로 2비트 이동
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1					;dl 왼쪽으로 4비트 이동
	cmp dl, 0				;dl의 값이 0인지 비교
	je WHAT_CMP_REG			;맞다면WHAT_CMP_REG 레이블로이동
	cmp dl, 1	;immediate		;dl 값 1인지 비교
	JE WHAT_CMP_IMM			;맞다면WHAT_CMP_IMM 레이블로이동
	cmp dl, 2	;direct			;dl 값 2인지 비교
	JE WHAT_CMP_DIR			;맞다면WHAT_CMP_DIR레이블로이동
	call ERROR_MESSAGE			;이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
WHAT_CMP_REG:
	CALL CMP_REG
WHAT_CMP_IMM:
	CALL CMP_IMM
WHAT_CMP_DIR:
	CALL CMP_DIR
RET						;리턴 어드레스
CHK_CMP ENDP					;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_CMP
;	Function : Function to divide CMP operation what addressing mode implements.
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_REG PROC					;register addressing mode 구분
	MOV DX, 0
	MOV DX, MEM[BX]		      ;mem[bx] 위치에 있는 값을 dx에 넣는다.
	
	SHR DL, 1		
	SHR DL, 1				;dl값 왼쪽으로 2비트 이동
	SHR DL, 1
	SHR DL, 1				;dl값 왼쪽으로 2비트 이동
	CMP DL, 0				;dl이 0인지 비교
	JE WHAT_CMP_REG_R0			;0이라면 register r0의 cmp로 간다
	CMP DL, 1				;dl이 1인지 비교
	JE WHAT_CMP_REG_R1			;1이라면 register r1의 cmp로 간다
	CMP DL, 2				;dl이 2인지 비교
	JE WHAT_CMP_REG_R2			;2이라면 register r2의 cmp로 간다
	call ERROR_MESSAGE			;이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
WHAT_CMP_REG_R0:
	CALL CMP_REG_R0			; CMP_REG_R0프로시저 호출
WHAT_CMP_REG_R1:
	CALL CMP_REG_R1			; CMP_REG_R1프로시저 호출
WHAT_CMP_REG_R2:	
	CALL CMP_REG_R2			; CMP_REG_R2프로시저 호출
RET						;리턴 어드레스
CMP_REG ENDP					;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CMP_REG_R0
;	Function : Function to implements Register addressing mode R0 at CMP
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_REG_R0 PROC			;register addressing mode 중 r0 프로시저
	
	MOV DX, 0
	MOV DX, MEM[BX]			;mem[bx]위치의 값을 dx에 넣어준다.
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				;dl값 왼쪽으로 4비트 이동

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				;dl값 오른쪽으로 4비트 이동
	CMP DL, 0				;dl이 0인지 비교
	JE CMP_REG_R0R0			;맞다면 r0r0레이블로 이동
	CMP DL, 4				;dl이 4인지 비교
	JE CMP_REG_R0R1			;맞다면 r0r1레이블로 이동
	CMP DL, 8				;dl이 8인지 비교
	JE CMP_REG_R0R2			;맞다면 r0r2레이블로 이동
	CMP DL, 12				;dl이 12인지 비교
	JE CMP_REG_R0AD			;맞다면 r0AD레이블로 이동
	call ERROR_MESSAGE			;이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
	
CMP_REG_R0R0:	
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출	
	MOV DX, 0
	MOV DX, R0				;r0의 값을 dx에 넣고
	ADD PC, 4				;pc값 +4
	CMP R0, DX				;dx의 값과 r0 비교
	JE CP_PSW00				;같다면 psw00으로 이동
	call a_mac_dis				;display
	CALL A_WRITE
CP_PSW00:
	CALL P_PSW				;psw에 1 옮기는 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE
CMP_REG_R0R1:	
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출			
	MOV DX, 0				
	MOV DX, R1				;r1의 값을 dx에 넣고
	ADD PC, 4				;pc값 +4
	CMP R0, DX				;dx의 값과 r1 비교
	JE CP_PSW01				;같다면 psw01으로 이동
	call a_mac_dis				;display
	CALL A_WRITE
CP_PSW01:
	CALL P_PSW				;p_psw 프로시저 호출
	call a_mac_dis
	CALL A_WRITE
CMP_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0
	MOV DX, R2				;r2의 값을 dx에 넣고
	ADD PC, 4				;pc값 +4
	CMP R0, DX				;dx의 값과 r2 비교
	JE CP_PSW02				;같다면 psw02으로 이동
	call a_mac_dis				;display
	CALL A_WRITE
CP_PSW02:
	CALL P_PSW				;p_psw 프로시저 호출
	call a_mac_dis
	CALL A_WRITE
CMP_REG_R0AD:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				;bx에 0 넣어줌
	MOV DX, 0				;dx에 0 넣어줌
	MOV BX, PC				;pc값 bx에 이동
	ADD PC, 4				;pc+4
	MOV DX, R0				;r0의 값 dx에 넣는다
	CMP MEM[BX], DX			;mem[bx]위치의 값과 dx가 같은지 비교
	JE CP_PSW0AD				;같다면 cp_psword로 이동
	call a_mac_dis
	CALL A_WRITE
CP_PSW0AD:					
	CALL P_PSW				;psw에 1 이동시키는 프로시저 호출
	call a_mac_dis				;display 
	CALL A_WRITE				;write procedure
	RET					;리턴 어드레스
	CMP_REG_R0 ENDP			;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CMP_REG_R1
;	Function : Function to implements Register addressing mode R1 at CMP
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_REG_R1 PROC			;R1레지스터 register addressing mode
	
	MOV DX, 0				;DX를 0으로 초기화
	MOV DX, MEM[BX]		;bx의 메모리 주소가 가리키는 값을 dx에 넣고
	SHL DL, 1			;DL의 비트를 왼쪽으로 1비트씩 이동시킨다.
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1

	SHR DL, 1	       ;DL의 비트를 오른쪽으로 1비트씩 이동시켜 제자리로 복귀
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				;DL이 0인가
	JE CMP_REG_R1R0			;맞다면CMP_REG_R1R0의레이블로이동
	CMP DL, 4				;DL이 4인가
	JE CMP_REG_R1R1			;맞다면CMP_REG_R1R1의레이블로이동
	CMP DL, 8				;DL이 8인가
	JE CMP_REG_R1R2			;맞다면CMP_REG_R1R2의레이블로이동
	CMP DL, 12				;DL이 12인가
	JE CMP_REG_R1AD			;맞다면CMP_REG_R1AD의레이블로이동
	call ERROR_MESSAGE			;이외에 다른 문자를 입력했을 경우 						;ERRORMESSAGE 프로시저 호출
CMP_REG_R1R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				;dx 0으로 초기화
	MOV DX, R0				;dx에 R0값 넣음
	ADD PC, 4				;pc+4 증가
	CMP R1, DX				;dx값 r1과 비교
	JE CP_PSW10				;같다면 CP_PSW10레이블로 이동
	call a_mac_dis				;macro display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSW10:
	CALL P_PSW				;psw에 1넣음
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CMP_REG_R1R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				;dx 0으로 초기화
	MOV DX, R1				;dx에 R1값 넣음
	ADD PC, 4				;pc+4 증가
	CMP R1, DX				;R1과 DX 비교
	JE CP_PSW11				;같으면 CP_PSW11레이블로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSW11:
	CALL P_PSW				
	call a_mac_dis
	CALL A_WRITE				;simulator command 입력 받음
CMP_REG_R1R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				;dx 0으로 초기화
	MOV DX, R2				;dx에 R2값 넣음
	ADD PC, 4				;pc+4 증가
	CMP R1, DX				;R1과 DX 비교해
	JE CP_PSW12				;같으면 CP_PSW12 레이블로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSW12:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CMP_REG_R1AD:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				;BX 0으로 초기화
	MOV DX, 0				;dx 0으로 초기화
	MOV BX, PC				;PC값 BX에 복사
	ADD PC, 4				;pc+4 증가
	MOV DX, R1				;DX에 R1값 복사
	CMP MEM[BX], DX			;bx의 메모리가 가리키는 값과 dx비교
	JE CP_PSW1AD				;같으면 CP_PSW1AD레이블로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSW1AD:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
	RET					;리턴 어드레스
	CMP_REG_R1 ENDP			;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CMP_REG_R2
;	Function : Function to implements Register addressing mode R2 at CMP
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_REG_R2 PROC				;R2 register 프로시저

	MOV DX, 0				;dx 0으로 초기화
	MOV DX, MEM[BX]			;dx에 bx의 메모리가 가리키는 값 복사
	SHL DL, 1				;DL의 비트값 왼쪽으로 1씩 이동
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1

	SHR DL, 1				;DL 비트값 다시 오른쪽으로 1씩 이동
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				;0인지 판단
	JE CMP_REG_R2R0			;register R2R0레이블로 이동
	CMP DL, 4				;4인지 판단
	JE CMP_REG_R2R1			;register R2R1레이블로 이동
	CMP DL, 8				;8인지 판단
	JE CMP_REG_R2R2			;register R2R2레이블로 이동
	CMP DL, 12				;12인지 판단
	JE CMP_REG_R2AD			;register R2AD레이블로 이동
	call ERROR_MESSAGE			;이외에 다른 문자를 입력했을 경우 						; ERRORMESSAGE 프로시저 호출
	
CMP_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				;dx 0으로 초기화
	MOV DX, R0				;dx에 r0값 복사
	ADD PC, 4				;pc+4 증가
	CMP R2, DX				;R2값과 dx 비교
	JE CP_PSW20				;같으면 CP_PSW20 레이블로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSW20:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CMP_REG_R2R1:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX, 0				;dx 0으로 초기화
	MOV DX, R1				;DX에 R1값 복사
	ADD PC, 4				;pc+4 증가
	CMP R2, DX				;dx와 r2값 비교

	JE CP_PSW21
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSW21:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CMP_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO프로시저 호출
	MOV DX,0				;dx 0으로 초기화
	MOV DX, R2				;DX에 R2값 복사
	ADD PC, 4				;pc+4 증가
	CMP R2, DX				;dx와 r2값 비교
	JE CP_PSW22				;같으면 CP_PSW22레이블로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSW22:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CMP_REG_R2AD:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS 프로시저 호출
	MOV BX, 0				;bx 0으로 초기화
	MOV DX, 0				;dx 0으로 초기화
	MOV BX, PC				;bx에 pc값 복사
	ADD PC, 4				;pc+4 증가
	MOV DX, R2				;dx에 r2값 복사
	CMP MEM[BX], DX			;dx와 bx의 주소가 가리키는 값 비교
	JE CP_PSW2AD				;같으면 CP_PSW2AD 레이블로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSW2AD:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
	RET					;리턴 어드레스
CMP_REG_R2 ENDP				;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CMP_IMM
;	Function : Function to implements Register addressing mode R1 at CMP
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_IMM PROC					;immediate	

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_CMPIMM			; 아니라면 ERROR_CMPIMM로

	MOV DX, 0				;DX를 0으로 초기화
	MOV DX, MEM[BX]			;dx에 bx의 주소가 가리키는 값 복사
	SHL DL, 1				;dl 비트 왼쪽으로 한 칸씩 이동
	SHL DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				;dl이 0인지 비교
	JE CMP_IMM_R0				;0이라면 CMP_IMM_R0레이블로 이동
	CMP DL, 1				;1이라면
	JE CMP_IMM_R1				;0이라면 CMP_IMM_R1레이블로 이동
	CMP DL, 2				;dl 2인지 비교
	JE CMP_IMM_R2				;0이라면 CMP_IMM_R2레이블로 이동
ERROR_CMPIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
CMP_IMM_R0:
	ADD PC, 2				;pc+2 증가
	MOV BX, PC				;bx에 pc값 복사
	MOV DX, MEM[BX]			;dx에 bx의 주소가 가리키는 값 복사
	ADD PC, 2				;pc+2 증가
	CMP R0, DX				;r0과 dx 비교
	JE CP_PSW0				;같다면 CP_PSW0레이블로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSW0:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음

CMP_IMM_R1:
	ADD PC, 2				;pc+2 증가
	MOV BX, PC				;bx에 pc값 복사
	MOV DX, MEM[BX]			;dx에 bx의 주소가 가리키는 값 복사
	ADD PC, 2				;pc+2 증가
	CMP R1, DX				;R1과 dx값 비교
	JE CP_PSW1				;같다면 CP_PSW1로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSW1:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CMP_IMM_R2:
	ADD PC, 2				;pc+2 증가
	MOV BX, PC				;bx에 pc값 복사
	MOV DX, MEM[BX]			;dx에 bx의 주소가 가리키는 값 복사
	ADD PC, 2				;pc+2 증가
	CMP R2, DX				;R2과 dx값 비교
	JE CP_PSW2				;같다면 CP_PSW2로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSW2:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음

	RET					;리턴 어드레스
CMP_IMM ENDP					;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CMP_DIR
;	Function : Function to Direct address;
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_DIR PROC					;direct

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_CMPDIR			; 아니라면 ERROR_CMPDIR로
	
	MOV DX, 0				;DX를 0으로 초기화
	MOV DX, MEM[BX]			;dx에 bx의 주소가 가리키는 값 복사
	SHL DL, 1				;dl 비트를 왼쪽으로 한 칸씩 이동
	SHL DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				;dl이 0인지 비교
	JE CMP_DIR_R0				;같다면 CMP_DIR_R0레이블로 이동
	CMP DL, 1				;DL이 1인지 비교
	JE CMP_DIR_R1				;같다면 CMP_DIR_R1레이블로 이동
	CMP DL, 2				;DL이 2인지 비교
	JE CMP_DIR_R2				;같다면 CMP_DIR_R2레이블로 이동
	ERROR_CMPDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
CMP_DIR_R0:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				;DX에 BX값 복사
	MOV BX, 0				;bx 0으로 초기화
	MOV BX, PC				;bx에 pc값 복사
	MOV PC, DX				;pc에 dx값 복사
	ADD PC, 2				;PC+2 증가
	MOV DX, 0				;dx 0으로 초기화
	MOV DX, MEM[BX]			;dx에 bx의 주소가 가리키는 값 복사
	CMP R0, DX				;R0과 dx값 비교
	JE CP_PSWD0				;같다면 CP_PSWD0레이블로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSWD0:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CMP_DIR_R1:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				;bx값 dx에 복사
	MOV BX, 0				;bx 0으로 초기화
	MOV BX, PC				;bx에 pc값 복사
	MOV PC, DX				;pc에 dx값 복사
	ADD PC, 2				;pc+2 증가
	MOV DX, 0				;DX 0으로 초기화
	MOV DX, MEM[BX]			;dx에 bx의 주소가 가리키는 값 복사
	CMP R1, DX				;R1과 DX값 비교
	JE CP_PSWD1				;같다면 CP_PSWD1레이블로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSWD1:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CMP_DIR_R2:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS 프로시저 호출
	MOV DX, BX				;dx에 bx값 복사
	MOV BX, 0				;bx 초기화
	MOV BX, PC				;bx에 pc값 복사
	MOV PC, DX				;pc에 dx값 복사
	ADD PC, 2				;pc+2 증가
	MOV DX, 0				;dx초기화
	MOV DX, MEM[BX]			;dx에 bx의 주소가 가리키는 값 복사
	CMP R2, DX				;r1와 dx값 비교
	JE CP_PSWD2				;같으면 CP_PSWD2 레이블로 이동
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
CP_PSWD2:
	CALL P_PSW				;P_PSW 프로시저 호출
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
RET						;리턴 어드레스
CMP_DIR ENDP					;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - P_PSW
;	Function : Function to add 1 at PSW;
;
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
P_PSW PROC
	MOV PSW, 1				;psw에 1을 넣는다.
RET						;리턴 어드레스
P_PSW ENDP					;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_BEQ
;	Function : Function to check PSW number and determine what you want simulator command
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_BEQ PROC

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_BEQ				; 아니라면 ERROR로
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHR DL, 1				;DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_BEQ				; 아니라면 ERROR_BEQ로
	JMP COMPARE_PSW			; 맞으면 COMPARE_PSW로 이동

ERROR_BEQ:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
COMPARE_PSW:
	CMP PSW, 1				;PSW가 1인지 비교
	JE PSW_1				;맞다면 PSW_1로 이동
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				;display
	CALL A_WRITE				; simulator command 입력 받음
PSW_1:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS 프로시저 호출
	MOV PSW, 0				;PSW에 0의 값 넣어줌
	call a_mac_dis				;display
	CALL A_WRITE				; simulator command 입력 받음
RET						;리턴 어드레스
CHK_BEQ ENDP					;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_SHR
;	Function : Function to move a bit left and rigth and then, check the number to decide on direction
;
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_SHR PROC				

	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, MEM[BX]			; MEM[BX]를 DX로
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_SHR				; 아니라면 ERROR_SHR로

	MOV DX, 0				; 0을 DX로 이동시킨다
	MOV DX, MEM[BX]		; MEM[BX]위치에 있는 값을 DX에 넣는다
	SHL DL, 1	
	SHL DL, 1			; DL에 있는 값을 왼쪽으로 2비트 이동시킨다
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				;DL비트 값 오른쪽으로 한 비트씩 이동
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				;이동한 후에 DL값이 0인지 확인
	JE SHR_R0				;맞다면 SHR_R0 레이블 이동
	CMP DL, 1				;이동한 후에 DL값이 1인지 확인
	JE SHR_R1				;맞다면 SHR_R1 레이블 이동
	CMP DL, 2				;이동한 후에 DL값이 2인지 확인
	JE SHR_R2				;맞다면 SHR_R2 레이블 이동
ERROR_SHR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE프로시저 호출
SHR_R0:
	ADD PC, 2				;pc+2 증가
	MOV BX, PC				;bx에 pc값 복사
	MOV DX, 0				;dx 0으로 초기화
	MOV DX, MEM[BX]			;dx에 bx의 주소가 가리키는 값 복사
	MOV CX, DX				;CX에 DX값 복사(루프 횟수)
	SHR_LP0:				
	SHR R0, 1				;R0 비트값 한 칸 오른쪽으로 이동
	LOOP SHR_LP0				;SHR_LP0 레이블 루프 돈다
	ADD PC, 2				;pc+2 증가
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
SHR_R1:
	ADD PC, 2				;pc+2 증가
	MOV BX, PC				;bx에 pc값 복사
	MOV DX, 0				;dx 0으로 초기화
	MOV DX, MEM[BX]			;dx에 bx의 주소가 가리키는 값 복사
	MOV CX, DX				;CX에 DX값 복사(루프 횟수)
	SHR_LP1:
	SHR R1, 1				;R1 비트값 한 칸 오른쪽으로 이동
	LOOP SHR_LP1				;SHR_LP1 레이블 루프 돈다
	ADD PC, 2				;pc+2 증가
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
SHR_R2:
	ADD PC, 2				;pc+2 증가
	MOV BX, PC				;bx에 pc값 복사
	MOV DX, 0				;dx 0으로 초기화
	MOV DX, MEM[BX]			;dx에 bx의 주소가 가리키는 값 복사
	MOV CX, DX				;CX에 DX값 복사(루프 횟수)
	SHR_LP2:
	SHR R2, 1				;R2 비트값 한 칸 오른쪽으로 이동
	LOOP SHR_LP2				;SHR_LP2 레이블 루프 돈다
	ADD PC, 2				;pc+2 증가
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command 입력 받음
RET						;리턴 어드레스
CHK_SHR ENDP					;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - JUDGE_ADD
;	Function : Function to add right ASKII to make chracter type integer
;
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
JUDGE_ADD PROC				;더하는거
CMP DL, 10					;DL이 10인지 비교
JNL HEX_ADD				;10이상인 경우에 HEX_ADD레이블로 이동
JMP A_CP_DE					;10이하일 경우에 A_CP_DE로 점프
HEX_ADD:					
	ADD DL, 55			;DL에 55를 더해준다(아스키 코드 값 A-10=55)
	JMP EN_A				;EN_A로 점프
A_CP_DE:		
	ADD DL, 30H			;DL에 30H 더해준다(아스키 코드 값 0=30H)
EN_A:
	RET					;리턴 어드레스
JUDGE_ADD ENDP				;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - JUDGE_SUB
;	Function : Function to subtract right ASKII to make integer
;	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
JUDGE_SUB PROC				;빼는거
CMP AL, 61H					;AL과 61H 비교
JNL HEX_SUB					;61H보다 크다면 HEX_SUB로 넘어간다
JMP S_CP_DE					;S_CP_DE 레이블로 점프
HEX_SUB:
	SUB AL, 87			;AL-87(61H부터 소문자 영어~ 이므로 					        ;예를들어 a-87=10이 나오도록, 87을 빼준다)
	JMP EN_S				;EN_S레이블로 점프
S_CP_DE:
	SUB AL, 30H		;61h보다 작다면 AL-30H(0의 아스키코드값이 30H)
EN_S:
	RET					;리턴 어드레스
JUDGE_SUB ENDP				;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - ADDRESS_PC_MAKE
;	Function : Function to make PC number to work to address
;
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
ADDRESS_PC_MAKE PROC	
	mov ax, 0				;ax 0으로 초기화
	mov pc, 0				;pc 0으로 초기화
	MOV AL, ADDRESS[0]			;al에 address[0]값 넣어준다
	SUB AL, 30H		;al-30h(아스키코드 0값 빼 정수값으로 만들어준다)
	ADD PC, AL				;pc+AL 증가
	
	SHL PC, 1				;pc 비트값 왼쪽으로 1만큼 이동
	SHL PC, 1
	SHL PC, 1
	SHL PC, 1
	
	mov ax, 0				;ax 0으로 초기화
	MOV AL, ADDRESS[1]			;al에 address[1] 넣어준다.
    SUB AL, 30H		;al-30h(아스키코드 0값 빼 정수값으로 만들어준다)
	ADD PC, AL				;pc+AL 증가
	SHL PC, 1				;pc 비트값 왼쪽으로 1만큼 이동
	SHL PC, 1
	SHL PC, 1
	SHL PC, 1
	
	mov ax, 0				;ax 0으로 초기화

	MOV AL, ADDRESS[2]   			;al에 address[2] 넣어준다.
    SUB AL, 30H		;al-30h(아스키코드 0값 빼 정수값으로 만들어준다)
	ADD PC, AL				;pc+AL 해준다.
RET						;리턴 어드레스
ADDRESS_PC_MAKE ENDP			;프로시저 종료
;----------------------------------------------------------------------------
;	PROCEDURE NAME - MAKE_ADDRESS
;	Function : Function to make address 
;
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
MAKE_ADDRESS PROC
	ADD PC, 2				;pc+2 증가
	MOV BX, PC				;bx에 pc값 복사
	MOV DX, MEM[BX]		;bx의 메모리가 가리키는 값을 dx에 복사
	MOV ADDRESS,0				;address에 0 이동
	ADD DH, 30H				;dh+30h을 dh에 넣는다(아스키코드값 0						;을 더해줘 문자로 만들어준다)
	MOV ADDRESS[0],DH			;address[0]에 dh의 값을 넣는다
	SHR DL, 1			;dl의 비트값을 오른쪽으로 1비트씩 이동
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	ADD DL, 30H				;dl에 30h를 더해준다.
	MOV ADDRESS[1],DL			;address[1]에 문자의 수를 넣어준다.
	MOV DX, MEM[BX]		;bx의 메모리가 가리키는 값을 dx에 복사
	SHL DL, 1				;dl비트값 왼쪽으로 1비트씩 이동
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	ADD DL, 30H				;dl에 30h를 더한 값을 넣어준다
	MOV ADDRESS[2],DL			;address[2]에 그 값을 복사한다.
	
	CALL ADDRESS_PC_MAKE
	RET					;리턴 어드레스
	MAKE_ADDRESS ENDP			;프로시저 종료

;----------------------------------------------------------------------------
;	PROCEDURE NAME - u_write PROC
;	Function : Function to distinguish what is written on dosbox	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;      Creation Date : Dec 08, 2016.12.08
;----------------------------------------------------------------------------
u_write PROC
	MOV DX,OFFSET PROM			; '>' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
   
	MOV AH, 01H				; 문자 입력을 하는 FUNCTION(1)
	INT 21H					; 인터럽트


	cmp al, 'i'				; 입력된 문자가 'i'인지 아닌지 비교한다
	je u_i					; 입력된 문자가 'i'이면 u_i로
	cmp al, 'c'			; 입력된 문자가 'c'인지 아닌지 비교한다
	je u_c					; 입력된 문자가 'c'이면 u_c로
	cmp al, 'a'			; 입력된 문자가 'a'인지 아닌지 비교한다
	je u_a					; 입력된 문자가 'a'이면 a_write로
	call u_write			; 이동되지 않았다면 다시 u_write 프로시저 호출
u_i:
	call i_mic_interrupt			; i_mic_interrupt프로시저 호출	
u_c:
	call c_mic_con				; c_mic_con프로시저 호출
u_a:
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	call a_write				; a_write 프로시저 호출
RET
u_write ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - c_mic_con proc
;	Function : Function to call procedure according to instruction code
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Dec 08, 2016.12.08
;----------------------------------------------------------------------------

c_mic_con	PROC				;<<c를 입력했을때의 프로시저()>>
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	
	MOV DX, OFFSET uMAR_R		; 'mar<-'를 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
    INT 21H					; 인터럽트
    mov bx, 0					; BX를 0으로 초기화
    mov bx, pc					; PC를 BX로 MOV
	CALL show				; SHOW 프로시저 호출
	
	MOV DX, OFFSET COMA			; ','를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	MOV DX, OFFSET uPC_R	; 'pc<-'를 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	
	add pc, 4				; PC = PC + 4
	mov bx, 0				; BX를 0으로 초기화
	mov bx, pc				; PC를 BX로 MOV
	CALL show				; SHOW 프로시저 호출

	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	
	sub pc, 4				; PC = PC - 4

	MOV DX,OFFSET PROM			; '>' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
   
	MOV AH, 01H				; 문자 입력을 하는 FUNCTION(1)
	INT 21H					; 인터럽트

	cmp al, 'c'			; 입력된 문자가 'c'인지 아닌지 비교한다
	je c_ir					; 입력된 문자가 'c'이면 u_c로
	call u_write				; U_WRITE 프로시저 호출
RET
c_mic_con	ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - c_ir proc
;	Function : Function to put the instruction in Instruction Register
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Dec 08, 2016.12.08
;----------------------------------------------------------------------------

c_ir PROC
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	
	MOV DX, OFFSET uIR_R			; 'ir<-' 출력
	MOV AH, 09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	
	CALL A_MAC_CON_PRINT			; A_MAC_CON_PRINT프로시저 호출
	ADD PC, 2				; PC = PC +2
	CALL A_MAC_CON_PRINT			; A_MAC_CON_PRINT프로시저 호출
	SUB PC, 2				; PC = PC - 2

	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	
	MOV DX,OFFSET PROM			; '>' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	MOV AH, 01H				; 문자 입력을 하는 FUNCTION(1)
	INT 21H					; 인터럽트

	cmp al, 'c'			; 입력된 문자가 'c'인지 아닌지 비교한다
	je c_marmdr				; 입력된 문자가 'c'이면 u_c로
	call u_write				; U_WRITE 프로시저 호출
RET
c_ir ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - c_marmdr proc
;	Function : Function to load the Mar with the address of the operand and store the content of register
;				to the operand address
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Dec 08, 2016.12.08
;----------------------------------------------------------------------------

c_marmdr PROC
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트

	MOV DX, OFFSET uMAR_R		; 'mar<-' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	ADD PC, 2				; PC = PC + 2
	CALL A_MAC_CON_PRINT			; A_MAC_CON_PRINT프로시저 호출
	SUB PC, 2				; PC = PC - 2

	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	
	MOV DX, OFFSET uMDR_R		;'mdr<-' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	mov bx, 0				; BX를 0으로 초기화
	mov dx, 0				; DX를 0으로 초기화
	MOV bx, PC				; PC를 BX로 MOV
	mov dx, mem[bx]			; MEM[BX]를 DX로 MOV

	SHL DL, 1				; DL에 있는 값을 왼쪽으로 2비트 이동
	SHL DL, 1
	
	SHR DL, 1			       ; DL에 있는 값을 오른쪽으로 6비트 이동
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1

	CMP DL, 0				; DL과 0을 비교
	je insert_r0			; DL과 0이 같으면 INSERT_R0으로 점프
	CMP DL, 1	;r1			; DL과 1을 비교
	je insert_r1			; DL과 1이 같으면 INSERT_R0으로 점프
	CMP DL, 2	;r2			; DL과 2을 비교
	je insert_r2			; DL과 2이 같으면 INSERT_R0으로 점프

insert_r0:
	MOV DX, OFFSET R0_R			; 'R0' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	CALL u_write				; U_WRITE 프로시저 호출
insert_r1:
	MOV DX, OFFSET R1_R			; 'R1' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	CALL u_write				; U_WRITE 프로시저 호출
insert_r2:
	MOV DX, OFFSET R2_R			; 'R2' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	CALL u_write				; U_WRITE 프로시저 호출
RET
c_marmdr ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - i_mic_interrupt PROC
;	Function : Function to trigger an interrupt/ load the cpu's registers into the interrupt
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Dec 08, 2016.12.08
;----------------------------------------------------------------------------

i_mic_interrupt PROC
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트

	MOV DX, OFFSET uIST_R			; 'ist<-' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV BX, 0				; BX를 0으로 초기화
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, R0				; R0를 DX로 MOV
	MOV STKM[BX], 0			; STKM[BX]를 0으로 초기화
	MOV STKM[BX], DX			; STKM[BX]에 DX를 MOV
	MOV DX, OFFSET R0_R			; 'R0' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	
	ADD BX, 1				; BX = BX + 1
	MOV DX, OFFSET uIST_R			;'ist<-' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, R1				; R1을 DX로 MOV
	MOV STKM[BX], 0			; STKM[BX]를 0으로 초기화
	MOV STKM[BX], DX			; STKM[BX]에 DX를 MOV
	MOV DX, OFFSET R1_R			; 'R1' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트

	ADD BX, 1				; BX = BX + 1
	MOV DX, OFFSET uIST_R			;'ist<-' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, R2				; R2을 DX로 MOV
	MOV STKM[BX], 0			; STKM[BX]를 0으로 초기화
	MOV STKM[BX], DX			; STKM[BX]에 DX를 MOV
	MOV DX, OFFSET R2_R			; 'R2' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트

	ADD BX, 1				; BX = BX + 1
	MOV DX, OFFSET uIST_R			; 'ist<-' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, PSW				; PSW를 DX로 MOV
	MOV STKM[BX], 0			; STKM[BX]를 0으로 초기화
	MOV STKM[BX], DX			; STKM[BX]에 DX를 MOV
	MOV DX, OFFSET PSW_R			; 'PSW' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트

	ADD BX, 1				; BX = BX + 1
	MOV DX, OFFSET uIST_R			; 'ist<-' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DX, 0				; DX를 0으로 초기화
	MOV DX, PC				; PC를 DX로 MOV
	MOV STKM[BX], 0			; STKM[BX]를 0으로 초기화
	MOV STKM[BX], DX			; STKM[BX]에 DX를 MOV
	MOV DX, OFFSET PC_R			; 'PC' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트

	MOV DX, 0				; DX를 0으로 초기화
	mov dx, bx				; BX를 DX로 MOV
	CALL JUDGE_ADD			; JUDGE_ADD 프로시저 호출
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	
	MOV DX,OFFSET PROM			; '>' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
   
	MOV AH, 01H				; 문자 입력을 하는 FUNCTION(1)
	INT 21H					; 인터럽트

	cmp al, 'r'			       ; 입력된 문자가 'r'인지 아닌지 비교한다
	je r_mic_return				; 입력된 문자가 'r'이면 r_mic_return로
	
	call u_write				; U_WRITE 프로시저 호출
RET
i_mic_interrupt	 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - r_mic_return  PROC
;	Function : Function to return from interrupt, execute normal sequence
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Dec 08, 2016.12.08
;----------------------------------------------------------------------------

r_mic_return PROC
	MOV CX, BX				; BX를 CX로 MOV
P1:
	MOV BX, CX				; CX를 BX로 MOV
	MOV STKM[BX],0				; STKM[BX]를 0으로 초기화
	LOOP P1				; P1을 CX만큼 LOOP 

	ADD PC, 4				; PC = PC + 4
	
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	
	MOV DX, OFFSET uMAR_R		; 'mar<-' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	mov bx, 0				; BX를 0으로 초기화
    mov bx, pc					; PC를 BX로 MOV
	CALL show				; SHOW 프로시저 호출
	
	MOV DX, OFFSET COMA			; ',' 출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트

	MOV DX, OFFSET uPC_R	;'PC<-'출력
	MOV AH,09H				; 문자열 출력을 하는 FUNCTION(9)
	INT 21H					; 인터럽트
	
	add pc, 4				; PC = PC + 4
	mov bx, 0				; BX를 0으로 초기화
    mov bx, pc					; PC를 BX로 MOV
	CALL show				; SHOW 프로시저 호출

	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	CALL u_write				; U_WRITE 프로시저 호출
RET 
r_mic_return ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_ZERO  PROC
;	Function : Function to compare whether blank is sharp or not 
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Dec 17, 2016.12.17
;----------------------------------------------------------------------------


CHK_ZERO PROC	
	ADD PC, 2				; PC = PC + 2
	MOV BX, PC				; PC를 BX로 MOV
	MOV DX, MEM[BX]			; MEM[BX]를 DX로 MOV
	CMP DH, 0				; DH가 0인지 아닌지 비교
	JNE ERROR_ZERO			; 아니라면 ERROR_ZERO로
	CMP DL, 0				; DL이 인지 아닌지 비교
	JNE ERROR_ZERO			; 아니라면 ERROR_ZERO로	
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				; DL이 0인지 아닌지 비교
	JNE ERROR_ZERO			; 아니라면 ERROR_ZERO로
	SUB PC, 2				; PC = PC - 2
	MOV BX, PC
	MOV DX, 0				; DX를 0으로 초기화
	JMP SHARP_EN
ERROR_ZERO:
	CALL ERROR_MESSAGE		; ERROR_MESSAGE프로시저 호출
SHARP_EN:
RET
CHK_ZERO ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - ERROR_MESSAGE  PROC
;	Function : Function to print error message
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Dec 17, 2016.12.17
;----------------------------------------------------------------------------

	ERROR_MESSAGE PROC
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	MOV DX, OFFSET ERRORMESSAGE		
	MOV AH, 09H
	INT 21H
	MOV DL, 0AH				; 줄바꿈	
	MOV AH, 2				; 출력을 위한 FUNCTION(2)
	INT 21H					; 인터럽트
	CALL A_WRITE
	RET
	ERROR_MESSAGE ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - EN  PROC
;	Function : Function to exit the program
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------

EN proc
   MOV AH, 4CH				; 종료를 위한 FUNCTION
   INT 21H					; 인터럽트
   ret
en endp

MAIN ENDS
END START