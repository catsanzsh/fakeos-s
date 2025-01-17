BITS 16          ; Tells the assembler we are in 16-bit mode
ORG 0x7C00       ; The BIOS loads boot sector to this address

start:
    cli              ; Disable interrupts
    xor ax, ax       ; Zero AX
    mov ds, ax       ; DS=0x0000
    mov es, ax       ; ES=0x0000
    mov ss, ax       ; SS=0x0000
    mov sp, 0x7C00   ; Set stack pointer to 0x7C00
    sti              ; Re-enable interrupts
    
    ; Print "Windows CE Crap Edition 5.0"
    mov si, message
    call print_string

halt:
    hlt
    jmp halt

print_string:
    mov ah, 0x0E      ; BIOS teletype function
next_char:
    lodsb             ; Loads [SI] into AL and increments SI
    cmp al, 0         ; Null terminator check
    je .done
    int 0x10          ; BIOS interrupt to print AL
    jmp next_char
.done:
    ret

message:
    db 'Windows CE Crap Edition 5.0', 13, 10, 0    ; String with CR, LF and null terminator

times 510-($-$$) db 0   ; Pad with zeros until 510 bytes
dw 0xAA55              ; Boot signature at bytes 511-512
