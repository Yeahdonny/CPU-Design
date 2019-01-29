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
   MICRO DB "MICRO",'$'			; u �Է½� MICRO
   AMACRO DB "MACRO",'$'		; a �Է½� MACRO
   ERRORMESSAGE DB ">>>>!!!ERROR!!!<<<<",'$' ; ���� �޽���

   R0 dw 0					; �ʱ� RO�� ��
   R1 dw 0					; �ʱ� R1�� ��
   R2 dw 0					; �ʱ� R2�� ��
   PSW DW 0					; �ʱ� PSW�� �� (Flag)
   PC DW 0					; �ʱ� PC(Program Counter)�� ��

   MEM Dw 4096 DUP (?)			; ���Ƿ� ���� �����ϱ� ���� �迭 ����

   VAR_D DW 1					; ������ ���� VAR_D=1����

   PROM DB ">" ,'$'				; '>' ����� ����
   EQUAL DB " = ",'$'			; ' = ' ����� ����
    
   R0_R DB "R0$"				; Display�� R0�� ���� ����ϱ� ����
   R1_R DB "R1$"				; Display�� R1�� ���� ����ϱ� ����
   R2_R DB "R2$"				; Display�� R2�� ���� ����ϱ� ����
   PC_R DB "pc$"				; Display�� PC�� ���� ����ϱ� ����
   PSW_R DB "psw$"				; Display�� PSW�� ���� ����ϱ� ����
   COMA DB ", $"				; ',' ����� ����

   PREVAL DB 10 dup (?)			; OPCODE�� ����
   IME DB 10 DUP (?)				; �������� ���� ����
   ADDRESS DB 10 dup(?)			; ADDRESS�� ����
   ALL DB 10 dup(?)				; �Է����� �� ��ü�� �����ϱ� ����
   STKM DB	10 DUP	(?)			;����	

   uMAR_R DB "mar<- $"			; Display�� mar�� ���� ����ϱ� ����			
   uPC_R DB "pc<- $"				; Display�� pc�� ���� ����ϱ� ����						
   uIR_R DB "ir<- $"				; Display�� ir�� ���� ����ϱ� ����			
   uMDR_R DB "mdr<- $"			; Display�� mdr�� ���� ����ϱ� ����			
   uIST_R DB "ist<- $"				; Display�� ist�� ���� ����ϱ� ����
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
	   
	MOV AH, 0				;���� ��� ����
	MOV AL, 2				;ȭ�� Ŭ����
	INT 10H
	MOV DX,OFFSET explain0		;'===========================' ���
	MOV AH,09H				; ���ڿ� ����� ���� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DX,OFFSET explain1			;'a : macro	u : micro' ���
	MOV AH,09H				; ���ڿ� ����� ���� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DX,OFFSET explain2			;'e : exit	d : display' ���
	MOV AH,09H				; ���ڿ� ����� ���� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DX,OFFSET explain3			;'c : execute
						;  pc : program counter' ���
	MOV AH,09H				; ���ڿ� ����� ���� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DX,OFFSET explain4			;'r : return	i : interrupt$' ���
	MOV AH,09H				; ���ڿ� ����� ���� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DX,OFFSET explain5			;'m : input the instruction' ���
	MOV AH,09H				; ���ڿ� ����� ���� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	MOV DX,OFFSET explain0		; '==========================' ���
	MOV AH,09H				; ���ڿ� ����� ���� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
GUESS1:
   MOV DX,OFFSET PROM			;'>' ���
   MOV AH,09H					; ���ڿ� ����� ���� FUNCTION(9)
   INT 21H					; ���ͷ�Ʈ

   MOV AH, 01H				; �Է��� ���� FUNCTION(1)
   INT 21H					; ���ͷ�Ʈ         
   MOV DL, AL					; �Է��� ���� AL�� DL�� �̵�
   JMP CHECK					; CHECK ��
GUESS2:
   MOV AH, 01H				; �Է��� ���� FUNCTION(1)
   INT 21H					; ���ͷ�Ʈ
   CMP AL, 0DH					; AL�� 0DH (����)��
   JE CHECK_AU            ; AL�� �� ���� 0DH(����)�� ���ٸ� CHECK_AU�� �̵�       
   JNE GUESS3			; AL�� �� ���� 0DH(����)�� �ٸ��� GUESS3�� �̵�      
GUESS3:
   MOV AH, 01H				; �Է��� ���� FUNCTION(1)
   INT 21H					; ���ͷ�Ʈ
   CMP AL, 0DH					; AL�� 0DH(����) ��
   JE GUESS1					; AL�� �� ���� 0DH(����)�� ���ٸ� GUESS1�� �̵�  
   LOOP GUESS3				; LOOP
CHECK:																										
    CMP DL,  'a'            			; DL���� 'a'���� �ƴ��� ��
   je GUESS2					; 'a'��� GUESS2�� �̵�
   jne GUESS3					; 'u'�� �ƴ϶�� GUESS3����
CHECK_AU:
   CMP DL,  'a'					; DL���� 'a'���� �ƴ��� ��
   je a_macro					; ���ٸ� a_macro�� �̵�  
   jne GUESS1

;----------------------------------------------------------------------------
;	PROCEDURE NAME - u_micro PROC
;	Function : Function to print 'MICRO' at screen
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;      Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------

u_micro PROC	
	MOV DL, 0AH				; �ٹٲ�	
   MOV AH, 2					; ����� ���� FUNCTION(2)
   INT 21H					; ���ͷ�Ʈ			
   MOV DX,OFFSET MICRO			; 'MICRO' ���
   MOV AH,09H					; ���ڿ� ����� ���� FUNCTION(9)
   INT 21H					; ���ͷ�Ʈ
   
   MOV DL, 0AH				; �ٹٲ�	
   MOV AH, 2					; ����� ���� FUNCTION(2)
   INT 21H					; ���ͷ�Ʈ
   
   call u_write					; u_write ���ν��� ȣ��
   RET
u_micro   ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - a_macro PROC
;	Function :  : Function to print 'MACRO' at screen
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;      Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------

a_macro PROC					; <<a_macro�Լ�>>
   MOV DX,OFFSET AMACRO			; 'MACRO' ���
   MOV AH,09H					; ���ڿ� ����� �ϴ� FUNCTION(9)
   INT 21H					; ���ͷ�Ʈ
 
   MOV DL, 0AH				; �ٹٲ�	
   MOV AH, 2					; ����� ���� FUNCTION(2)
   INT 21H					; ���ͷ�Ʈ
   
   call a_write					; a_write ���ν��� ȣ��
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
	mov dx, 0				; DX�� 0 MOV
	MOV DX, bx				; BX�� DX�� MOV
	MOV DL, DH		; DH�� DL�� MOV	(ADDRESS[0]�� �˱� ���ؼ�)
	call judge_add				; judge_add ���ν��� ȣ��
	MOV AH, 02H				; ����� �ϴ� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	
	mov dx, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, bx				; BX�� DX�� MOV
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; ADDRESS[1]�� �˱� ���ؼ�
	call judge_add				; judge_add ���ν��� ȣ��
	MOV AH, 02H				; ����� �ϴ� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ

	mov dx, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, bx				; BX�� DX��
	SHL DL, 1				; DL<<4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; ADDRESS[2]�� �˱� ���ؼ�
	call judge_add				; judge_add ���ν��� ȣ��
	MOV AH, 02H				; ����� �ϴ� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
 ret
show endp

;----------------------------------------------------------------------------
;	PROCEDURE NAME - a_mac_dis PROC
;	Function : Function to display information on the CPU	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------

a_mac_dis PROC				; << d�� �Է��������� ���ν���(display)>> 
	MOV DL, 0AH				; �ٹٲ�
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	MOV DX, OFFSET R0_R			; 'R0'�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	MOV DX, OFFSET EQUAL			; ' = '�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	mov bx, 0				; BX�� 0���� �ʱ�ȭ
	MOV bx,  R0				; RO�� BX�� MOV
	call show				; SHOW ���ν��� ȣ��
     
	MOV DX, OFFSET COMA			; ','�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
   
	MOV DX, OFFSET R1_R			; 'R1'�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	MOV DX, OFFSET EQUAL			; ' = '�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	mov bx, 0				; BX�� 0���� �ʱ�ȭ
	MOV BX,  R1				; R1�� BX�� MOV
	call show				; SHOW ���ν��� ȣ��

	MOV DX, OFFSET COMA			; ','�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	MOV DX, OFFSET R2_R			; 'R2'�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	MOV DX, OFFSET EQUAL			; ' = '�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	MOV bX,  0				; BX�� 0���� �ʱ�ȭ
	mov bx, R2				; R2�� BX�� MOV
    call show					; SHOW ���ν��� ȣ��

	MOV DX, OFFSET COMA			; ','�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	MOV DX, OFFSET PC_R			; 'PC'�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
   
   MOV DX, OFFSET EQUAL			; ' = '�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	mov bx, 0				; BX�� 0���� �ʱ�ȭ
	MOV bX,  PC				; PC�� BX�� MOV
	call show				; SHOW ���ν��� ȣ��

	MOV DX, OFFSET COMA			; ',' ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	MOV DX, OFFSET PSW_R			; 'PSW'�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
   
   MOV DX, OFFSET EQUAL			; ' = '�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	mov bx, 0				; BX�� 0���� �ʱ�ȭ
	MOV bX,  PSW				; PSW�� BX�� MOV
	call show				; SHOW ���ν��� ȣ��

    MOV DL, 0AH				; �ٹٲ�
	MOV AH, 2				; ����� �ϴ� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	call a_write				; a_write ���ν��� ȣ��
ret
a_mac_dis endp					; mac_dis ���ν��� ����

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - a_write PROC
;	Function : Function to distinguish what is written on dosbox	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		Creation Date : Nov 25, 2016.11.25
;----------------------------------------------------------------------------
a_write proc
	MOV DX,OFFSET PROM			; '>' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
   
	MOV AH, 01H				; ���� �Է��� �ϴ� FUNCTION(1)
	INT 21H					; ���ͷ�Ʈ

	cmp al, 'd'			; �Էµ� ���ڰ� 'd'���� �ƴ��� ���Ѵ�
	je d					; �Էµ� ���ڰ� 'd'�̸� d��
	CMP AL, 'm'			; �Էµ� ���ڰ� 'm'���� �ƴ��� ���Ѵ�
	je a_mac_mem			; �Էµ� ���ڰ� 'm'�̸� a_mac_mem����
	cmp al, 'p'			; �Էµ� ���ڰ� 'p'���� �ƴ��� ���Ѵ�
	je p					; �Էµ� ���ڰ� 'p'�̸� p��
	cmp al, 'c'			; �Էµ� ���ڰ� 'c'���� �ƴ��� ���Ѵ�
	je c					; �Էµ� ���ڰ� 'c'�̸� c��
	cmp al, 'e'			; �Էµ� ���ڰ� 'e'���� �ƴ��� ���Ѵ�
	je e					; �Էµ� ���ڰ� 'e'�̸� e��
	CMP al, 'u'			; �Էµ� ���ڰ� 'u'���� �ƴ��� ���Ѵ�
	je u					; �Էµ� ���ڰ� 'u'�̸� u��
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 
						; ERRORMESSAGE ���ν��� ȣ��
d:			
	call a_mac_dis				; a_mac_dis(display) ���ν��� ȣ��
m:
	call a_mac_mem				; a_mac_mem ���ν��� ȣ��
p:
   call a_mac_checkp				; a_mac_checkp ���ν��� ȣ��
c:
	call a_mac_con				; a_mac_con ���ν��� ȣ��
e:
	call en					; en ���ν��� ȣ��
u:
	call u_micro				; u_micro ���ν��� ȣ��
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
	mov si, 0				; SOURCE INDEX�� 0�� INPUT
	mov di, 0				; DESTINATION INDEX �� 0�� INPUT
	mov ALL[SI], AL				; ALL[SI]�� AL�� �� MOV
l1:
	MOV AH, 01H				; �Է��� ���� FUNCTION(1)
	INT 21H					; ���ͷ�Ʈ
	INC SI					; SOURCE INDEX ++
    CMP AL,20H					; AL�� 20(SPACE) ���� �ƴ���
	JE SPACE				; 20(SPACE)�̸� SPACE��
	CMP AL, 0DH				; AL�� 0DH(ENTER)���� ��
	JE COMPARE				; 0DH(ENTER) �̸� COMPARE��
	MOV ALL[SI],AL				; AL���� ALL[SI]�� MOV
	CMP AL, 39H				; AL�� 39H(10���� 9)�� ��
	JLE ADR					; 39H(10���� 9)���� ������ ADR��
	loop l1					; LOOP
ADR: 
	mov ADDRESS[DI], AL			; AL�� ���� ADDRESS[DI]��
	INC DI					; DESTINATION INDEX++
	jmp l1					; L1�� JUMP
space:						
	mov ADDRESS[DI], '$'			; ADDRESS[DI]�� '$'�߰�
	MOV ALL[SI], '='				; ALL[SI]�� '=' �߰�
	mov di, 0				; DESTINATION INDEX�� 0����
W_PREVAL:
	MOV AH, 01H				; �Է��� ���� FUNCTION(1)
	INT 21H					; ���ͷ�Ʈ
	INC SI					; SOURCE INDEX++
	CMP AL, 0DH				; AL�� 0DH(ENTER)���� ��
	JE COMPARE				; 0DH(ENTER) �̸� COMPARE��
	cmp di, 3				; DI�� 3�� ��
	je D_PREVAL				; DI�� 3�� ���ٸ� D_PREVAL��
	mov PREVAL[di], AL			; �Է��� AL���� PREVAL[DI]��
	MOV ALL[si], al				; �Է��� AL���� ALL[SI]��
	inc di					; DESTINATION INDEX++
	loop W_PREVAL				; LOOP
D_PREVAL:
	MOV PREVAL[DI],'$'			; PREVAL[DI]�� '$'�߰�
	MOV DI, 0				; DI�� 0���� �ʱ�ȭ
IME_W:
	MOV ALL[SI], AL				; AL�� ALL[SI]��ġ�� �̵�
	MOV IME[DI], AL				; AL�� IME[DI]��ġ�� �̵�
	INC SI					; SOURCE INDEX++
	INC DI					; DESTINATION INDEX++
	MOV AH, 01H				; �Է��� ���� FUNCTION(1)
	INT 21H					; ���ͷ�Ʈ  
	CMP AL, 0DH				; AL�� 0DH(ENTER)���� ��
	JE COMPARE				; 0DH(ENTER) �̸� COMPARE��
	LOOP IME_W				; LOOP

COMPARE:	
	CMP SI, 13				; SI�� 13�� ��
	jne error_all				; SI�� 13�� �ƴϸ� ERROR_ALL��
	CMP DI, 3				; DI�� 3�� ��
	JNE ERROR_ALL				; DI�� 3�� �ƴϸ� ERROR_ALL��
	JMP PR
ERROR_ALL:
	CALL ERROR_MESSAGE			; ERROR_MESSAGE���ν��� ȣ��

pr:
	MOV ALL[SI],'$'				; ALL[SI]�� '$'�߰�
	mov IME[di],'$'				; IME[DI]�� '$'�߰�
   
	mov dx, offset ALL			; ALL�� ����� ���� DX��
	mov ah, 09h				; ���ڿ� ����� �ϴ� FUNCTION(9)
	int 21h					; ���ͷ�Ʈ

   CALL ADDRESS_PC_MAKE			; ADDRESS_PC_MAKE ���ν��� ȣ��

	;;;;;;;;;;;;;;;;;;;;;;;;; PREVAL ó��

	MOV DL, 0AH				; �ٹٲ�
	MOV AH, 2				; ���� ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	
	mov ax, 0				; AX�� 0���� �ʱ�ȭ
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV AL, PREVAL[0]			; PREVAL[0]�� ���� AL�� MOV


    CALL JUDGE_SUB				; JUDGE_SUB ���ν��� ȣ��
	MOV DH, AL				; AL�� ���� DH�� �̵�
	mov ax, 0				; AX�� 0���� �ʱ�ȭ
	MOV AL, PREVAL[1]			; PREVAL[1]�� ���� AL�� MOV

	CALL JUDGE_SUB			; JUDGE_SUB ���ν��� ȣ��

	MOV DL, AL				; AL�� ���� DL�� �̵�

	SHL DL, 1				; DL << 4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	
	mov ax, 0				; AX�� 0���� �ʱ�ȭ
	MOV AL, PREVAL[2]			; PREVAL[2]�� ���� AL�� MOV
   
	CALL JUDGE_SUB			; JUDGE_SUB ���ν��� ȣ��

	ADD DL, AL				; AL�� ���� DL�� �̵�

	MOV BX, PC				; PC�� BX�� �̵�
	mov mem[bx],0				; MEM[BX]�� ���� 0���� �ʱ�ȭ
	mov MEM[BX], DX			; DX�� MEM[BX]�� MOV

	
	;;;;;;;;;;;;;;;;;;;;;;;;; IMMEDIATE ó��

	mov ax, 0				; AX�� 0���� �ʱ�ȭ		
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV AL, IME[0]				; IME[0]�� ���� AL�� MOV
	
    CALL JUDGE_SUB				; JUDGE_SUB ���ν��� ȣ��

	MOV DH, AL				; AL�� ���� DH�� �̵�

	mov ax, 0				; AX�� 0���� �ʱ�ȭ	
	MOV AL, IME[1]				; IME[1]�� ���� AL�� MOV

    CALL JUDGE_SUB				; JUDGE_SUB ���ν��� ȣ��
	
	ADD DL, AL				; AL�� ���� DL�� �̵�
	SHL DL, 1				; DL << 4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	
	mov ax, 0				; AX�� 0���� �ʱ�ȭ	
	MOV AL, IME[2]				; IME[2]�� ���� AL�� MOV
	
	CALL JUDGE_SUB			; JUDGE_SUB ���ν��� ȣ��

	ADD DL, AL				; AL�� ���� DL�� �̵�

	ADD PC, 2				; PC = PC + 2
	MOV BX, PC				; PC�� BX�� MOV
	mov mem[bx],0				; MEM[BX]�� ���� 0���� �ʱ�ȭ
	mov MEM[BX], DX			; DX�� MEM[BX]�� MOV
	

	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
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
	mov ALL,0				; ALL�� 0���� �ʱ�ȭ
	mov si,0					; SI�� 0���� �ʱ�ȭ
	mov di,0				; DI�� 0���� �ʱ�ȭ
	mov ALL[si],al				; AL�� ALL[SI]��
    inc si					; SOURCE INDEX++
	MOV AH, 01H				; �Է��� ���� FUNCTION(1)
	INT 21H					; ���ͷ�Ʈ  
	cmp al, 'c'				; AL�� 'c'�� ��
	je check_pc				; AL�� 'c'�� ���ٸ� check_pc��
	call a_write				; a_write ���ν��� ȣ��
	ret
a_mac_checkp endp

;----------------------------------------------------------------------------
 check_pc:
	mov ALL[si],al				; AL�� ALL[SI]�� MOV
    inc si					; SOURCE INDEX++

    MOV AH, 01H				; �Է��� ���� FUNCTION(1)
	INT 21H					; ���ͷ�Ʈ
    cmp al, 20H					; AL�� 20H(SPACE)�� ��
    je pc_space					; AL�� 20H(SPCAE)�̸� pc_space��
	call a_write				; a_write ���ν��� ȣ��

pc_space:		
	mov ALL[si],'='				; ALL[SI]��ġ�� '='�� MOV
	jmp pc_add				; pc_add��

pc_add:
	MOV AH, 01H				; �Է��� ���� FUNCTION(1)
	INT 21H					; ���ͷ�Ʈ 
	cmp al, 0dh				; �Էµ� �� AL�� 0DH(ENTER)�� ��
	je pc_print			; �Էµ� ���� 0DH(ENTER)�̸� pc_print��
	inc si					; SOURCE INDEX++	
    mov ALL[si],al				; �Էµ� �� AL�� ALL[SI]��
    mov address[di],al				; �Էµ� �� AL�� ADDRESS[DI]��
    inc di					; DESTINATION INDEX++
loop pc_add					; LOOP

pc_print:
   inc si						; SOURCE INDEX++				
   MOV ALL[SI],'$'				; ALL[SI]��ġ�� '$'�� MOV
   mov address[di],'$'				; ADDRESS[DI]��ġ�� '$'�� MOV
   mov dx, offset ALL				; ALL�� ���
   MOV AH,09H					; ���ڿ� ����� ���� FUNCTION(9)
   INT 21H					; ���ͷ�Ʈ
   CALL ADDRESS_PC_MAKE			; ADDRESS_PC_MAKE ���ν��� ȣ��
   MOV DL, 0AH				; �ٹٲ�	
   MOV AH, 2					; ����� ���� FUNCTION(2)
   INT 21H					; ���ͷ�Ʈ
   call a_write					; a_wrtie ���ν��� ȣ��

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - A_MAC_CON_PRINT PROC
;	Function : Function to print 6digit-number instruction code if user writes 'c'
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 27, 2016.11.27
;----------------------------------------------------------------------------
A_MAC_CON_PRINT PROC
	MOV BX, PC				; PC�� BX�� MOV
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	MOV DL, DH				; DH�� DL�� MOV
				;( ADDRESS[0]/PC+2�� ADDRESS[0]�� ����ϱ� ����)

	CALL JUDGE_ADD			; JUDGE_ADD ���ν��� ȣ��

	MOV AH, 02H				; ��ɾ� 6�ڸ��� ù��°/�׹�° ���, 
						; ����� �ϴ� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	MOV DX, 0
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV 
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1		   ; ADDRESS[1]/PC+2�� ADDRESS[1]�� ����ϱ� ����
	
	CALL JUDGE_ADD			; JUDGE_ADD ���ν��� ȣ��

	MOV AH, 02H				; ��ɾ� 6�ڸ��� �ι�°/�ټ���° ���, 						; ����� �ϴ� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	MOV DX, 0
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	SHL DL, 1				; DL<<4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1		; ADDRESS[2]/PC+2�� ADDRESS[2]�� ����ϱ� ����

	CALL JUDGE_ADD			; JUDGE_ADD ���ν��� ȣ��

	MOV AH, 02H				; ��ɾ� 6�ڸ��� ����°/������° ���, 
						;����� �ϴ� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
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
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	CALL A_MAC_CON_PRINT		; A_MAC_CON_PRINT ���ν��� ȣ�� 
 						; ADDRESS[0],[1],[2] ���
	ADD PC, 2				; PC = PC + 2
	CALL A_MAC_CON_PRINT		; A_MAC_CON_PRINT ���ν��� ȣ�� PC+2�� 
						; ADDRESS[0],[1],[2] ���
	SUB PC, 2				; PC = PC - 2

 	mov bx, pc				; PC�� BX�� MOV
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
			
	cmp dh, 1				; DH�� 1(MOV ��ɾ��ڵ�)�� ��
	je WHAT_CHK_MO			; DH�� 1�̶�� WHAT_CHK_MO��

	cmp dh, 2			      ; DH�� 2(ADD(���ϱ�) ��ɾ��ڵ�)�� ��
	je WHAT_CHK_AD			; DH�� 2��� WHAT_CHK_AD��

	cmp dh, 3				; DH�� 3(SUB(����) ��ɾ��ڵ�)�� ��
	je WHAT_CHK_SU			; DH�� 3�̶�� WHAT_CHK_SU��

	cmp dh, 4				; DH�� 4(AND ��ɾ��ڵ�)�� ��
	je WHAT_CHK_AND			; DH�� 4��� WHAT_CHK_AND��

	CMP DH, 5				; DH�� 5(OR ��ɾ��ڵ�)�� ��
	JE WHAT_CHK_OR			; DH�� 5��� WHAT_CHK_OR��

	CMP DH, 6				; DH�� 6(NOT ��ɾ��ڵ�)�� ��
	JE WHAT_CHK_NOT			; DH�� 6�̶�� WHAT_CHK_NOT��

	CMP DH, 7				; DH�� 7(HLT(����) ��ɾ��ڵ�)�� ��
	JE WHAT_CHK_HLT			; DH�� 7�̶�� WHAT_CHK_HLT��

	cmp dh, 8				; DH�� 8(INC(����) ��ɾ��ڵ�)�� ��
	je WHAT_CHK_INC			; DH�� 8�̶�� WHAT_CHK_INC��

	cmp dh, 9				; DH�� 9(DEC(����) ��ɾ��ڵ�)�� ��
	JE WHAT_CHK_DEC			; DH�� 9��� WHAT_CHK_DEC��

	CMP DH, 10			      ; DH�� 10(CMP(��) ��ɾ��ڵ�)�� ��
	JE WHAT_CHK_CMP			; DH�� 10�̶�� WHAT_CHK_CMP��

	CMP DH, 11				; DH�� 11(BEQ ��ɾ��ڵ�)�� ��
	JE WHAT_CHK_BEQ			; DH�� 11�̶�� WHAT_CHK_BEQ��

	cmp dh, 12				; DH�� 12(SHR ��ɾ��ڵ�)�� ��
	je WHAT_CHK_SHR			; DH�� 12��� WHAT_CHK_SHR��
	
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
WHAT_CHK_MO:
	CALL CHK_MO				; CALL CHK_MO ���ν��� ȣ��
WHAT_CHK_AD:
	CALL CHK_AD				; CALL CHK_AD ���ν��� ȣ��
WHAT_CHK_SU:
	CALL CHK_SU				; CALL CHK_SU ���ν��� ȣ��
WHAT_CHK_AND:
	CALL CHK_AND				; CALL CHK_AND ���ν��� ȣ��
WHAT_CHK_OR:
	CALL CHK_OR				; CALL CHK_OR ���ν��� ȣ��
WHAT_CHK_NOT:
	CALL CHK_NOT				; CALL CHK_NOT ���ν��� ȣ��
WHAT_CHK_HLT:	
	CALL CHK_HLT				; CALL CHK_HLT ���ν��� ȣ��
WHAT_CHK_INC:	
	CALL CHK_INC				; CALL CHK_INC ���ν��� ȣ��
WHAT_CHK_DEC:
	CALL CHK_DEC				; CALL CHK_DEC ���ν��� ȣ��
WHAT_CHK_CMP:
	CALL CHK_CMP				; CALL CHK_CMP ���ν��� ȣ��
WHAT_CHK_BEQ:
	CALL CHK_BEQ				; CALL CHK_BEQ ���ν��� ȣ��
WHAT_CHK_SHR:
	CALL CHK_SHR				; CALL CHK_SHR ���ν��� ȣ��
	ret
a_mac_con endp
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_MO PROC
;	Function : Function to identify MOV's Addressing Mode and call procedure about Addressing Mode
;
;=======111111=========<<<<<<<<<<MOV �̵�>>>>>>>>>>>==========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

CHK_MO PROC
	shr dl, 1				; DL>>6 ADDRESS����� Ȯ���ϱ� ����
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1
	cmp dl, 0			; DL�� 0(Register Addressing Mode)���� ��
	je WHAT_MO_REG			; DL�� 0�̶�� WHAT_MO_REG��
	cmp dl, 1		      ; DL�� 1(Immediate Addressing Mode)���� ��
	JE WHAT_MO_IMM			; DL�� 1�̶�� WHAT_MO_IMM��
	cmp dl, 2			; DL�� 2(Direct Addressing Mode)���� ��
	JE WHAT_MO_DIR			; DL�� 2�̶�� WHAT_MO_DIR��
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
WHAT_MO_REG:
	CALL MO_REG				; CALL MO_REG ���ν��� ȣ��		
WHAT_MO_IMM:
	CALL MO_IMM				; CALL MO_IMM ���ν��� ȣ��
WHAT_MO_DIR:
	CALL MO_DIR				; CALL MO_DIR ���ν��� ȣ��
RET
CHK_MO ENDP
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_REG PROC
;	Function : Function to what is first Register when MOV's Addressing Mode is Register Adressing Mode	
;
;=========111111======<<<<<<<<<<MOV �̵�>>>>>>>>>>>============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_REG PROC
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				; DL�� 0���� ��
	JE WHAT_MO_REG_R0			; DL�� 0�̶�� WHAT_MO_REG_R0��
	CMP DL, 1				; DL�� 1���� ��
	JE WHAT_MO_REG_R1			; DL�� 1�̶�� WHAT_MO_REG_R1��
	CMP DL, 2				; DL�� 2���� ��
	JE WHAT_MO_REG_R2			; DL�� 2��� WHAT_MO_REG_R2��
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
WHAT_MO_REG_R0:
	CALL MO_REG_R0	; MO_REG_R0 ���ν��� ȣ�� (ù��° �������Ͱ� R0)
WHAT_MO_REG_R1:
	CALL MO_REG_R1	; MO_REG_R1 ���ν��� ȣ�� (ù��° �������Ͱ� R1)
WHAT_MO_REG_R2:
	CALL MO_REG_R2	; MO_REG_R2 ���ν��� ȣ�� (ù��° �������Ͱ� R2)
RET
MO_REG ENDP
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_REG_R0 PROC
;	Function :  Function to what is second Register && Register's MOV calculation 
;				when MOV's Addressing Mode is Register Adressing Mode and first Register is RO	
;				MOV�� Addressing Mode�� Register�̰� ù��° �������Ͱ� R0�� ��� �ι�° �������Ͱ� �������� & �������Ϳ� �´� mov����
;
;=========111111=======<<<<<<<<<<MOV �̵�>>>>>>>>>>>===========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_REG_R0 PROC

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	
	SHL DL, 1				; DL<<4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1

	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; DL 8�ڸ��� ���� 4�ڸ��� �˱� ���ؼ�

	CMP DL, 0				; DL�� 0(0000)���� �ƴ��� ��
	JE MO_REG_R0R0			; DL�� 0�̶�� MO_REG_R0R0��
	CMP DL, 4				; DL�� 4(0100)���� �ƴ��� ��
	JE MO_REG_R0R1			; DL�� 4��� MO_REG_R0R1��
	CMP DL, 8				; DL�� 8(1000)���� �ƴ��� ��
	JE MO_REG_R0R2			; DL�� 8�̶�� MO_REG_R0R2��
	CMP DL, 12				; DL�� 12(1100)���� �ƴ��� ��
	JE MO_REG_R0AD			; DL�� 12��� MO_REG_R0AD��
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
MO_REG_R0R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R0				; RO�� DX�� MOV
	MOV R0, DX		; DX�� R0�� MOV (MOV�� ��� : R0�� R0�� �̵�)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_REG_R0R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R1				; R1�� DX�� MOV
	MOV R0, DX				; DX�� R0�� MOV (MOV�� ��� : R1�� R0�� �̵�)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R2				; R2�� DX�� MOV
	MOV R0, DX				; DX�� R0�� MOV (MOV�� ��� : R2�� R0�� �̵�)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_REG_R0AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ�� 
	MOV DX, BX				; BX�� DX�� �̵���Ų��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� MOV
	MOV MEM[BX], DX			; DX�� MEM[BX]�� MOV
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
	RET
MO_REG_R0 ENDP
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_REG_R1 PROC
;	Function :  Function to what is second Register && Register's MOV calculation 
;				when MOV's Addressing Mode is Register Adressing Mode and first Register is R1
;
;==========111111=======<<<<<<<<<<MOV �̵�>>>>>>>>>>>=========
;	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_REG_R1 PROC

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	
	SHL DL, 1				; DL<<4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1

	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; DL 8�ڸ��� ���� 4�ڸ��� �˱� ���ؼ�

	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JE MO_REG_R1R0			; DL�� 0�̶�� MO_REG_R1R0�� 
	CMP DL, 4				; DL�� 4���� �ƴ��� ��
	JE MO_REG_R1R1			; DL�� 4��� MO_REG_R1R1�� 
	CMP DL, 8				; DL�� 8���� �ƴ��� ��
	JE MO_REG_R1R2			; DL�� 8�̶�� MO_REG_R1R2�� 
	CMP DL, 12				; DL�� 12���� �ƴ��� ��
	JE MO_REG_R1AD			; DL�� 12��� MO_REG_R1AD�� 
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
MO_REG_R1R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R0				; RO�� DX�� MOV
	MOV R1, DX		; DX�� R1���� MOV (MOV�� ��� : R0�� R1���� �̵�)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_REG_R1R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R1				; R1�� DX�� MOV
	MOV R1, DX		; DX�� R1���� MOV (MOV�� ��� : R1�� R1���� �̵�)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_REG_R1R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R2				; R2�� DX�� MOV
	MOV R1, DX				; DX�� R1���� MOV (MOV�� ��� : R2�� R1���� �̵�)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_REG_R1AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				; BX�� 0���� �ʱ�ȭ
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV BX, PC				; PC�� BX�� MOV
	MOV DX, R1				; R1�� DX�� MOV
	MOV MEM[BX], DX			; DX�� MEM[BX]��
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
	RET
MO_REG_R1 ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_REG_R2 PROC
;	Function :  Function to what is second Register && Register's MOV calculation 
;				when MOV's Addressing Mode is Register Adressing Mode and first Register is R2
;
;=======111111========<<<<<<<<<<MOV �̵�>>>>>>>>>>>===========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_REG_R2 PROC

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	
	SHL DL, 1				; DL<<4
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1

	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; DL 8�ڸ��� ���� 4�ڸ��� �˱� ���ؼ�

	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JE MO_REG_R2R0			; DL�� 0�̶�� MO_REG_R2R0��
	CMP DL, 4				; DL�� 4���� �ƴ��� ��
	JE MO_REG_R2R1			; DL�� 4��� MO_REG_R2R1��
	CMP DL, 8				; DL�� 8���� �ƴ��� ��
	JE MO_REG_R2R2			; DL�� 8�̶�� MO_REG_R2R2��
	CMP DL, 12				; DL�� 12���� �ƴ��� ��
	JE MO_REG_R2AD			; DL�� 12��� MO_REG_R2AD��
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
MO_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R0				; RO�� DX�� MOV
	MOV R2, DX				; DX�� R2�� MOV (MOV�� ��� : R0�� R2�� �̵�)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_REG_R2R1:	
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R1				; R1�� DX�� MOV
	MOV R2, DX				; DX�� R2�� MOV (MOV�� ��� : R1�� R2�� �̵�)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R2				; R2�� DX�� MOV
	MOV R2, DX				; DX�� R2�� MOV (MOV�� ��� : R2�� R2�� �̵�)
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_REG_R2AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				; BX�� 0���� �ʱ�ȭ
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV BX, PC				; PC�� BX�� MOV
	MOV DX, R2				; R2�� DX�� MOV
	MOV MEM[BX], DX			; DX�� MEM[BX]�� MOV
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
	RET
MO_REG_R2 ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_IMM PROC	
;	Function : Function to MOV calculation when MOV's Addressing Mode is Immediate
;
;=====111111==========<<<<<<<<<<MOV �̵�>>>>>>>>>>==========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_IMM PROC		

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_MOVIMM			; �ƴ϶�� ERROR_MOVIMM��

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� ���� 4�ڸ��� ���� 2�ڸ��� �˱� ���ؼ�

	CMP DL, 4				; DL�� 0���� �ƴ��� ��
	JE MO_IMM_R0				; DL�� 0�̶�� MO_IMM_R0��
	CMP DL, 5				; DL�� 1���� �ƴ��� ��
	JE MO_IMM_R1				; DL�� 1�̶�� MO_IMM_R1����
	CMP DL, 6				; DL�� 2���� �ƴ��� ��
	JE MO_IMM_R2				; DL�� 2��� MO_IMM_R2��
	CMP DL, 7				; DL�� 3���� �ƴ��� ��
	JE MO_IMM_AD				; DL�� 3�̶�� MO_IMM_AD��
ERROR_MOVIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
MO_IMM_R0:
	ADD PC, 2				; PC = PC + 2
	MOV BX, PC				; PC�� BX�� MOV
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	MOV R0, DX				; DX�� R0�� MOV
	ADD PC, 2				; PC = PC + 2
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_IMM_R1:
	ADD PC, 2				; PC = PC + 2
	MOV BX, PC				; PC�� BX�� MOV
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	MOV R1, DX				; DX�� R1���� MOV
	ADD PC, 2				; PC = PC + 2
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_IMM_R2:
	ADD PC, 2				; PC = PC + 2
	MOV BX, PC				; PC�� BX�� MOV
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	MOV R2, DX				; DX�� R2�� MOV
	ADD PC, 2				; PC = PC + 2
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_IMM_AD:
	ADD PC, 2				; PC = PC + 2
	MOV BX, PC				; PC�� BX�� MOV
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	SUB PC, 2				; PC = PC - 2
	MOV BX, PC				; PC�� BX��
	MOV MEM[BX], DX			; DX�� MEM[BX]��
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��	
	RET
MO_IMM ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - MO_DIR PROC
;	Function : Function to MOV calculation when MOV's Addressing Mode is Direct Addressing Mode
;
;========111111=========<<<<<<<<<<MOV �̵�>>>>>>>>>>>==========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

MO_DIR PROC			

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_MOVDIR			; �ƴ϶�� ERROR_MOVDIR��

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	SHL DL, 1				; DL<<2
	SHL DL, 1
	SHR DL, 1				; DL>>6
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� ���� 4�ڸ��� ���� 2�ڸ��� �˱� ���ؼ�

	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JE MO_DIR_R0				; DL�� 0�̶�� MO_DIR_R0��
	CMP DL, 1				; DL�� 1���� �ƴ��� ��
	JE MO_DIR_R1				; DL�� 1�̶�� MO_DIR_R1����
	CMP DL, 2				; DL�� 2���� �ƴ��� ��
	JE MO_DIR_R2				; DL�� 2��� MO_DIR_R2��
ERROR_MOVDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
MO_DIR_R0:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� MOV
	MOV BX, 0				; BX�� 0���� �ʱ�ȭ
	MOV BX, PC				; PC�� BX�� MOV
	MOV PC, DX				; DX�� PC�� MOV
	ADD PC, 2				; PC = PC + 2
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	MOV R0, DX				; DX�� R0�� MOV
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_DIR_R1:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� MOV
	MOV BX, 0				; BX�� 0���� �ʱ�ȭ
	MOV BX, PC				; PC�� BX�� MOV
	MOV PC, DX				; DX�� PC�� MOV
	ADD PC, 2				; PC = PC + 2
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	MOV R1, DX				; DX�� R1���� MOV
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
MO_DIR_R2:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� MOV
	MOV BX, 0				; BX�� 0���� �ʱ�ȭ
	MOV BX, PC				; PC�� BX�� MOV
	MOV PC, DX				; DX�� PC�� MOV
	ADD PC, 2				; PC = PC + 2
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	MOV R2, DX				; DX�� R2�� MOV
	call a_mac_dis				; a_mac_dis ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��

	RET
	MO_DIR ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_AD PROC
;	Function : Function to identify ADD's Addressing Mode and call procedure about Addressing Mode
;
;========222222========<<<<<<<<<<���ϱ�>>>>>>>>>>>=============
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
	shr dl, 1				; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	cmp dl, 0			; DL�� 0(Register Addressing Mode)���� ��
	je WHAT_AD_REG			; DL�� 0������ WHAT_AD_REG�� ����
	cmp dl, 1		       ; DL�� 1(Immediate Addressing Mode)���� ��
	JE WHAT_AD_IMM			; DL�� 1������ WHAT_AD_IMM�� ����
	cmp dl, 2			; DL�� 0(Direct Addressing Mode)���� ��
	JE WHAT_AD_DIR			; DL�� 2������ WHAT_AD_DIR�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
WHAT_AD_REG:
	CALL AD_REG				; AD_REG ���ν����� ȣ��
WHAT_AD_IMM:
	CALL AD_IMM				; AD_IMM ���ν����� ȣ��
WHAT_AD_DIR:
	CALL AD_DIR				; AD_DIR ���ν����� ȣ��
	RET
	CHK_AD ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_REG PROC
;	Function : Function to what is first Register when ADD's Addressing Mode is Register Adressing Mode	
;
;=============222222==========<<<<<<<<<<���ϱ�>>>>>>>>>>>=====================
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;---------------------------------------------------------------------------

AD_REG PROC				
	MOV DX, 0           			; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]	    	; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1	    		; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0           			; 0�� DL�� ���Ѵ�
	JE WHAT_AD_REG_R0          	; DL�� 0�� ������ WHAT_AD_REG_R0���� ����
	CMP DL, 1           			; 1�� DL�� ���Ѵ�
	JE WHAT_AD_REG_R1         	; DL�� 1�� ������ WHAT_AD_REG_R1���� ����
	CMP DL, 2           			; 2�� DL�� ���Ѵ�
	JE WHAT_AD_REG_R2   		; DL�� 2�� ������ WHAT_AD_REG_R2���� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
WHAT_AD_REG_R0:
	CALL AD_REG_R0  			; AD_REG_R0 ���ν����� ȣ��
WHAT_AD_REG_R1:
	CALL AD_REG_R1				; AD_REG_R1 ���ν����� ȣ��
WHAT_AD_REG_R2:
	CALL AD_REG_R2				; AD_REG_R2 ���ν����� ȣ��
	
;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_REG_R0 PROC
;	Function :  Function to what is second Register && Register's ADD calculation 
;				when ADD's Addressing Mode is Register Adressing Mode and first Register is RO	
;
;=======222222========<<<<<<<<<<���ϱ�>>>>>>>>>>>==============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AD_REG_R0 PROC
	

	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��


	CMP DL, 0				; 0�� DL�� ���Ѵ�
	JE AD_REG_R0R0			; DL�� 0�� ������ AD_REG_R0R0���� ����
	CMP DL, 4				; 4�� DL�� ���Ѵ�
	JE AD_REG_R0R1			; DL�� 4�� ������ AD_REG_R0R1�� ����
	CMP DL, 8				; 8�� DL�� ���Ѵ�
	JE AD_REG_R0R2			; DL�� 8�� ������ AD_REG_R0R2�� ����
	CMP DL, 12				; 12�� DL�� ���Ѵ�
	JE AD_REG_R0AD			; DL�� 12�� ������ AD_REG_R0AD�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						; ERRORMESSAGE ���ν��� ȣ��
	
AD_REG_R0R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	ADD R0, DX				; R0�� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ��
	CALL A_WRITE				; A_WRITE ���ν����� ȣ��
AD_REG_R0R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	ADD R0, DX				; R0�� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ��
	CALL A_WRITE				; A_WRITE ���ν����� ȣ��
AD_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	ADD R0, DX				; R0�� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ��
	CALL A_WRITE				; A_WRITE ���ν����� ȣ��
	RET
	AD_REG_R0 ENDP	
AD_REG_R0AD:
	CALL MAKE_ADDRESS		       ; MAKE_ADDRESS ���ν����� ȣ���Ѵ�
	MOV BX, 0 				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	ADD MEM[BX], DX		      ; MEM[BX]��ġ�� �ִ� ���� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ���Ѵ�
	CALL A_WRITE				; A_WRITE ���ν����� ȣ���Ѵ�
	RET

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_REG_R1 PROC
;	Function :  Function to what is second Register && Register's ADD calculation 
;				when ADD's Addressing Mode is Register Adressing Mode and first Register is R1
;
;=====222222=========<<<<<<<<<<���ϱ�>>>>>>>>>>>===============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AD_REG_R1 PROC

	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE AD_REG_R1R0			; DL�� 0�� ������ AD_REG_R1R0���� ����
	CMP DL, 4				; DL�� 4�� ���Ѵ�
	JE AD_REG_R1R1			; DL�� 4�� ������ AD_REG_R1R1���� ����
	CMP DL, 8				; DL�� 8�� ���Ѵ�
	JE AD_REG_R1R2			; DL�� 8�� ������ AD_REG_R1R2�� ����
	CMP DL, 12				; DL�� 12�� ���Ѵ�
	JE AD_REG_R1AD			; DL�� 12�� ������ AD_REG_R1AD�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 
						; ERRORMESSAGE ���ν��� ȣ��
	
AD_REG_R1R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	ADD R1, DX				; R1�� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ���Ѵ�
	CALL A_WRITE				; A_WRITE ���ν����� ȣ���Ѵ�
AD_REG_R1R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	ADD R1, DX				; R1�� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ���Ѵ�
	CALL A_WRITE				; A_WRITE ���ν����� ȣ���Ѵ�
AD_REG_R1R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	ADD R1, DX				; R1�� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ���Ѵ�
	CALL A_WRITE				; A_WRITE ���ν����� ȣ���Ѵ�
AD_REG_R1AD:
	CALL MAKE_ADDRESS		       ; MAKE_ADDRESS ���ν����� ȣ���Ѵ�
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	ADD MEM[BX], DX	    	      ; MEM[BX]��ġ�� �ִ� ���� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ���Ѵ�
	CALL A_WRITE				; A_WRITE ���ν����� ȣ���Ѵ�
	RET
	AD_REG_R1 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_REG_R2 PROC
;	Function :  Function to what is second Register && Register's ADD calculation 
;				when ADD's Addressing Mode is Register Adressing Mode and first Register is R2
;
;=======222222=========<<<<<<<<<<���ϱ�>>>>>>>>>>>==============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AD_REG_R2 PROC	
	
	MOV DX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE AD_REG_R2R0			; DL�� 0�� ������ AD_REG_R2R0���� ����
	CMP DL, 4				; DL�� 4�� ���Ѵ�
	JE AD_REG_R2R1			; DL�� 4�� ������ AD_REG_R2R1���� ����
	CMP DL, 8				; DL�� 8�� ���Ѵ�
	JE AD_REG_R2R2			; DL�� 8�� ������ AD_REG_R2R2�� ����
	CMP DL, 12				; DL�� 12�� ���Ѵ�
	JE AD_REG_R2AD			; DL�� 12�� ������ AD_REG_R2AD�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						; ERRORMESSAGE ���ν��� ȣ��
	
AD_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	ADD R2, DX				; R2�� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ���Ѵ�
	CALL A_WRITE				; A_WRITE ���ν����� ȣ���Ѵ�
AD_REG_R2R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	ADD R2, DX				; R2�� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ���Ѵ�
	CALL A_WRITE				; A_WRITE ���ν����� ȣ���Ѵ�
AD_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	ADD R2, DX				; R2�� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ���Ѵ�
	CALL A_WRITE				; A_WRITE ���ν����� ȣ���Ѵ�
AD_REG_R2AD:
	CALL MAKE_ADDRESS		       ; MAKE_ADDRESS ���ν����� ȣ���Ѵ�
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	ADD MEM[BX], DX		      ; MEM[BX]��ġ�� �ִ� ���� DX�� ���Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ���Ѵ�
	CALL A_WRITE				; A_WRITE ���ν����� ȣ���Ѵ�
	RET
AD_REG_R2 ENDP
	RET
AD_REG ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_IMM PROC		
;	Function : Function to ADD calculation when ADD's Addressing Mode is Immediate
;
;=======222222==========<<<<<<<<<<���ϱ�>>>>>>>>>>>=========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AD_IMM PROC					; immediate	

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_ADIMM			; �ƴ϶�� ERROR_ADIMM��

	MOV DX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 2��Ʈ �̵���Ų��
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE AD_IMM_R0				; DL�� 0�� ������ AD_IMM_R0�� ����
	CMP DL, 1				; DL�� 1�� ���Ѵ�
	JE AD_IMM_R1				; DL�� 1�� ������ AD_IMM_R1�� ����
	CMP DL, 2				; DL�� 2�� ���Ѵ�
	JE AD_IMM_R2				; DL�� 2�� ������ AD_IMM_R2�� ����
ERROR_ADIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��

AD_IMM_R0:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]	   	      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	ADD R0, DX				; R0�� DX�� ���Ѵ�
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ��
	CALL A_WRITE				; A_WRITE ���ν����� ȣ��
AD_IMM_R1:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]			; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	ADD R1, DX				; R1�� DX�� ���Ѵ�
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ��
	CALL A_WRITE				; A_WRITE ���ν����� ȣ��
AD_IMM_R2:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	ADD R2, DX				; R2�� DX�� ���Ѵ�
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν����� ȣ��
	CALL A_WRITE				; A_WRITE���ν����� ȣ��
	RET
AD_IMM ENDP

;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
;	PROCEDURE NAME - AD_DIR PROC
;	Function : Function to ADD calculation when ADD's Addressing Mode is Direct Addressing Mode
;
;========222222=======<<<<<<<<<<���ϱ�>>>>>>>>>>>===============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

AD_DIR PROC					; direct

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_ADDIR			; �ƴ϶�� ERROR_ADDIR��
	
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 2��Ʈ �̵���Ų��
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE AD_DIR_R0				; DL�� 0�� ������ AD_DIR_R0�� �̵�
	CMP DL, 1				; DL�� 1�� ���Ѵ�
	JE AD_DIR_R1				; DL�� 1�� ������ AD_DIR_R1�� �̵�
	CMP DL, 2				; DL�� 2�� ���Ѵ�
	JE AD_DIR_R2				; DL�� 2�� ������ AD_DIR_R2�� �̵�
ERROR_ADDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
AD_DIR_R0:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� �̵���Ų��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	ADD R0, DX				; R0�� DX�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AD_DIR_R1:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
MOV DX, BX
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; BX�� DX�� �̵���Ų��
	MOV PC, DX				; BX�� DX�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; BX�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	ADD R1, DX				; R1�� DX�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AD_DIR_R2:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
MOV DX, BX
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	ADD R2, DX				; R2�� DX�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
RET
AD_DIR ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_SU PROC
;	Function : Function to identify SUB's Addressing Mode and call procedure about Addressing Mode
;
;========33333======<<<<<<<<<<����>>>>>>>>>>>===============
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
	shr dl, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	cmp dl, 0			; DL�� 0(Register Addressing Mode)���� ��
	je WHAT_SU_REG		; DL�� 0�� ���ٸ� WHAT_SU_REG�� ����
	cmp dl, 1		      ; DL�� 1(Immediate Addressing Mode)���� ��
	JE WHAT_SU_IMM		; DL�� 1�� ���ٸ� WHAT_SU_IMM�� ����
	cmp dl, 2			; DL�� 2(Direct Addressing Mode)���� ��
	JE WHAT_SU_DIR		; DL�� 2�� ���ٸ� WHAT_SU_DIR�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
WHAT_SU_REG:
	CALL SU_REG				; SU_REG ���ν��� ȣ��
WHAT_SU_IMM:
	CALL SU_IMM				; SU_IMM ���ν��� ȣ��
WHAT_SU_DIR:
	CALL SU_DIR				; SU_DIR ���ν��� ȣ��
	RET
	CHK_SU ENDP	

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_REG PROC
;	Function : Function to what is first Register when SUB's Addressing Mode is Register Adressing Mode	
;
;======33333========<<<<<<<<<<����>>>>>>>>>>>==================
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

SU_REG PROC					; register
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE WHAT_SU_REG_R0		; DL�� 0�� ���ٸ� WHAT_SU_REG_R0�� ����
	CMP DL, 1				; DL�� 1�� ���Ѵ�
	JE WHAT_SU_REG_R1		; DL�� 1�� ���ٸ� WHAT_SU_REG_R1�� ����
	CMP DL, 2				; DL�� 2�� ���Ѵ�
	JE WHAT_SU_REG_R2		; DL�� 2�� ���ٸ� WHAT_SU_REG_R2�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
WHAT_SU_REG_R0:
	CALL SU_REG_R0				; SU_REG_R0 ���ν��� ȣ��
WHAT_SU_REG_R1:
	CALL SU_REG_R1				; SU_REG_R1 ���ν��� ȣ��
WHAT_SU_REG_R2:
	CALL SU_REG_R2				; SU_REG_R2 ���ν��� ȣ��
	RET
SU_REG ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_REG_R0 PROC
;	Function :  Function to what is second Register && Register's SUB calculation 
;				when SUB's Addressing Mode is Register Adressing Mode and first Register is RO	
;
;========33333========<<<<<<<<<<����>>>>>>>>>>>===============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

SU_REG_R0 PROC	

	
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEMBX��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE SU_REG_R0R0			; DL�� 0�� ������ SU_REG_R0R0���� ����
	CMP DL, 4				; DL�� 4�� ���Ѵ�
	JE SU_REG_R0R1			; DL�� 4�� ������ SU_REG_R0R1���� ����
	CMP DL, 8				; DL�� 8�� ���Ѵ�
	JE SU_REG_R0R2			; DL�� 8�� ������ SU_REG_R0R2�� ����
	CMP DL, 12				; DL�� 12�� ���Ѵ�
	JE SU_REG_R0AD			; DL�� 12�� ������ SU_REG_R0AD�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
SU_REG_R0R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	SUB R0, DX				; R0���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_REG_R0R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	SUB R0, DX				; R0���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	SUB R0, DX				; R0���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_REG_R0AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	SUB MEM[BX], DX			; MEM[BX]��ġ�� �ִ� ���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
	RET
	SU_REG_R0 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_REG_R1 PROC
;	Function :  Function to what is second Register && Register's SUB calculation 
;				when SUB's Addressing Mode is Register Adressing Mode and first Register is R1	
;
;========33333========<<<<<<<<<<����>>>>>>>>>>>==============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

SU_REG_R1 PROC

	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE SU_REG_R1R0			; DL�� 0�� ������ SU_REG_R1R0���� ����
	CMP DL, 4				; DL�� 4�� ���Ѵ�
	JE SU_REG_R1R1			; DL�� 4�� ������ SU_REG_R1R1���� ����
	CMP DL, 8				; DL�� 8�� ���Ѵ�
	JE SU_REG_R1R2			; DL�� 8�� ������ SU_REG_R1R2�� ����
	CMP DL, 12				; DL�� 12�� ���Ѵ�
	JE SU_REG_R1AD			; DL�� 12�� ������ SU_REG_R1AD�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
SU_REG_R1R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	SUB R1, DX				; R1���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_REG_R1R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	SUB R1, DX				; R1���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_REG_R1R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	SUB R1, DX				; R1���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_REG_R1AD:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	SUB MEM[BX], DX			; MEM[BX]��ġ�� �ִ� ���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
	RET
	SU_REG_R1 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_REG_R2 PROC
;	Function :  Function to what is second Register && Register's SUB calculation 
;				when SUB's Addressing Mode is Register Adressing Mode and first Register is R2	
;
;========33333=========<<<<<<<<<<����>>>>>>>>>>>=============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

SU_REG_R2 PROC

	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE SU_REG_R2R0			; DL�� 0�� ������ SU_REG_R2R0���� ����
	CMP DL, 4				; DL�� 4�� ���Ѵ�
	JE SU_REG_R2R1			; DL�� 4�� ������ SU_REG_R2R1���� ����
	CMP DL, 8				; DL�� 8�� ���Ѵ�
	JE SU_REG_R2R2			; DL�� 8�� ������ SU_REG_R2R2�� ����
	CMP DL, 12				; DL�� 12�� ���Ѵ�
	JE SU_REG_R2AD			; DL�� 12�� ������ SU_REG_R2AD�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						; ERRORMESSAGE ���ν��� ȣ��
	
SU_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	SUB R2, DX				; R2���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_REG_R2R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	SUB R2, DX				; R2���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	SUB R2, DX				; R2���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_REG_R2AD:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	SUB MEM[BX], DX			; MEM[BX]��ġ�� �ִ� ���� DX�� ����
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
	RET
SU_REG_R2 ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_IMM PROC		
;	Function : Function to SUB calculation when SUB's Addressing Mode is Immediate
;
;========33333==========<<<<<<<<<<����>>>>>>>>>>>=========
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------

SU_IMM PROC					; immediate	

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_SUIMM			; �ƴ϶�� ERROR_SUIMM��
	
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 2��Ʈ �̵���Ų��
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE SU_IMM_R0				; DL�� 0�� ������ SU_IMM_R0�� ����
	CMP DL, 1				; DL�� 1�� ���Ѵ�
	JE SU_IMM_R1				; DL�� 1�� ������ SU_IMM_R1�� ����
	CMP DL, 2				; DL�� 2�� ���Ѵ�
	JE SU_IMM_R2				; DL�� 2�� ������ SU_IMM_R2�� ����
ERROR_SUIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
SU_IMM_R0:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SUB R0, DX				; R0���� DX�� ����
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_IMM_R1:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SUB R1, DX				; R1���� DX�� ����
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis 				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_IMM_R2:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SUB R2, DX				; R2���� DX�� ����
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��

	RET
SU_IMM ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - SU_DIR PROC
;	Function : Function to SUB calculation when SUB's Addressing Mode is Direct Addressing Mode
;
;=======33333==========<<<<<<<<<<����>>>>>>>>>>>==============
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;-------------------------------------------------------------------------------

SU_DIR PROC					; direct

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_SUDIR			; �ƴ϶�� ERROR_SUDIR��

	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 2��Ʈ �̵���Ų��
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE SU_DIR_R0				; DL�� 0�� ������ SU_DIR_R0�� ����
	CMP DL, 1				; DL�� 1�� ���Ѵ�
	JE SU_DIR_R1				; DL�� 1�� ������ SU_DIR_R1�� ����
	CMP DL, 2				; DL�� 2�� ���Ѵ�
	JE SU_DIR_R2				; DL�� 2�� ������ SU_DIR_R2�� ����
ERROR_SUDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
SU_DIR_R0:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� �̵���Ų��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]	    	      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SUB R0, DX				; R0���� DX�� ����
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_DIR_R1:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� �̵���Ų��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SUB R1, DX				; R1���� DX�� ����
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
SU_DIR_R2:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� �̵���Ų��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SUB R2, DX				; R2���� DX�� ����

	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
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
	shr dl, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	cmp dl, 0			; DL�� 0(Register Addressing Mode)���� ��
	je WHAT_AND_REG		; DL�� 0�� ������ WHAT_AND_REG�� ����
	cmp dl, 1		      ; DL�� 1(Immediate Addressing Mode)���� ��
	JE WHAT_AND_IMM		; DL�� 1�� ������ WHAT_AND_IMM�� ����
	cmp dl, 2			; DL�� 2(Direct Addressing Mode)���� ��
	JE WHAT_AND_DIR		; DL�� 2�� ������ WHAT_AND_DIR�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
WHAT_AND_REG:
	CALL AND_REG				; AND_REG ���ν��� ȣ��
WHAT_AND_IMM:
	CALL AND_IMM				; AND_IMM ���ν��� ȣ��
WHAT_AND_DIR:
	CALL AND_DIR				; AND_DIR ���ν��� ȣ��
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
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 2��Ʈ �̵���Ų��
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE WHAT_AND_REG_R0		; DL�� 0�� ������ WHAT_AND_REG_R0�� ����
	CMP DL, 1				; DL�� 1�� ���Ѵ�
	JE WHAT_AND_REG_R1		; DL�� 1�� ������ WHAT_AND_REG_R1�� ����
	CMP DL, 2				; DL�� 2�� ���Ѵ�
	JE WHAT_AND_REG_R2		; DL�� 2�� ������ WHAT_AND_REG_R2�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						; ERRORMESSAGE ���ν��� ȣ��
	
WHAT_AND_REG_R0:
	CALL AND_REG_R0			; AND_REG_R0 ���ν��� ȣ��
WHAT_AND_REG_R1:
	CALL AND_REG_R1			; AND_REG_R1 ���ν��� ȣ��
WHAT_AND_REG_R2:
	CALL AND_REG_R2			; AND_REG_R2 ���ν��� ȣ��
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

	
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		       ; MEMBX��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE AND_REG_R0R0		; DL�� 0�� ������ AND_REG_R0R0���� ����
	CMP DL, 4				; DL�� 4�� ���Ѵ�
	JE AND_REG_R0R1		; DL�� 4�� ������ AND_REG_R0R1���� ����
	CMP DL, 8				; DL�� 8�� ���Ѵ�
	JE AND_REG_R0R2		; DL�� 8�� ������ AND_REG_R0R2�� ����
	CMP DL, 12				; DL�� 12�� ���Ѵ�
	JE AND_REG_R0AD		; DL�� 12�� ������ AND_REG_R0AD�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						; ERRORMESSAGE ���ν��� ȣ��
	
AND_REG_R0R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	AND R0, DX				; R0�� DX�� AND�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_REG_R0R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	AND R0, DX				; R0�� DX�� AND�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	AND R0, DX				; R0�� DX�� AND�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_REG_R0AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	AND MEM[BX], DX	; MEM[BX]��ġ�� �ִ� ���� DX�� AND���� �Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
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

	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE AND_REG_R1R0		; DL�� 0�� ������ AND_REG_R1R0���� ����
	CMP DL, 4				; DL�� 4�� ���Ѵ�
	JE AND_REG_R1R1		; DL�� 4�� ������ AND_REG_R1R1���� ����
	CMP DL, 8				; DL�� 8�� ���Ѵ�
	JE AND_REG_R1R2		; DL�� 8�� ������ AND_REG_R1R2�� ����
	CMP DL, 12				; DL�� 12�� ���Ѵ�
	JE AND_REG_R1AD		; DL�� 12�� ������ AND_REG_R1AD�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
AND_REG_R1R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	AND R1, DX				; R1�� DX�� AND�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_REG_R1R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	AND R1, DX				; R1�� DX�� AND�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_REG_R1R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	AND R1, DX				; R1�� DX�� AND�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_REG_R1AD:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	AND MEM[BX], DX	; MEM[BX]��ġ�� �ִ� ���� DX�� AND �����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
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
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]	  	      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE AND_REG_R2R0		; DL�� 0�� ������ AND_REG_R2R0���� ����
	CMP DL, 4				; DL�� 4�� ���Ѵ�
	JE AND_REG_R2R1		; DL�� 4�� ������ AND_REG_R2R1���� ����
	CMP DL, 8				; DL�� 8�� ���Ѵ�
	JE AND_REG_R2R2		; DL�� 8�� ������ AND_REG_R2R2�� ����
	CMP DL, 12				; DL�� 12�� ���Ѵ�
	JE AND_REG_R2AD		; DL�� 12�� ������ AND_REG_R2AD�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
AND_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	AND R2, DX				; R2�� DX�� AND�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_REG_R2R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	AND R2, DX				; R2�� DX�� AND�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	AND R2, DX				; R2�� DX�� AND�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_REG_R2AD:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	AND MEM[BX], DX		; MEM[BX]��ġ�� �ִ� ���� DX�� AND�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
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

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_ANDIMM			; �ƴ϶�� ERROR_ANDIMM��
	
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		       ; MEMBX��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1
	SHL DL, 1			   ; DL�� �ִ� ���� �������� 2��Ʈ �̵���Ų��

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE AND_IMM_R0			      ; DL�� 0�� ������ ADD_IMM_R0�� ����
	CMP DL, 1				; DL�� 1�� ���Ѵ�
	JE AND_IMM_R1			      ; DL�� 1�� ������ ADD_IMM_R1�� ����
	CMP DL, 2				; DL�� 2�� ���Ѵ�
	JE AND_IMM_R2			      ; DL�� 2�� ������ ADD_IMM_R2�� ����
ERROR_ANDIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
AND_IMM_R0:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	AND R0, DX				; R0�� DX�� AND�����Ѵ�
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_IMM_R1:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	AND R1, DX				; R1�� DX�� AND�����Ѵ�
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_IMM_R2:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]	    	      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	AND R2, DX				; R2�� DX�� AND�����Ѵ�
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��

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

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_ANDDIR			; �ƴ϶�� ERROR_ANDDIR��

	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 2��Ʈ �̵���Ų��
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1			 ; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE AND_DIR_R0			     ; DL�� 0�� ������ AND_DIR_R0���� ����
	CMP DL, 1				; DL�� 1�� ���Ѵ�
	JE AND_DIR_R1			     ; DL�� 1�� ������ AND_DIR_R1���� ����
	CMP DL, 2				; DL�� 2�� ���Ѵ�
	JE AND_DIR_R2			       ; DL�� 2�� ������ AND_DIR_R2�� ����

ERROR_ANDDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
AND_DIR_R0:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� �̵���Ų��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��	
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	AND R0, DX				; R0�� DX�� AND�����Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_DIR_R1:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� �̵���Ų��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]	              ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	AND R1, DX				; R1�� DX�� AND�����Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��	
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
AND_DIR_R2:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� �̵���Ų��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	AND R2, DX				; R2�� DX�� AND�����Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
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
	shr dl, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	cmp dl, 0			; DL�� 0(Register Addressing Mode)���� ��
	je WHAT_OR_REG		; DL�� 0�� ������ WHAT_OR_REC�� ����
	cmp dl, 1		      ; DL�� 1(Immediate Addressing Mode)���� ��
	JE WHAT_OR_IMM		; DL�� 1�� ������ WHAT_OR_IMM�� ����
	cmp dl, 2			; DL�� 2(Direct Addressing Mode)���� ��
	JE WHAT_OR_DIR		; DL�� 2�� ������ WHAT_OR_DIR�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
WHAT_OR_REG:
	CALL OR_REG				; OR_REC ���ν��� ȣ��
WHAT_OR_IMM:
	CALL OR_IMM				; OR_IMM ���ν��� ȣ��
WHAT_OR_DIR:
	CALL OR_DIR				; OF_DIR ���ν��� ȣ��
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
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1
	SHL DL, 1			; DL�� �ִ� ���� �������� 2��Ʈ �̵���Ų��
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE WHAT_OR_REG_R0		; DL�� 0�� ������ WHAT_OR_REC_R0�� ����
	CMP DL, 1				; DL�� 1�� ���Ѵ�
	JE WHAT_OR_REG_R1		; DL�� 1�� ������ WHAT_OR_REC_R1�� ����
	CMP DL, 2				; DL�� 2�� ���Ѵ�
	JE WHAT_OR_REG_R2		; DL�� 2�� ������ WHAT_OR_REC_R2�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
WHAT_OR_REG_R0:
	CALL OR_REG_R0				; OR_REG_R0 ���ν��� ȣ��
WHAT_OR_REG_R1:
	CALL OR_REG_R1				; OR_REG_R1 ���ν��� ȣ��
WHAT_OR_REG_R2:
	CALL OR_REG_R2				; OR_REG_R2 ���ν��� ȣ��
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
	
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE OR_REG_R0R0			; DL�� 0�� ������ OR_REG_R0R0���� ����
	CMP DL, 4				; DL�� 4�� ���Ѵ�
	JE OR_REG_R0R1			; DL�� 4�� ������ OR_REG_R0R1���� ����
	CMP DL, 8				; DL�� 8�� ���Ѵ�
	JE OR_REG_R0R2			; DL�� 8�� ������ OR_REG_R0R2�� ����
	CMP DL, 12				; DL�� 12�� ���Ѵ�
	JE OR_REG_R0AD			; DL�� 12�� ������ OR_REG_R0AD�� ����
	call ERROR_MESSAGE			; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
OR_REG_R0R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	OR R0, DX				; R0�� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
OR_REG_R0R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	OR R0, DX				; R0�� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
OR_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0 				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	OR R0, DX				; R0�� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
OR_REG_R0AD:	
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	OR MEM[BX], DX		; MEM[BX]��ġ�� �ִ� ���� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
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

	
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1			; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE OR_REG_R1R0			; DL�� 0�� ������ OR_REG_R1R0���� ����
	CMP DL, 4				; DL�� 4�� ���Ѵ�
	JE OR_REG_R1R1			; DL�� 4�� ������ OR_REG_R1R1���� ����
	CMP DL, 8				; DL�� 8�� ���Ѵ�
	JE OR_REG_R1R2			; DL�� 8�� ������ OR_REG_R1R2�� ����
	CMP DL, 12				; DL�� 12�� ���Ѵ�
	JE OR_REG_R1AD			; DL�� 12�� ������ OR_REG_R1AD�� ����
	call ERROR_MESSAGE		; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						
							;ERRORMESSAGE ���ν��� ȣ��
	
OR_REG_R1R0:
	CALL CHK_ZERO			; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	OR R1, DX				; R1�� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis			; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE			; A_WRITE ���ν��� ȣ��
OR_REG_R1R1:
	CALL CHK_ZERO			; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	OR R1, DX				; R1�� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis			; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE			; A_WRITE ���ν��� ȣ��
OR_REG_R1R2:
	CALL CHK_ZERO			; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	OR R1, DX				; R1�� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis			; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE			; A_WRITE ���ν��� ȣ��
OR_REG_R1AD:
	CALL MAKE_ADDRESS		; MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	OR MEM[BX], DX			; MEM[BX]��ġ�� �ִ� ���� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis			; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE			; A_WRITE ���ν��� ȣ��
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
	
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]			; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL�� �ִ� ���� �������� 4��Ʈ �̵���Ų��

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				; DL�� �ִ� ���� ���������� 4��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE OR_REG_R2R0			; DL�� 0�� ������ OR_REG_R2R0���� ����
	CMP DL, 4				; DL�� 4�� ���Ѵ�
	JE OR_REG_R2R1			; DL�� 4�� ������ OR_REG_R2R1���� ����
	CMP DL, 8				; DL�� 8�� ���Ѵ�
	JE OR_REG_R2R2			; DL�� 8�� ������ OR_REG_R2R2�� ����
	CMP DL, 12				; DL�� 12�� ���Ѵ�
	JE OR_REG_R2AD			; DL�� 12�� ������ OR_REG_R2AD�� ����
	call ERROR_MESSAGE		; �̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						
							; ERRORMESSAGE ���ν��� ȣ��
	
OR_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R0				; R0�� DX�� �̵���Ų��
	OR R2, DX				; R2�� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
OR_REG_R2R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R1				; R1�� DX�� �̵���Ų��
	OR R2, DX				; R2�� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
OR_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				; 0�� DX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	OR R2, DX				; R2�� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
OR_REG_R2AD:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, R2				; R2�� DX�� �̵���Ų��
	OR MEM[BX], DX		; MEM[BX]��ġ�� �ִ� ���� DX�� OR�����Ѵ�
	ADD PC, 4				; PC�� 4�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
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

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_ORIMM			; �ƴ϶�� ERROR_ORIMM��

	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1
	SHL DL, 1			; DL�� �ִ� ���� �������� 2��Ʈ �̵���Ų��
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE OR_IMM_R0			; DL�� 0�� ������ OR_IMM_R0���� ����
	CMP DL, 1				; DL�� 1�� ���Ѵ�
	JE OR_IMM_R1			; DL�� 1�� ������ OR_IMM_R1���� ����
	CMP DL, 2				; DL�� 2�� ���Ѵ�
	JE OR_IMM_R2				; DL�� 2�� ������ OR_IMM_R2�� ����
	
ERROR_ORIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��

OR_IMM_R0:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	OR R0, DX				; R0�� DX�� OR�����Ѵ�
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
OR_IMM_R1:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEMBX��ġ�� �ִ� ���� DX�� �ִ´�
	OR R1, DX				; R1�� DX�� OR�����Ѵ�
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
OR_IMM_R2:
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	OR R2, DX				; R2�� DX�� OR�����Ѵ�
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��

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

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_ORDIR			; �ƴ϶�� ERROR_ORDIR��

	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1
	SHL DL, 1			; DL�� �ִ� ���� �������� 2��Ʈ �̵���Ų��
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1			; DL�� �ִ� ���� ���������� 6��Ʈ �̵���Ų��
	CMP DL, 0				; DL�� 0�� ���Ѵ�
	JE OR_DIR_R0				;DL�� 0�� ������ OR_DIR_R0���� ����
	CMP DL, 1				; DL�� 1�� ���Ѵ�
	JE OR_DIR_R1				;DL�� 1�� ������ OR_DIR_R1���� ����
	CMP DL, 2				; DL�� 2�� ���Ѵ�
	JE OR_DIR_R2				; DL�� 2�� ������ OR_DIR_R2�� ����
ERROR_ORDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��

OR_DIR_R0:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� �̵���Ų��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		       ;MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	OR R0, DX				; R0�� DX�� OR�����Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
OR_DIR_R1:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� �̵���Ų��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	OR R1, DX				; R1�� DX�� OR�����Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
OR_DIR_R2:
	CALL MAKE_ADDRESS			; MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				; BX�� DX�� �̵���Ų��
	MOV BX, 0				; 0�� BX�� �̵���Ų��
	MOV BX, PC				; PC�� BX�� �̵���Ų��
	MOV PC, DX				; DX�� PC�� �̵���Ų��
	ADD PC, 2				; PC�� 2�� ���Ѵ�
	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		      ; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	OR R2, DX				; R2�� DX�� OR�����Ѵ�
	call a_mac_dis				; A_MAC_DIS ���ν��� ȣ��
	CALL A_WRITE				; A_WRITE ���ν��� ȣ��
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
CHK_NOT PROC					;not ���ν���

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_NOT				; �ƴ϶�� ERROR_NOT��

	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1				;dl�� �� �������� 2��Ʈ �̵�
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				;dl�� �� �������� 6��Ʈ �̵�
	CMP DL, 0				;dl���� 0���� ��
	JE NOT_R0				;0�̸� not_R0���̺�� �̵�
	CMP DL, 1				;dl���� 1���� ��
	JE NOT_R1				;1�̸� not_R01���̺�� �̵�
	CMP DL, 2				;dl���� 2���� ��
	JE NOT_R2				;2�̸� not_R02���̺�� �̵�
ERROR_NOT:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
NOT_R0:						;R0 �������� not
	NOT R0					;R0 not ����
	mov dx, 0				;dx�� 0�� �־��ش�
	mov dx, r0				;dx�� r0 �������� �־��ش�.
	shl dh, 1					
	shl dh, 1				;dh�� �� �������� 2��Ʈ �̵�
	shl dh, 1
	shl dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1				;dh�� �� �������� 6��Ʈ �̵�
	mov R0, dx				;dx�� �� �������� r0�� �־��ش�.
	ADD PC, 4				;pc�� 4���� ��
	call a_mac_dis				;���
	CALL A_WRITE
NOT_R1:						;R1 �������� not
	NOT R1					;R1 not ����
	mov dx, 0				;dx�� 0�� �־��ش�
	mov dx, r1				;dx�� r1 �������� �־��ش�.
	shl dh, 1
	shl dh, 1				;dh�� �� �������� 2��Ʈ �̵�
	shl dh, 1
	shl dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1				;dh�� �� �������� 6��Ʈ �̵�
	mov R1, dx				;dx�� �� �������� r1�� �־��ش�.
	ADD PC, 4				;pc�� 4���� ��
	call a_mac_dis				;���
	CALL A_WRITE
NOT_R2:						;R2 �������� not
	NOT R2					;R2 not ����
	mov dx, 0				;dx�� 0�� �־��ش�
	mov dx, r2				;dx�� r2 �������� �־��ش�.
	shl dh, 1
	shl dh, 1				;dh�� �� �������� 2��Ʈ �̵�
	shl dh, 1
	shl dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1
	shr dh, 1				;dh�� �� �������� 6��Ʈ �̵�
	mov R2, dx				;dx�� �� �������� r2�� �־��ش�.
	ADD PC, 4				;pc�� 4���� ��
	call a_mac_dis				;���
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
CHK_HLT PROC					;cpu ���� �ϴ� ���ν���
	HLT
RET						;���� ��巹��
CHK_HLT ENDP					;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_INC
;	Function : Function to increase value
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_INC PROC					;increment ���ν���

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_INC				; �ƴ϶�� ERROR_INC��

	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1				;dl�� �� �������� 2��Ʈ �̵�
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				;dl�� �� �������� 6��Ʈ �̵�
	CMP DL, 0				;dl�� ���� 0���� ��
	JE INC_R0				;�´ٸ� inc_r0 ���̺�� �̵�
	CMP DL, 1				;dl�� ���� 1���� ��
	JE INC_R1				;�´ٸ� inc_r1 ���̺�� �̵�
	CMP DL, 2				;dl�� ���� 2���� ��
	JE INC_R2				;�´ٸ� inc_r2 ���̺�� �̵�
ERROR_INC:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
INC_R0:
	INC R0					;r0�� �� ����
	ADD PC, 4				;pc�� +4
	call a_mac_dis				;���÷���
	CALL A_WRITE
INC_R1:
	INC R1					;r1�� �� ����
	ADD PC, 4
	call a_mac_dis
	CALL A_WRITE
INC_R2:
	INC R2					;r2�� �� ����
	ADD PC, 4
	call a_mac_dis
	CALL A_WRITE
RET						;���� ��巹��
CHK_INC ENDP					;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_DEC
;	Function : Function to decrease value
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_DEC PROC					;decrement ���ν���
	
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_DEC				; �ƴ϶�� ERROR_DEC��

	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1				;dl�� �� �������� 2��Ʈ �̵�
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				;dl�� �� �������� 6��Ʈ �̵�
	CMP DL, 0				;dl�� ���� 0���� ��
	JE DEC_R0				;�´ٸ� dec_r0 ���̺�� �̵�
	CMP DL, 1				;dl�� ���� 1���� ��
	JE DEC_R1				;�´ٸ� dec_r1 ���̺�� �̵�
	CMP DL, 2				;dl�� ���� 2���� ��
	JE DEC_R2				;�´ٸ� dec_r2 ���̺�� �̵�
ERROR_DEC:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��	
DEC_R0:
	DEC R0					;r0�� ���� ���ҽ�Ų��
	ADD PC, 4				;pc �� +4
	call a_mac_dis				;display
	CALL A_WRITE
DEC_R1:
	DEC R1					;r1�� ���� ���ҽ�Ų��
	ADD PC, 4
	call a_mac_dis
	CALL A_WRITE
DEC_R2:
	DEC R2					;r2�� ���� ���ҽ�Ų��
	ADD PC, 4
	call a_mac_dis
	CALL A_WRITE
RET						;���� ��巹��
CHK_DEC ENDP					;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_CMP
;	Function : Function to compare A with B(ex. CMP A, B)
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_CMP PROC					;��ɾ cmp(101010)���� Ȯ��
	shr dl, 1					
	shr dl, 1					;dl �������� 2��Ʈ �̵�
	shr dl, 1
	shr dl, 1
	shr dl, 1
	shr dl, 1					;dl �������� 4��Ʈ �̵�
	cmp dl, 0				;dl�� ���� 0���� ��
	je WHAT_CMP_REG			;�´ٸ�WHAT_CMP_REG ���̺���̵�
	cmp dl, 1	;immediate		;dl �� 1���� ��
	JE WHAT_CMP_IMM			;�´ٸ�WHAT_CMP_IMM ���̺���̵�
	cmp dl, 2	;direct			;dl �� 2���� ��
	JE WHAT_CMP_DIR			;�´ٸ�WHAT_CMP_DIR���̺���̵�
	call ERROR_MESSAGE			;�̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
WHAT_CMP_REG:
	CALL CMP_REG
WHAT_CMP_IMM:
	CALL CMP_IMM
WHAT_CMP_DIR:
	CALL CMP_DIR
RET						;���� ��巹��
CHK_CMP ENDP					;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_CMP
;	Function : Function to divide CMP operation what addressing mode implements.
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_REG PROC					;register addressing mode ����
	MOV DX, 0
	MOV DX, MEM[BX]		      ;mem[bx] ��ġ�� �ִ� ���� dx�� �ִ´�.
	
	SHR DL, 1		
	SHR DL, 1				;dl�� �������� 2��Ʈ �̵�
	SHR DL, 1
	SHR DL, 1				;dl�� �������� 2��Ʈ �̵�
	CMP DL, 0				;dl�� 0���� ��
	JE WHAT_CMP_REG_R0			;0�̶�� register r0�� cmp�� ����
	CMP DL, 1				;dl�� 1���� ��
	JE WHAT_CMP_REG_R1			;1�̶�� register r1�� cmp�� ����
	CMP DL, 2				;dl�� 2���� ��
	JE WHAT_CMP_REG_R2			;2�̶�� register r2�� cmp�� ����
	call ERROR_MESSAGE			;�̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
WHAT_CMP_REG_R0:
	CALL CMP_REG_R0			; CMP_REG_R0���ν��� ȣ��
WHAT_CMP_REG_R1:
	CALL CMP_REG_R1			; CMP_REG_R1���ν��� ȣ��
WHAT_CMP_REG_R2:	
	CALL CMP_REG_R2			; CMP_REG_R2���ν��� ȣ��
RET						;���� ��巹��
CMP_REG ENDP					;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CMP_REG_R0
;	Function : Function to implements Register addressing mode R0 at CMP
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_REG_R0 PROC			;register addressing mode �� r0 ���ν���
	
	MOV DX, 0
	MOV DX, MEM[BX]			;mem[bx]��ġ�� ���� dx�� �־��ش�.
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				;dl�� �������� 4��Ʈ �̵�

	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1				;dl�� ���������� 4��Ʈ �̵�
	CMP DL, 0				;dl�� 0���� ��
	JE CMP_REG_R0R0			;�´ٸ� r0r0���̺�� �̵�
	CMP DL, 4				;dl�� 4���� ��
	JE CMP_REG_R0R1			;�´ٸ� r0r1���̺�� �̵�
	CMP DL, 8				;dl�� 8���� ��
	JE CMP_REG_R0R2			;�´ٸ� r0r2���̺�� �̵�
	CMP DL, 12				;dl�� 12���� ��
	JE CMP_REG_R0AD			;�´ٸ� r0AD���̺�� �̵�
	call ERROR_MESSAGE			;�̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
	
CMP_REG_R0R0:	
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��	
	MOV DX, 0
	MOV DX, R0				;r0�� ���� dx�� �ְ�
	ADD PC, 4				;pc�� +4
	CMP R0, DX				;dx�� ���� r0 ��
	JE CP_PSW00				;���ٸ� psw00���� �̵�
	call a_mac_dis				;display
	CALL A_WRITE
CP_PSW00:
	CALL P_PSW				;psw�� 1 �ű�� ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE
CMP_REG_R0R1:	
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��			
	MOV DX, 0				
	MOV DX, R1				;r1�� ���� dx�� �ְ�
	ADD PC, 4				;pc�� +4
	CMP R0, DX				;dx�� ���� r1 ��
	JE CP_PSW01				;���ٸ� psw01���� �̵�
	call a_mac_dis				;display
	CALL A_WRITE
CP_PSW01:
	CALL P_PSW				;p_psw ���ν��� ȣ��
	call a_mac_dis
	CALL A_WRITE
CMP_REG_R0R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0
	MOV DX, R2				;r2�� ���� dx�� �ְ�
	ADD PC, 4				;pc�� +4
	CMP R0, DX				;dx�� ���� r2 ��
	JE CP_PSW02				;���ٸ� psw02���� �̵�
	call a_mac_dis				;display
	CALL A_WRITE
CP_PSW02:
	CALL P_PSW				;p_psw ���ν��� ȣ��
	call a_mac_dis
	CALL A_WRITE
CMP_REG_R0AD:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				;bx�� 0 �־���
	MOV DX, 0				;dx�� 0 �־���
	MOV BX, PC				;pc�� bx�� �̵�
	ADD PC, 4				;pc+4
	MOV DX, R0				;r0�� �� dx�� �ִ´�
	CMP MEM[BX], DX			;mem[bx]��ġ�� ���� dx�� ������ ��
	JE CP_PSW0AD				;���ٸ� cp_psword�� �̵�
	call a_mac_dis
	CALL A_WRITE
CP_PSW0AD:					
	CALL P_PSW				;psw�� 1 �̵���Ű�� ���ν��� ȣ��
	call a_mac_dis				;display 
	CALL A_WRITE				;write procedure
	RET					;���� ��巹��
	CMP_REG_R0 ENDP			;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CMP_REG_R1
;	Function : Function to implements Register addressing mode R1 at CMP
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_REG_R1 PROC			;R1�������� register addressing mode
	
	MOV DX, 0				;DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]		;bx�� �޸� �ּҰ� ����Ű�� ���� dx�� �ְ�
	SHL DL, 1			;DL�� ��Ʈ�� �������� 1��Ʈ�� �̵���Ų��.
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1

	SHR DL, 1	       ;DL�� ��Ʈ�� ���������� 1��Ʈ�� �̵����� ���ڸ��� ����
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				;DL�� 0�ΰ�
	JE CMP_REG_R1R0			;�´ٸ�CMP_REG_R1R0�Ƿ��̺���̵�
	CMP DL, 4				;DL�� 4�ΰ�
	JE CMP_REG_R1R1			;�´ٸ�CMP_REG_R1R1�Ƿ��̺���̵�
	CMP DL, 8				;DL�� 8�ΰ�
	JE CMP_REG_R1R2			;�´ٸ�CMP_REG_R1R2�Ƿ��̺���̵�
	CMP DL, 12				;DL�� 12�ΰ�
	JE CMP_REG_R1AD			;�´ٸ�CMP_REG_R1AD�Ƿ��̺���̵�
	call ERROR_MESSAGE			;�̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						;ERRORMESSAGE ���ν��� ȣ��
CMP_REG_R1R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				;dx 0���� �ʱ�ȭ
	MOV DX, R0				;dx�� R0�� ����
	ADD PC, 4				;pc+4 ����
	CMP R1, DX				;dx�� r1�� ��
	JE CP_PSW10				;���ٸ� CP_PSW10���̺�� �̵�
	call a_mac_dis				;macro display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSW10:
	CALL P_PSW				;psw�� 1����
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CMP_REG_R1R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				;dx 0���� �ʱ�ȭ
	MOV DX, R1				;dx�� R1�� ����
	ADD PC, 4				;pc+4 ����
	CMP R1, DX				;R1�� DX ��
	JE CP_PSW11				;������ CP_PSW11���̺�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSW11:
	CALL P_PSW				
	call a_mac_dis
	CALL A_WRITE				;simulator command �Է� ����
CMP_REG_R1R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				;dx 0���� �ʱ�ȭ
	MOV DX, R2				;dx�� R2�� ����
	ADD PC, 4				;pc+4 ����
	CMP R1, DX				;R1�� DX ����
	JE CP_PSW12				;������ CP_PSW12 ���̺�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSW12:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CMP_REG_R1AD:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				;BX 0���� �ʱ�ȭ
	MOV DX, 0				;dx 0���� �ʱ�ȭ
	MOV BX, PC				;PC�� BX�� ����
	ADD PC, 4				;pc+4 ����
	MOV DX, R1				;DX�� R1�� ����
	CMP MEM[BX], DX			;bx�� �޸𸮰� ����Ű�� ���� dx��
	JE CP_PSW1AD				;������ CP_PSW1AD���̺�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSW1AD:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
	RET					;���� ��巹��
	CMP_REG_R1 ENDP			;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CMP_REG_R2
;	Function : Function to implements Register addressing mode R2 at CMP
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_REG_R2 PROC				;R2 register ���ν���

	MOV DX, 0				;dx 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			;dx�� bx�� �޸𸮰� ����Ű�� �� ����
	SHL DL, 1				;DL�� ��Ʈ�� �������� 1�� �̵�
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1

	SHR DL, 1				;DL ��Ʈ�� �ٽ� ���������� 1�� �̵�
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				;0���� �Ǵ�
	JE CMP_REG_R2R0			;register R2R0���̺�� �̵�
	CMP DL, 4				;4���� �Ǵ�
	JE CMP_REG_R2R1			;register R2R1���̺�� �̵�
	CMP DL, 8				;8���� �Ǵ�
	JE CMP_REG_R2R2			;register R2R2���̺�� �̵�
	CMP DL, 12				;12���� �Ǵ�
	JE CMP_REG_R2AD			;register R2AD���̺�� �̵�
	call ERROR_MESSAGE			;�̿ܿ� �ٸ� ���ڸ� �Է����� ��� 						; ERRORMESSAGE ���ν��� ȣ��
	
CMP_REG_R2R0:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				;dx 0���� �ʱ�ȭ
	MOV DX, R0				;dx�� r0�� ����
	ADD PC, 4				;pc+4 ����
	CMP R2, DX				;R2���� dx ��
	JE CP_PSW20				;������ CP_PSW20 ���̺�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSW20:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CMP_REG_R2R1:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX, 0				;dx 0���� �ʱ�ȭ
	MOV DX, R1				;DX�� R1�� ����
	ADD PC, 4				;pc+4 ����
	CMP R2, DX				;dx�� r2�� ��

	JE CP_PSW21
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSW21:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CMP_REG_R2R2:
	CALL CHK_ZERO				; CHK_ZERO���ν��� ȣ��
	MOV DX,0				;dx 0���� �ʱ�ȭ
	MOV DX, R2				;DX�� R2�� ����
	ADD PC, 4				;pc+4 ����
	CMP R2, DX				;dx�� r2�� ��
	JE CP_PSW22				;������ CP_PSW22���̺�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSW22:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CMP_REG_R2AD:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS ���ν��� ȣ��
	MOV BX, 0				;bx 0���� �ʱ�ȭ
	MOV DX, 0				;dx 0���� �ʱ�ȭ
	MOV BX, PC				;bx�� pc�� ����
	ADD PC, 4				;pc+4 ����
	MOV DX, R2				;dx�� r2�� ����
	CMP MEM[BX], DX			;dx�� bx�� �ּҰ� ����Ű�� �� ��
	JE CP_PSW2AD				;������ CP_PSW2AD ���̺�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSW2AD:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
	RET					;���� ��巹��
CMP_REG_R2 ENDP				;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CMP_IMM
;	Function : Function to implements Register addressing mode R1 at CMP
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_IMM PROC					;immediate	

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_CMPIMM			; �ƴ϶�� ERROR_CMPIMM��

	MOV DX, 0				;DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			;dx�� bx�� �ּҰ� ����Ű�� �� ����
	SHL DL, 1				;dl ��Ʈ �������� �� ĭ�� �̵�
	SHL DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				;dl�� 0���� ��
	JE CMP_IMM_R0				;0�̶�� CMP_IMM_R0���̺�� �̵�
	CMP DL, 1				;1�̶��
	JE CMP_IMM_R1				;0�̶�� CMP_IMM_R1���̺�� �̵�
	CMP DL, 2				;dl 2���� ��
	JE CMP_IMM_R2				;0�̶�� CMP_IMM_R2���̺�� �̵�
ERROR_CMPIMM:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
CMP_IMM_R0:
	ADD PC, 2				;pc+2 ����
	MOV BX, PC				;bx�� pc�� ����
	MOV DX, MEM[BX]			;dx�� bx�� �ּҰ� ����Ű�� �� ����
	ADD PC, 2				;pc+2 ����
	CMP R0, DX				;r0�� dx ��
	JE CP_PSW0				;���ٸ� CP_PSW0���̺�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSW0:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����

CMP_IMM_R1:
	ADD PC, 2				;pc+2 ����
	MOV BX, PC				;bx�� pc�� ����
	MOV DX, MEM[BX]			;dx�� bx�� �ּҰ� ����Ű�� �� ����
	ADD PC, 2				;pc+2 ����
	CMP R1, DX				;R1�� dx�� ��
	JE CP_PSW1				;���ٸ� CP_PSW1�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSW1:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CMP_IMM_R2:
	ADD PC, 2				;pc+2 ����
	MOV BX, PC				;bx�� pc�� ����
	MOV DX, MEM[BX]			;dx�� bx�� �ּҰ� ����Ű�� �� ����
	ADD PC, 2				;pc+2 ����
	CMP R2, DX				;R2�� dx�� ��
	JE CP_PSW2				;���ٸ� CP_PSW2�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSW2:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����

	RET					;���� ��巹��
CMP_IMM ENDP					;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CMP_DIR
;	Function : Function to Direct address;
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CMP_DIR PROC					;direct

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_CMPDIR			; �ƴ϶�� ERROR_CMPDIR��
	
	MOV DX, 0				;DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			;dx�� bx�� �ּҰ� ����Ű�� �� ����
	SHL DL, 1				;dl ��Ʈ�� �������� �� ĭ�� �̵�
	SHL DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				;dl�� 0���� ��
	JE CMP_DIR_R0				;���ٸ� CMP_DIR_R0���̺�� �̵�
	CMP DL, 1				;DL�� 1���� ��
	JE CMP_DIR_R1				;���ٸ� CMP_DIR_R1���̺�� �̵�
	CMP DL, 2				;DL�� 2���� ��
	JE CMP_DIR_R2				;���ٸ� CMP_DIR_R2���̺�� �̵�
	ERROR_CMPDIR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
CMP_DIR_R0:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				;DX�� BX�� ����
	MOV BX, 0				;bx 0���� �ʱ�ȭ
	MOV BX, PC				;bx�� pc�� ����
	MOV PC, DX				;pc�� dx�� ����
	ADD PC, 2				;PC+2 ����
	MOV DX, 0				;dx 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			;dx�� bx�� �ּҰ� ����Ű�� �� ����
	CMP R0, DX				;R0�� dx�� ��
	JE CP_PSWD0				;���ٸ� CP_PSWD0���̺�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSWD0:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CMP_DIR_R1:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				;bx�� dx�� ����
	MOV BX, 0				;bx 0���� �ʱ�ȭ
	MOV BX, PC				;bx�� pc�� ����
	MOV PC, DX				;pc�� dx�� ����
	ADD PC, 2				;pc+2 ����
	MOV DX, 0				;DX 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			;dx�� bx�� �ּҰ� ����Ű�� �� ����
	CMP R1, DX				;R1�� DX�� ��
	JE CP_PSWD1				;���ٸ� CP_PSWD1���̺�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSWD1:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CMP_DIR_R2:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS ���ν��� ȣ��
	MOV DX, BX				;dx�� bx�� ����
	MOV BX, 0				;bx �ʱ�ȭ
	MOV BX, PC				;bx�� pc�� ����
	MOV PC, DX				;pc�� dx�� ����
	ADD PC, 2				;pc+2 ����
	MOV DX, 0				;dx�ʱ�ȭ
	MOV DX, MEM[BX]			;dx�� bx�� �ּҰ� ����Ű�� �� ����
	CMP R2, DX				;r1�� dx�� ��
	JE CP_PSWD2				;������ CP_PSWD2 ���̺�� �̵�
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
CP_PSWD2:
	CALL P_PSW				;P_PSW ���ν��� ȣ��
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
RET						;���� ��巹��
CMP_DIR ENDP					;���ν��� ����
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
	MOV PSW, 1				;psw�� 1�� �ִ´�.
RET						;���� ��巹��
P_PSW ENDP					;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_BEQ
;	Function : Function to check PSW number and determine what you want simulator command
;		
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_BEQ PROC

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_BEQ				; �ƴ϶�� ERROR��
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHR DL, 1				;DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_BEQ				; �ƴ϶�� ERROR_BEQ��
	JMP COMPARE_PSW			; ������ COMPARE_PSW�� �̵�

ERROR_BEQ:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
COMPARE_PSW:
	CMP PSW, 1				;PSW�� 1���� ��
	JE PSW_1				;�´ٸ� PSW_1�� �̵�
	ADD PC, 4				; PC = PC + 4
	call a_mac_dis				;display
	CALL A_WRITE				; simulator command �Է� ����
PSW_1:
	CALL MAKE_ADDRESS			;MAKE_ADDRESS ���ν��� ȣ��
	MOV PSW, 0				;PSW�� 0�� �� �־���
	call a_mac_dis				;display
	CALL A_WRITE				; simulator command �Է� ����
RET						;���� ��巹��
CHK_BEQ ENDP					;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - CHK_SHR
;	Function : Function to move a bit left and rigth and then, check the number to decide on direction
;
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
CHK_SHR PROC				

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			; MEM[BX]�� DX��
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1				; DL<<4
	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				; DL>>4
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_SHR				; �ƴ϶�� ERROR_SHR��

	MOV DX, 0				; 0�� DX�� �̵���Ų��
	MOV DX, MEM[BX]		; MEM[BX]��ġ�� �ִ� ���� DX�� �ִ´�
	SHL DL, 1	
	SHL DL, 1			; DL�� �ִ� ���� �������� 2��Ʈ �̵���Ų��
	SHR DL, 1	
	SHR DL, 1	
	SHR DL, 1				;DL��Ʈ �� ���������� �� ��Ʈ�� �̵�
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				;�̵��� �Ŀ� DL���� 0���� Ȯ��
	JE SHR_R0				;�´ٸ� SHR_R0 ���̺� �̵�
	CMP DL, 1				;�̵��� �Ŀ� DL���� 1���� Ȯ��
	JE SHR_R1				;�´ٸ� SHR_R1 ���̺� �̵�
	CMP DL, 2				;�̵��� �Ŀ� DL���� 2���� Ȯ��
	JE SHR_R2				;�´ٸ� SHR_R2 ���̺� �̵�
ERROR_SHR:
	CALL ERROR_MESSAGE			; ERRORMESSAGE���ν��� ȣ��
SHR_R0:
	ADD PC, 2				;pc+2 ����
	MOV BX, PC				;bx�� pc�� ����
	MOV DX, 0				;dx 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			;dx�� bx�� �ּҰ� ����Ű�� �� ����
	MOV CX, DX				;CX�� DX�� ����(���� Ƚ��)
	SHR_LP0:				
	SHR R0, 1				;R0 ��Ʈ�� �� ĭ ���������� �̵�
	LOOP SHR_LP0				;SHR_LP0 ���̺� ���� ����
	ADD PC, 2				;pc+2 ����
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
SHR_R1:
	ADD PC, 2				;pc+2 ����
	MOV BX, PC				;bx�� pc�� ����
	MOV DX, 0				;dx 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			;dx�� bx�� �ּҰ� ����Ű�� �� ����
	MOV CX, DX				;CX�� DX�� ����(���� Ƚ��)
	SHR_LP1:
	SHR R1, 1				;R1 ��Ʈ�� �� ĭ ���������� �̵�
	LOOP SHR_LP1				;SHR_LP1 ���̺� ���� ����
	ADD PC, 2				;pc+2 ����
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
SHR_R2:
	ADD PC, 2				;pc+2 ����
	MOV BX, PC				;bx�� pc�� ����
	MOV DX, 0				;dx 0���� �ʱ�ȭ
	MOV DX, MEM[BX]			;dx�� bx�� �ּҰ� ����Ű�� �� ����
	MOV CX, DX				;CX�� DX�� ����(���� Ƚ��)
	SHR_LP2:
	SHR R2, 1				;R2 ��Ʈ�� �� ĭ ���������� �̵�
	LOOP SHR_LP2				;SHR_LP2 ���̺� ���� ����
	ADD PC, 2				;pc+2 ����
	call a_mac_dis				;display
	CALL A_WRITE				;simulator command �Է� ����
RET						;���� ��巹��
CHK_SHR ENDP					;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - JUDGE_ADD
;	Function : Function to add right ASKII to make chracter type integer
;
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
JUDGE_ADD PROC				;���ϴ°�
CMP DL, 10					;DL�� 10���� ��
JNL HEX_ADD				;10�̻��� ��쿡 HEX_ADD���̺�� �̵�
JMP A_CP_DE					;10������ ��쿡 A_CP_DE�� ����
HEX_ADD:					
	ADD DL, 55			;DL�� 55�� �����ش�(�ƽ�Ű �ڵ� �� A-10=55)
	JMP EN_A				;EN_A�� ����
A_CP_DE:		
	ADD DL, 30H			;DL�� 30H �����ش�(�ƽ�Ű �ڵ� �� 0=30H)
EN_A:
	RET					;���� ��巹��
JUDGE_ADD ENDP				;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - JUDGE_SUB
;	Function : Function to subtract right ASKII to make integer
;	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
JUDGE_SUB PROC				;���°�
CMP AL, 61H					;AL�� 61H ��
JNL HEX_SUB					;61H���� ũ�ٸ� HEX_SUB�� �Ѿ��
JMP S_CP_DE					;S_CP_DE ���̺�� ����
HEX_SUB:
	SUB AL, 87			;AL-87(61H���� �ҹ��� ����~ �̹Ƿ� 					        ;������� a-87=10�� ��������, 87�� ���ش�)
	JMP EN_S				;EN_S���̺�� ����
S_CP_DE:
	SUB AL, 30H		;61h���� �۴ٸ� AL-30H(0�� �ƽ�Ű�ڵ尪�� 30H)
EN_S:
	RET					;���� ��巹��
JUDGE_SUB ENDP				;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - ADDRESS_PC_MAKE
;	Function : Function to make PC number to work to address
;
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
ADDRESS_PC_MAKE PROC	
	mov ax, 0				;ax 0���� �ʱ�ȭ
	mov pc, 0				;pc 0���� �ʱ�ȭ
	MOV AL, ADDRESS[0]			;al�� address[0]�� �־��ش�
	SUB AL, 30H		;al-30h(�ƽ�Ű�ڵ� 0�� �� ���������� ������ش�)
	ADD PC, AL				;pc+AL ����
	
	SHL PC, 1				;pc ��Ʈ�� �������� 1��ŭ �̵�
	SHL PC, 1
	SHL PC, 1
	SHL PC, 1
	
	mov ax, 0				;ax 0���� �ʱ�ȭ
	MOV AL, ADDRESS[1]			;al�� address[1] �־��ش�.
    SUB AL, 30H		;al-30h(�ƽ�Ű�ڵ� 0�� �� ���������� ������ش�)
	ADD PC, AL				;pc+AL ����
	SHL PC, 1				;pc ��Ʈ�� �������� 1��ŭ �̵�
	SHL PC, 1
	SHL PC, 1
	SHL PC, 1
	
	mov ax, 0				;ax 0���� �ʱ�ȭ

	MOV AL, ADDRESS[2]   			;al�� address[2] �־��ش�.
    SUB AL, 30H		;al-30h(�ƽ�Ű�ڵ� 0�� �� ���������� ������ش�)
	ADD PC, AL				;pc+AL ���ش�.
RET						;���� ��巹��
ADDRESS_PC_MAKE ENDP			;���ν��� ����
;----------------------------------------------------------------------------
;	PROCEDURE NAME - MAKE_ADDRESS
;	Function : Function to make address 
;
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Nov 29, 2016.11.29
;----------------------------------------------------------------------------
MAKE_ADDRESS PROC
	ADD PC, 2				;pc+2 ����
	MOV BX, PC				;bx�� pc�� ����
	MOV DX, MEM[BX]		;bx�� �޸𸮰� ����Ű�� ���� dx�� ����
	MOV ADDRESS,0				;address�� 0 �̵�
	ADD DH, 30H				;dh+30h�� dh�� �ִ´�(�ƽ�Ű�ڵ尪 0						;�� ������ ���ڷ� ������ش�)
	MOV ADDRESS[0],DH			;address[0]�� dh�� ���� �ִ´�
	SHR DL, 1			;dl�� ��Ʈ���� ���������� 1��Ʈ�� �̵�
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	ADD DL, 30H				;dl�� 30h�� �����ش�.
	MOV ADDRESS[1],DL			;address[1]�� ������ ���� �־��ش�.
	MOV DX, MEM[BX]		;bx�� �޸𸮰� ����Ű�� ���� dx�� ����
	SHL DL, 1				;dl��Ʈ�� �������� 1��Ʈ�� �̵�
	SHL DL, 1
	SHL DL, 1
	SHL DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	ADD DL, 30H				;dl�� 30h�� ���� ���� �־��ش�
	MOV ADDRESS[2],DL			;address[2]�� �� ���� �����Ѵ�.
	
	CALL ADDRESS_PC_MAKE
	RET					;���� ��巹��
	MAKE_ADDRESS ENDP			;���ν��� ����

;----------------------------------------------------------------------------
;	PROCEDURE NAME - u_write PROC
;	Function : Function to distinguish what is written on dosbox	
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;      Creation Date : Dec 08, 2016.12.08
;----------------------------------------------------------------------------
u_write PROC
	MOV DX,OFFSET PROM			; '>' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
   
	MOV AH, 01H				; ���� �Է��� �ϴ� FUNCTION(1)
	INT 21H					; ���ͷ�Ʈ


	cmp al, 'i'				; �Էµ� ���ڰ� 'i'���� �ƴ��� ���Ѵ�
	je u_i					; �Էµ� ���ڰ� 'i'�̸� u_i��
	cmp al, 'c'			; �Էµ� ���ڰ� 'c'���� �ƴ��� ���Ѵ�
	je u_c					; �Էµ� ���ڰ� 'c'�̸� u_c��
	cmp al, 'a'			; �Էµ� ���ڰ� 'a'���� �ƴ��� ���Ѵ�
	je u_a					; �Էµ� ���ڰ� 'a'�̸� a_write��
	call u_write			; �̵����� �ʾҴٸ� �ٽ� u_write ���ν��� ȣ��
u_i:
	call i_mic_interrupt			; i_mic_interrupt���ν��� ȣ��	
u_c:
	call c_mic_con				; c_mic_con���ν��� ȣ��
u_a:
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	call a_write				; a_write ���ν��� ȣ��
RET
u_write ENDP

;----------------------------------------------------------------------------
;	PROCEDURE NAME - c_mic_con proc
;	Function : Function to call procedure according to instruction code
;	PROGRAMED BY Ye Do Eun, Park Su Yeon, Kim Hye Rin, Choe Hye Jeong WITH MASM 5.0
;	PROGRAM VERSION
;		   Creation Date : Dec 08, 2016.12.08
;----------------------------------------------------------------------------

c_mic_con	PROC				;<<c�� �Է��������� ���ν���()>>
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	
	MOV DX, OFFSET uMAR_R		; 'mar<-'�� ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
    INT 21H					; ���ͷ�Ʈ
    mov bx, 0					; BX�� 0���� �ʱ�ȭ
    mov bx, pc					; PC�� BX�� MOV
	CALL show				; SHOW ���ν��� ȣ��
	
	MOV DX, OFFSET COMA			; ','�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	MOV DX, OFFSET uPC_R	; 'pc<-'�� ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	
	add pc, 4				; PC = PC + 4
	mov bx, 0				; BX�� 0���� �ʱ�ȭ
	mov bx, pc				; PC�� BX�� MOV
	CALL show				; SHOW ���ν��� ȣ��

	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	
	sub pc, 4				; PC = PC - 4

	MOV DX,OFFSET PROM			; '>' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
   
	MOV AH, 01H				; ���� �Է��� �ϴ� FUNCTION(1)
	INT 21H					; ���ͷ�Ʈ

	cmp al, 'c'			; �Էµ� ���ڰ� 'c'���� �ƴ��� ���Ѵ�
	je c_ir					; �Էµ� ���ڰ� 'c'�̸� u_c��
	call u_write				; U_WRITE ���ν��� ȣ��
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
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	
	MOV DX, OFFSET uIR_R			; 'ir<-' ���
	MOV AH, 09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	
	CALL A_MAC_CON_PRINT			; A_MAC_CON_PRINT���ν��� ȣ��
	ADD PC, 2				; PC = PC +2
	CALL A_MAC_CON_PRINT			; A_MAC_CON_PRINT���ν��� ȣ��
	SUB PC, 2				; PC = PC - 2

	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	
	MOV DX,OFFSET PROM			; '>' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	MOV AH, 01H				; ���� �Է��� �ϴ� FUNCTION(1)
	INT 21H					; ���ͷ�Ʈ

	cmp al, 'c'			; �Էµ� ���ڰ� 'c'���� �ƴ��� ���Ѵ�
	je c_marmdr				; �Էµ� ���ڰ� 'c'�̸� u_c��
	call u_write				; U_WRITE ���ν��� ȣ��
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
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ

	MOV DX, OFFSET uMAR_R		; 'mar<-' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	ADD PC, 2				; PC = PC + 2
	CALL A_MAC_CON_PRINT			; A_MAC_CON_PRINT���ν��� ȣ��
	SUB PC, 2				; PC = PC - 2

	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	
	MOV DX, OFFSET uMDR_R		;'mdr<-' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	mov bx, 0				; BX�� 0���� �ʱ�ȭ
	mov dx, 0				; DX�� 0���� �ʱ�ȭ
	MOV bx, PC				; PC�� BX�� MOV
	mov dx, mem[bx]			; MEM[BX]�� DX�� MOV

	SHL DL, 1				; DL�� �ִ� ���� �������� 2��Ʈ �̵�
	SHL DL, 1
	
	SHR DL, 1			       ; DL�� �ִ� ���� ���������� 6��Ʈ �̵�
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1

	CMP DL, 0				; DL�� 0�� ��
	je insert_r0			; DL�� 0�� ������ INSERT_R0���� ����
	CMP DL, 1	;r1			; DL�� 1�� ��
	je insert_r1			; DL�� 1�� ������ INSERT_R0���� ����
	CMP DL, 2	;r2			; DL�� 2�� ��
	je insert_r2			; DL�� 2�� ������ INSERT_R0���� ����

insert_r0:
	MOV DX, OFFSET R0_R			; 'R0' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	CALL u_write				; U_WRITE ���ν��� ȣ��
insert_r1:
	MOV DX, OFFSET R1_R			; 'R1' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	CALL u_write				; U_WRITE ���ν��� ȣ��
insert_r2:
	MOV DX, OFFSET R2_R			; 'R2' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	CALL u_write				; U_WRITE ���ν��� ȣ��
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
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ

	MOV DX, OFFSET uIST_R			; 'ist<-' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV BX, 0				; BX�� 0���� �ʱ�ȭ
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R0				; R0�� DX�� MOV
	MOV STKM[BX], 0			; STKM[BX]�� 0���� �ʱ�ȭ
	MOV STKM[BX], DX			; STKM[BX]�� DX�� MOV
	MOV DX, OFFSET R0_R			; 'R0' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	
	ADD BX, 1				; BX = BX + 1
	MOV DX, OFFSET uIST_R			;'ist<-' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R1				; R1�� DX�� MOV
	MOV STKM[BX], 0			; STKM[BX]�� 0���� �ʱ�ȭ
	MOV STKM[BX], DX			; STKM[BX]�� DX�� MOV
	MOV DX, OFFSET R1_R			; 'R1' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ

	ADD BX, 1				; BX = BX + 1
	MOV DX, OFFSET uIST_R			;'ist<-' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, R2				; R2�� DX�� MOV
	MOV STKM[BX], 0			; STKM[BX]�� 0���� �ʱ�ȭ
	MOV STKM[BX], DX			; STKM[BX]�� DX�� MOV
	MOV DX, OFFSET R2_R			; 'R2' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ

	ADD BX, 1				; BX = BX + 1
	MOV DX, OFFSET uIST_R			; 'ist<-' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, PSW				; PSW�� DX�� MOV
	MOV STKM[BX], 0			; STKM[BX]�� 0���� �ʱ�ȭ
	MOV STKM[BX], DX			; STKM[BX]�� DX�� MOV
	MOV DX, OFFSET PSW_R			; 'PSW' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ

	ADD BX, 1				; BX = BX + 1
	MOV DX, OFFSET uIST_R			; 'ist<-' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	MOV DX, PC				; PC�� DX�� MOV
	MOV STKM[BX], 0			; STKM[BX]�� 0���� �ʱ�ȭ
	MOV STKM[BX], DX			; STKM[BX]�� DX�� MOV
	MOV DX, OFFSET PC_R			; 'PC' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ

	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	mov dx, bx				; BX�� DX�� MOV
	CALL JUDGE_ADD			; JUDGE_ADD ���ν��� ȣ��
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	
	MOV DX,OFFSET PROM			; '>' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
   
	MOV AH, 01H				; ���� �Է��� �ϴ� FUNCTION(1)
	INT 21H					; ���ͷ�Ʈ

	cmp al, 'r'			       ; �Էµ� ���ڰ� 'r'���� �ƴ��� ���Ѵ�
	je r_mic_return				; �Էµ� ���ڰ� 'r'�̸� r_mic_return��
	
	call u_write				; U_WRITE ���ν��� ȣ��
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
	MOV CX, BX				; BX�� CX�� MOV
P1:
	MOV BX, CX				; CX�� BX�� MOV
	MOV STKM[BX],0				; STKM[BX]�� 0���� �ʱ�ȭ
	LOOP P1				; P1�� CX��ŭ LOOP 

	ADD PC, 4				; PC = PC + 4
	
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	
	MOV DX, OFFSET uMAR_R		; 'mar<-' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	mov bx, 0				; BX�� 0���� �ʱ�ȭ
    mov bx, pc					; PC�� BX�� MOV
	CALL show				; SHOW ���ν��� ȣ��
	
	MOV DX, OFFSET COMA			; ',' ���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ

	MOV DX, OFFSET uPC_R	;'PC<-'���
	MOV AH,09H				; ���ڿ� ����� �ϴ� FUNCTION(9)
	INT 21H					; ���ͷ�Ʈ
	
	add pc, 4				; PC = PC + 4
	mov bx, 0				; BX�� 0���� �ʱ�ȭ
    mov bx, pc					; PC�� BX�� MOV
	CALL show				; SHOW ���ν��� ȣ��

	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	CALL u_write				; U_WRITE ���ν��� ȣ��
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
	MOV BX, PC				; PC�� BX�� MOV
	MOV DX, MEM[BX]			; MEM[BX]�� DX�� MOV
	CMP DH, 0				; DH�� 0���� �ƴ��� ��
	JNE ERROR_ZERO			; �ƴ϶�� ERROR_ZERO��
	CMP DL, 0				; DL�� ���� �ƴ��� ��
	JNE ERROR_ZERO			; �ƴ϶�� ERROR_ZERO��	
	SHR DL, 1				; DL>>4
	SHR DL, 1
	SHR DL, 1
	SHR DL, 1
	CMP DL, 0				; DL�� 0���� �ƴ��� ��
	JNE ERROR_ZERO			; �ƴ϶�� ERROR_ZERO��
	SUB PC, 2				; PC = PC - 2
	MOV BX, PC
	MOV DX, 0				; DX�� 0���� �ʱ�ȭ
	JMP SHARP_EN
ERROR_ZERO:
	CALL ERROR_MESSAGE		; ERROR_MESSAGE���ν��� ȣ��
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
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
	MOV DX, OFFSET ERRORMESSAGE		
	MOV AH, 09H
	INT 21H
	MOV DL, 0AH				; �ٹٲ�	
	MOV AH, 2				; ����� ���� FUNCTION(2)
	INT 21H					; ���ͷ�Ʈ
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
   MOV AH, 4CH				; ���Ḧ ���� FUNCTION
   INT 21H					; ���ͷ�Ʈ
   ret
en endp

MAIN ENDS
END START