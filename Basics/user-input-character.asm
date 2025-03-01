  .model small
.data
.code

  mov ah, 1h   ; Code for read character (character saved in "al")
  int 21h      ; Dos interupt  "do it"
  mov dl, al   ; copy character to dl
  
  mov ah, 2h  ; Code for write character
  int 21h      ; display character in dl
  
  mov ah, 4Ch ; DOS function to terminate program
  int 21h     ; Terminate program
  
  end
  



