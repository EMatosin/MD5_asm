section .data
    msg db 'test', 0 
    len equ $ - msg 

section .bss
    padded_msg resb 64  ; Buffer pour le message paddé (512 bit/64 octets)
    
section .text
    global _start

_start:
    mov esi, msg        
    mov edi, padded_msg 
    mov ecx, len  
    rep movsb      
    mov byte [edi], 0x80
    inc edi
    ; Calcul du nombre de zéros à ajouter
    mov edx, 64 - len - 1 - 8 ; 64 octs - len du message - 1 oct pour 0x80 - 8 octs pour la len
    mov ecx, edx
    ; Padding avec des zéros
    mov al, 0       
    rep stosb      
    ; Ajout de la longueur originale du message en bits (len * 8)
    mov eax, len
    shl eax, 3          ; Longueur en bits (len * 8)
    mov dword [edi], eax ; on stock mes 4 premiers octets de la longueur
    mov dword [edi+4], 0 ; Les 4 octets après sont nuls car la longueur < 2^32
  
    mov eax, 1         
    xor ebx, ebx      
    int 0x80         
