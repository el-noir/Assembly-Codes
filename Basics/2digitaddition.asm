.model small
.stack 100h

.data
msg1 db 'Enter first number (2 digits): $'
msg2 db 'Enter second number (2 digits): $'
newline db 10, 13, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Prompt msg1
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Input first number - two digits
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bl, 10
    mul bl            ; al = first_digit * 10

    mov bl, al        ; store in bl temporarily

    mov ah, 01h
    int 21h
    sub al, '0'
    add bl, al        ; bl = full first number

    ; New line
    lea dx, newline
    mov ah, 09h
    int 21h

    ; Prompt msg2
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; Input second number - two digits
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bh, 10
    mul bh            ; al = first_digit * 10

    mov bh, al        ; store in bh temporarily

    mov ah, 01h
    int 21h
    sub al, '0'
    add bh, al        ; bh = full second number

    ; New line
    lea dx, newline
    mov ah, 09h
    int 21h

    ; Add numbers
    mov al, bl
    add al, bh        ; al = total sum

    mov ah, 0
    mov bl, 10
    div bl            ; al / 10 -> quotient in al, remainder in ah

    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    mov al, ah        ; remainder
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h

main endp
end main
