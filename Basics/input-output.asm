.model small 
.stack 100h

.data
     num DB 31H
     char DB 'A'
     output DB "Hello World!! $"
     input_char DB ? ; to store input

.code


MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        ; Input a character from user
        MOV AH, 01
        INT 21H ; store the input in AL
        MOV input_char, Al ; store the input for later use
        
        ; Output a character (ASCII code 65)
        MOV AH, 02
        MOV DL, 65
        INT 21H
        
        ; Output the string (declared in data section - output)
        MOV AH, 09
        LEA DX, output
        INT 21H
        
        ;OutPut stored Character
        MOV AH, 02
        MOV DL, char ; Move character into DL
        INT 21H
        
        ; Exit the program
        
        Mov AH, 4CH
        INT 21H          
                  
    
MAIN ENDP
END MAIN