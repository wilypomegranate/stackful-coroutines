.syntax unified
.cpu cortex-m3
.thumb

.word 0x20000400
.word 0x080000ed
.space 0xe4

@RCC offset 0x4002 1000
@GPIOC offset 0x4001 1000

ldr r0, =0x00000010
ldr r1, =0x40021018
str r0, [r1]			@ Set IOPCEN bit in RCC_APB2ENR to 1 to enable GPIOC

ldr r0, =0x44544444
ldr r1, =0x40011004
str r0, [r1]

ldr r0, =0x2000
ldr r1, =0x40011014
str r0, [r1]

b .
