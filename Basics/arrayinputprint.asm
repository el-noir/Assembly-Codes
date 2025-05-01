.model small
.stack 100h
.data
    numbers db 4 dup(?)      ; space to store 4 numbers
    msg1 db 'Enter number: $'
    newline db 13, 10, '$'
.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 4                ; loop 4 times for 4 numbers
    lea si, numbers          ; SI points to array start

input_loop:
    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'              ; convert ASCII to number (0–9)
    mov [si], al             ; store in array
    inc si

    ; new line
    lea dx, newline
    mov ah, 09h
    int 21h

    loop input_loop

    ; reset SI to start of array
    lea si, numbers
    mov cx, 4                ; loop to print 4 numbers

print_loop:
    mov al, [si]
    add al, '0'              ; convert to ASCII
    mov dl, al
    mov ah, 02h
    int 21h

    ; print space
    mov dl, ' '
    mov ah, 02h
    int 21h

    inc si
    loop print_loop

    ; exit
    mov ah, 4ch
    int 21h
end main
