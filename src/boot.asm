[BITS 16]
[ORG 0x7c00]

start:
    cli ; clear interrupts
    mov ax, 0x00
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    sti ; enables interrupts
    mov si, msg

print:
    lodsb ; loads byte at ds:si to AL register and increments SI
    cmp al, 0
    je done
    mov ah, 0x0E ; mode for video print in int 0x10
    int 0x10 ; interrupt number for printing
    jmp print

done:
    cli
    hlt ; stop further execution

msg: db "hello world", 0 ; msg array -> h,e,l,l,o, ,w,o,r,l,d,0x00

times 510 - ($ -$$) db 0

dw 0xAA55