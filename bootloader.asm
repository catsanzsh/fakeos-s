[org 0x0000]     ; We'll load at 0x1000:0, but ORG is relative to this
bits 16

; ------------------------------------------------------------------------------
; Start of Kernel
; ------------------------------------------------------------------------------

start_kernel:
    ; Print initial kernel message
    mov si, kernelMsg
    call print_string

shell_loop:
    ; Print the shell prompt
    mov si, shellPrompt
    call print_string

    ; Wait for a keypress
    call get_key

    ; Check which key was pressed
    cmp al, 'd'
    je  go_desktop
    cmp al, 'x'
    je  exit_shell

    ; If unrecognized command, show error message
    mov si, unknownCmdMsg
    call print_string
    jmp short shell_loop

go_desktop:
    mov si, desktopMsg
    call print_string
    jmp short shell_loop

exit_shell:
    cli          ; Disable interrupts
    hlt          ; Halt CPU (an alternative to jmp $)

; ------------------------------------------------------------------------------
; get_key: Waits for a keypress, returns ASCII in AL
; ------------------------------------------------------------------------------
get_key:
    xor ah, ah
    int 0x16     ; BIOS keyboard service
    ret

; ------------------------------------------------------------------------------
; print_string: Prints a null-terminated string (DS:SI)
; ------------------------------------------------------------------------------
print_string:
    mov ah, 0x0E
.print_char:
    lodsb
    test al, al  ; Check if AL == 0
    jz .done
    int 0x10     ; BIOS teletype
    jmp .print_char
.done:
    ret

; ------------------------------------------------------------------------------
; Data Section
; ------------------------------------------------------------------------------
kernelMsg     db "Kernel started. Welcome to Windows CE Crap Edition 5.0!", 0x0D, 0x0A, 0
shellPrompt   db "Shell> Press 'd' for Desktop, 'x' to Exit:", 0x0D, 0x0A, 0
unknownCmdMsg db "Unknown command.", 0x0D, 0x0A, 0
desktopMsg    db "Welcome to the Awesome Desktop!", 0x0D, 0x0A, 0

; ------------------------------------------------------------------------------
; Pad so the kernel fills 1 sector (512 bytes). Increase if you need more.
; ------------------------------------------------------------------------------
times 512 - ($-$$) db 0
