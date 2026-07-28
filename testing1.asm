.MODEL SMALL
.STACK 100H

.DATA
    ; Menu String Definitions (0DH, 0AH = Carriage Return, Line Feed)
    MENU_MSG    DB 0DH, 0AH, '================================'
                DB 0DH, 0AH, '            MAIN MENU         '
                DB 0DH, 0AH, '================================'
                DB 0DH, 0AH, '1. Swmming Pool '
                DB 0DH, 0AH, '2. Basketball Court'
                DB 0DH, 0AH, '3. Badminton Court '
				db 0dh, 0ah, '4. Squash Court'
				db 0dh, 0ah, '5. Pickleball Court'
				db 0dh, 0ah, '6. Exit program'
                DB 0DH, 0AH, 'Enter your choice (1-6): $'
    
    MSG_SWIMMING   DB 0DH, 0AH, 'You have selected Swmming Pool $'
    MSG_BASKETBALL DB 0DH, 0AH, 'You have selected Basketball $'
	MSG_BADMINTON DB 0DH, 0AH, 'You have selected Badminton $'
	MSG_SQUASH DB 0DH, 0AH, 'You have selected Squash $'
	MSG_PICKLEBALL DB 0DH, 0AH, 'You have selected Pickleball $'
    MSG_INVALID DB 0DH, 0AH, 'Invalid choice! Please try again.$'
    MSG_EXIT    DB 0DH, 0AH, 'Exiting program...$'

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

MENU_LOOP:
    ; Display the menu string using INT 21H, Function 09H
    LEA DX, MENU_MSG
    MOV AH, 09H
    INT 21H

    ; Read a single character from keyboard (stored in AL)
    MOV AH, 01H
    INT 21H

    ; Compare user input in AL against options
    CMP AL, '1'
    JE  OPTION1
	
    CMP AL, '2'
    JE  OPTION2
	
	CMP AL, '3'
	JE  OPTION3
	
	CMP AL, '4'
	JE  OPTION4
	
	CMP AL, '5'
	JE  OPTION5

    CMP AL, '6'
    JE  EXIT_PROG

    ; If input matches no option, print error message
    LEA DX, MSG_INVALID
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP

OPTION1:
    LEA DX, MSG_SWIMMING
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP       ; Return to menu after executing

OPTION2:
    LEA DX, MSG_BASKETBALL
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP       

OPTION3:
    LEA DX, MSG_BADMINTON
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP 
	
OPTION4:
    LEA DX, MSG_SQUASH
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP 

OPTION5:
    LEA DX, MSG_PICKLEBALL
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP 
	
EXIT_PROG:
    ; Print exit message
    LEA DX, MSG_EXIT
    MOV AH, 09H
    INT 21H

    ; Terminate program (Return control to DOS)
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN