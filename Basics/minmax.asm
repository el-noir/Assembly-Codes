.model small
.stack 100h

.data
    prompt db "Enter the number of elements (1-10): $"
    prompt2 db "Enter a number: $"
    msgMin db "Minimum number is: $"
    msgMax db "Maximum number is: $"
    numCount db 0
    numbers db 10 dup(0)   ; Array to store the numbers, max 10 numbers
    minNum db 0
    maxNum db 0

.code
start:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Prompt user to enter the number of elements
    lea dx, prompt
    mov ah, 09h
    int 21h

    ; Get user input for number of elements
    mov ah, 01h
    int 21h
    sub al, '0'         ; Convert ASCII to integer
    mov bl, al          ; Store number of elements in BL
    mov [numCount], bl  ; Store number of elements

    ; Initialize minNum and maxNum
    mov al, 0
    mov [minNum], al
    mov [maxNum], al

    ; Loop to input numbers
    lea dx, prompt2
    mov ah, 09h
    int 21h

    mov si, 0            ; SI will be our index for the array

inputLoop:
    ; Get user input for each number
    mov ah, 01h
    int 21h
    sub al, '0'         ; Convert ASCII to integer

    ; Store the number in the array
    mov [numbers + si], al

    ; Check if the current number is the minimum or maximum
    mov dl, [numbers + si]
    cmp dl, [minNum]
    jl updateMin
    cmp dl, [maxNum]
    jg updateMax

    ; Move to next number
    inc si
    dec bl
    jnz inputLoop

    ; Display minimum number
    lea dx, msgMin
    mov ah, 09h
    int 21h
    mov dl, [minNum]
    add dl, '0'
    mov ah, 02h
    int 21h

    ; Display maximum number
    lea dx, msgMax
    mov ah, 09h
    int 21h
    mov dl, [maxNum]
    add dl, '0'
    mov ah, 02h
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

updateMin:
    ; Update minimum number
    mov dl, [numbers + si]
    mov [minNum], dl
    jmp inputLoop

updateMax:
    ; Update maximum number
    mov dl, [numbers + si]
    mov [maxNum], dl
    jmp inputLoop

end start
