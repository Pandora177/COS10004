; function stage4_quicksort
; sorts given array using the sorting algorithm quicksort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage4_quicksort:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

        ; your function must mov the address of the sorted array to r0

        push{r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10}
        mov r10, #0
        mov r9, r0
        mov r8, r1
        mov r5, #0
        mov r6, #0
        mov r7, #1
        b quicksortloop

        changeindex:
                add r5, #1
                mov r6, r5
                mov r7, #0
                cmp r5, r9
                beq endquicksortloop
                b quicksortloop

        swap:
                str r4, [r8,r6]
                str r3, [r8,r7]
                mov r6, r7
                b addindex

        greater:
                cmp r3, r4
                bge addindex
                b swap
        
        addindex:
                add r7, #1
                cmp r7, r9
                beq changeindex

        quicksortloop:
                ldr r3, [r8,r6]
                ldr r4, [r8,r7]

                cmp r6, r7
                bge greater
                cmp r3, r4
                bge swap
                b addindex

        endquicksortloop:
                ldr r5, [r8, r10]
                mov r3, r2
        
                push{r0,r1,r2}
                mov r0, r3
                mov r1, r5
                mov r2, #1000
                push{lr}
                bl FLASH
                pop{lr}
                pop{r0,r1,r2}

                push{r0,r1}
                mov r0, r3
                mov r1, #2000
                push{lr}
                bl PAUSE
                pop{lr}
                pop{r0,r1}

                add r10, #1
                cmp r10, r9
                bne endquicksortloop

        push{r0,r1}
        mov r0, r3
        mov r1, #3000
        push{lr}
        bl PAUSE
        pop{lr}
        pop{r0,r1}

        pop{r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10}
        bx lr