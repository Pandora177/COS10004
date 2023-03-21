; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
        push {r0,r3,r4,r5,r7,r8,r9,r10,lr}
        ; your function must mov the address of the sorted array to r0
        mov r6,r0  ;r6 will be used for counting bubble sort loop
        mov r8,r0  ;store the size of array into

        OUTER_LOOP:
         mov r9,#1  ;load the index
         mov r7,r1 ;load array size
         ldr r4,[r7],#4 ;add 4 bytes to get the value
           SORT_AGAIN:
            ldr r5,[r1],#4
            cmp r4,r5
            blt NO_SWAP
              SWAP:
                str r4,[r7,r9,lsl #2]
                sub r9,#1
                mov r4,r5
                sub r0,#1
                cmp r0,r8
                bne SORT_AGAIN
                b COUNTER_BUBBLE

              NO_SWAP:
                str r4,[r7,r9,lsl #2]
                add r9,#1
                str r5,[r7,r9,lsl #2]
                mov r4,r5
                sub r0,#1
                cmp r0,r8
                bne SORT_AGAIN
                b COUNTER_BUBBLE

                COUNTER_BUBBLE:
                  sub r3,#1
                  cmp r3,#0
                  bne OUTER_LOOP

         END_SORT:
          push{r0,r1,r2}
           mov r9,r2
           mov r5,r1
           mov r4,r8
           mov r0,r9  ;Base address peripherals
           mov r2,r5  ;array to flash
           mov r1,r4  ;size of array
           push {lr}
           bl stage2_flash_array
           pop {lr}
          pop{r0,r1,r2}

         pop{r3,r4,r5,r7,r8,r9,lr}
         bx lr



