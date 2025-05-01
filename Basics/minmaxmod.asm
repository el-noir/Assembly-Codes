.MODEL SMALL
.STACK 100H

.DATA
    ARRAY DB 4 DUP('?')
    SIZE EQU $-ARRAY
    NEWLINE DB 10,13,'$' 

    MIN db ?
    MAX db ?
    
    MSGSUM  db 'SUM: $'
    MSGMEAN db 'MEAN: $' 
    MSGMIN  db 'MIN: $'
    MSGMAX  db 'MAX: $'

.CODE
    MAIN PROC
                  
        MOV AX,@DATA
        MOV DS,AX
        
        MOV CX,SIZE
        MOV SI,OFFSET ARRAY
        
        INPUT:
            MOV AH,01H
            INT 21H  
            
            SUB AL,'0'
            
            MOV [SI],AL
            INC SI
                     
            MOV DL,' '         
            MOV AH,02 
            INT 21H
        LOOP INPUT
        
        MOV CX,SIZE
        MOV SI,OFFSET ARRAY
        XOR AX,AX
        
        SUM_LOOP:
            ADD AL,[SI]
            INC SI
        LOOP SUM_LOOP
        
        MOV CL,AL
        
        LEA DX,NEWLINE
        MOV AH,09H
        INT 21H
        
        LEA DX,MSGSUM
        MOV AH,09H
        INT 21H 
        
        MOV DL,CL
        ADD DL,'0'
        
        MOV AH,02H
        INT 21H
        
        ;SUM IS DONE HERE------------------------------------------------------------------------    
        
        LEA DX,NEWLINE
        MOV AH,09H
        INT 21H
        
        LEA DX,MSGMEAN
        MOV AH,09H
        INT 21H
        
        
        MOV AL,CL
        XOR AH,AH
        MOV BL,SIZE
        DIV BL
        
        
        MOV DL,al
        ADD DL,'0'
        MOV AH,02H
        INT 21H
        
        ;MEAN IS DONE HERE------------------------------------------------------------------------       
        
        MOV SI, OFFSET ARRAY
        MOV AL, [SI]
        MOV MIN, AL
        MOV MAX, AL
        
        INC SI
        MOV CX, size
        DEC CX
        
        MIN_MAX:
        MOV AL, [SI]
        
        CMP AL, MIN
        JL UPDATE_MIN
        
        CMP AL, MAX
        JG UPDATE_MAX
        
        JMP NEXT
        
        UPDATE_MIN:
        MOV MIN, AL
        JMP NEXT
        
        UPDATE_MAX:
        MOV MAX, AL
        
        NEXT:
        INC SI
        
        LOOP MIN_MAX
        
        MOV AH, 09H
        LEA DX, newline
        INT 21H
        
        MOV AH, 09H
        LEA DX, msgmin
        INT 21H
        
        MOV DL, MIN
        ADD DL, '0'
        MOV AH, 02H
        INT 21H
        
        MOV AH, 09H
        LEA DX, newline
        INT 21H
        
        MOV AH, 09H
        LEA DX, msgmax
        INT 21H
        
        MOV DL, MAX
        ADD DL, '0'
        MOV AH, 02H
        INT 21H
        
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
END MAIN