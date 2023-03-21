BASE = $3F000000
GPIO_OFFSET = $200000
mov r0,BASE
orr r0,GPIO_OFFSET ;base address of GPIO
;read the relevant function register
ldr r1,[r0,34]  ;read function register for GPIO10-19
bic r1,r1,37 ;bit clear
str r1,[r0,#4]
