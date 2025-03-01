.model tiny 
.code ; code segment
org 100h

main proc near 

mov ah, 09h             ; function to display the message
mov dx, offset message  ; offset of message string terminating with $
int 21h

mov ah, 4ch   ; function to terminate
mov al, 00
int 21h       ; Dos interrupt

endp
message db "Hello World $" ; Message to be displayed terminating with a $

end main



