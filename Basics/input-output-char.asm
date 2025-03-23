.MODEL SMALL

.STACK 100H

.DATA
   input_char DB ?
 
.CODE

MAIN PROC
      MOV AX, @DATA
      MOV DS, AX
      
      MOV AH, 01
      INT 21H
      MOV input_char, AL
      
      MOV AH, 02
      MOV DL, input_char
      INT 21H
      
      MOV AH, 4CH
      INT 21h

MAIN ENDP
END MAIN