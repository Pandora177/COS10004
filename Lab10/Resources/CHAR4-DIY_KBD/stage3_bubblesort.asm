; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
        push {r8-r11}

        push {r0}
        loop1:
                mov r11, r1
                ldr r8, [r11], #4
                mov r10, #1
                loop2:
                        ldr r9, [r11], #4
                        cmp r8, r9
                        ble swap
                                str r8, [r1, r10, LSL #2]
                                sub r10, #1
                                str r9, [r1, r10, LSL #2]
                                add r10, #1
                                mov r9, r8
                        swap:
                        mov r8, r9
                        add r10, #1
                        cmp r10, r0
                bls loop2
                
                sub r0, #1
                cmp r0, #0
        bgt loop1
        pop {r0}

        push {lr, r0-r2}
                mov r8, r2
                mov r9, r1
                mov r1, r0
                mov r0, r8
                mov r2, r9
                
                bl stage2_flash_array
        pop {lr, r0-r2}

        pop {r8-r11}
bx lr



