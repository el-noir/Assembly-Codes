.model small
.stack 100h
.data
    msg1 db 'Enter first digit: $'
    msg2 db 13,10, 'Enter second digit: $'
    msg3 db 13,10, 'The sum is: $'

.code
main:
    mov ax, @data
    mov ds, ax

    ; Print message 1
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Read first digit
    mov ah, 01h
    int 21h
    sub al, '0'       ; Convert ASCII to digit
    mov bl, al        ; Store in BL

    ; Print message 2
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; Read second digit
    mov ah, 01h
    int 21h
    sub al, '0'
    add bl, al        ; Add both digits

    ; Print result message
    lea dx, msg3
    mov ah, 09h
    int 21h

    ; Convert sum to ASCII and print
    add bl, '0'
    mov dl, bl
    mov ah, 02h
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h
end main
