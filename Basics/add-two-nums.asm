.386
.model flat, stdcall
.stack 4096

.data
    num1 DWORD 10   ; 
    num2 DWORD 20   ; 
    result DWORD ?  ; 

.code
main PROC
    mov eax, num1
    
    add eax, num2

    mov result, eax
    
    invoke ExitProcess, 0
main ENDP

END main
