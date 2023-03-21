; function stage2_flash_array
; flashes the contents of array given
; Arguments:
; r0 - BASE address of peripherals
; r1 - size of array
; r2 - array to flash
; Function returns nothing

stage2_flash_array:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)
        push {r3,r5,lr}
        ; your function should make use of the existing functions PLASH and PAUSE
        mov r5,r1
       ; mov r1,#0
        mov r3,#0    ;count the value of array to flash
        flashingloop:
            ldr r1,[r2,r3]  ;load value array into r1
            push{r1,r2,lr}
            mov r2,$070000
            orr r2,$00A100
            orr r2,$000020
            bl FLASH   ;r1 = flash times
            pop{r1,r2,lr}
           push {r1}
           mov r1,$1E0000
           orr r1,$008400
           orr r1,$00007F    ;move time to pause for nearly 1 second
           push {lr}
           bl PAUSE   ;pause before changing into the value in the next array
           pop{lr}
           pop{r1}
            add r3,#4 ;move to the next position in the array
            sub r5,#1    ;reduce the size of array
            cmp r5,#0    ;compare whenever r5 = 0 or not to move to the next position in the array
         bne flashingloop

        pop {r3,r5,lr}
        bx lr