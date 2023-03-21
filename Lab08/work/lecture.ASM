BASE=$3F000000
GPIO_OFFSET=$200000
mov r0,BASE
orr r0,GPIO_OFFSET  ;start of GPIO

mov r1,#1
lsl r1,#24
str r1,[r0,#4] ;set the GPIO to output

loop$:;start of the loop, LED on,wait,off,wait
mov r1,#1
lsl r1,#18
str r1,[r0,#28];turn LED on

mov r2,$10000
mov r3,r2

wait1$:
 sub r3,$5000
 cmp r3,$0
 bne wait1$ ;busy wait

mov r1,#1
lsl r1,#18
str r1,[r0,#40];turn LED off

mov r2,$10000
mov r2,r3

wait2$:
 sub r3,$5000
 cmp r3,$0
 bne wait2$ ;busy wait

 bne wait2$
b loop$