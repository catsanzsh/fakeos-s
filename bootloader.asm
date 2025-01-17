[org 0x0000]    ; We load at 0x1000:0, but 'org' is 0 relative to that
bits 16

use16

start_kernel:
    ; Print Kernel Message
    mov si, kernelMsg
    call print_string

shell_loop:
    ; Print shell prompt
    mov si, shellPrompt
    call print_string

    ; Wait for keypress
    call get_key

    ; Check the character in AL
    cmp al, 'd'
    je go_desktop
    cmp al, 'x'
    je exit_shell

    ; If it’s an unrecognized command, just echo something
    mov si, unknownCmdMsg
    call print_string

    jmp shell_loop

go_desktop:
    mov si, desktopMsg
    call print_string
    jmp shell_loop

exit_shell:
    ; Hang
    jmp $

;--------------------------------
; get_key: Waits for keypress
; Returns ASCII in AL
;--------------------------------
get_key:
    xor ah, ah
    int 0x16     ; BIOS keyboard service
    ret

;--------------------------------
; print_string: DS:SI => string
; prints until encountering 0
;--------------------------------
print_string:
    mov ah, 0x0E
.print_char:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .print_char
.done:
    ret

;--------------------------------
; Data
;--------------------------------
kernelMsg     db "Kernel started. Welcome to Windows CE Crap Edition 5.0!", 0x0D, 0x0A, 0
shellPrompt   db "Shell> Press 'd' for Desktop, 'x' to Exit:", 0x0D, 0x0A, 0
unknownCmdMsg db "Unknown command.", 0x0D, 0x0A, 0
desktopMsg    db "Welcome to the Awesome Desktop!", 0x0D, 0x0A, 0

;--------------------------------
; Pad so kernel can be multiple
; sectors if needed
;--------------------------------
times 512*3-($-$$) db 0  ; Enough to fill 3 sectors (example)
