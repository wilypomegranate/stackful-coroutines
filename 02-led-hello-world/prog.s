.syntax unified
.cpu cortex-m3
.thumb

.word 0x20000400
.word 0x080000ed
.space 0xe4

@RCC offset 0x4002 1000
@GPIOC offset 0x4001 1000

ldr r1, =0x40021018 @ Address of RCC_APB2ENR.
ldr r0, [r1] @ Load the current value of RCC_APB2ENR into r0.
orr r0, #0x00000010 @ Set the specific bits to enable 10MHZ output on GPIOC.
str r0, [r1] @ Write new value to RCC_APB2ENR.

ldr r0, =0x44544444
ldr r1, =0x40011004
str r0, [r1]

ldr r0, =0x2000
ldr r1, =0x40011014
str r0, [r1]

b .
