; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    myString: db "Hello, World!", 0
    exitString: db "Goodbye, World!", 0
    N: dq 6                         ; N = 6

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    mov rcx, QWORD [N]              ; rcx will store the value of N
    PRINTF64 `%d\n\x0`, rcx         ; DO NOT REMOVE/MODIFY THIS LINE

    mov rax, 2
    mov r8, 1
    cmp rax, r8
    jg print                        ; TODO1: rax > r8?
    xor rax, rax

    leave
    ret

print:
    PRINTF64 `%s\n\x0`, myString
    cmp rcx, 0                      ; TODO2.2: print "Hello, World!" N times
    sub rcx, 1                      ; TODO2.1: print "Goodbye, World!"
    jne print

    jmp end

    xor rax, rax

    leave
    ret

end:
    PRINTF64 `%s\n\x0`, exitString
    xor rax, rax

    leave
    ret