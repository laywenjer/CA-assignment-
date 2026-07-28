.MODEL SMALL
.STACK 100H

.DATA
    ; Menu String Definitions (0DH, 0AH = Carriage Return, Line Feed)
    MENU_MSG    DB 0DH, 0AH, '=========================='
                DB 0DH, 0AH, '        MAIN MENU         '
                DB 0DH, 0AH, '=========================='
                DB 0DH, 0AH, '1. Say Hello'
                DB 0DH, 0AH, '2. Say Goodbye'
                DB 0DH, 0AH, '3. Exit'
                DB 0DH, 0AH, 'Enter your choice (1-3): $'
    
    MSG_HELLO   DB 0DH, 0AH, 'Hello, User!$'
    MSG_BYE     DB 0DH, 0AH, 'Goodbye, User!$'
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
    JE  EXIT_PROG

    ; If input matches no option, print error message
    LEA DX, MSG_INVALID
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP

OPTION1:
    LEA DX, MSG_HELLO
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP       ; Return to menu after executing

OPTION2:
    LEA DX, MSG_BYE
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP       ; Return to menu after executing

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