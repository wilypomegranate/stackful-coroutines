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
orr r0, #0x00000010 @ Set bit to enable GPIOC clock.
str r0, [r1] @ Write new value to RCC_APB2ENR.

@ldr r0, =0x44544444 @ Set the specific bits to enable 10MHZ output on GPIOC.
ldr r1, =0x40011004 @ Location of GPIOC_CRH register.
ldr r0, [r1] @ Load the current value of GPIOC_CRH into r0.
@ Set PC13 as push pull output. This is set via CNF13.
@ Bits 22,23 to 00.
@ Set PC13 as 10Mhz output. This is set via MODE13.
@ Bits 20,21 to 01.
and r0, #0xff2fffff
orr r0, #0x200000
str r0, [r1]

ldr r0, =0x2000
ldr r1, =0x40011014
str r0, [r1]

b .
