	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"PRESS START\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #83886080
	sub	sp, sp, #44
	ldr	r1, .L7
	mov	r0, #3
	ldr	r3, .L7+4
	ldr	r4, .L7+8
	mov	lr, pc
	bx	r4
	ldr	r0, .L7+12
	ldr	r3, .L7+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L7+20
	ldm	r3, {r0, r1, r2}
	add	r6, sp, #4
	stmia	r6!, {r0, r1}
	ldr	r5, .L7+24
	strh	r2, [r6], #2	@ movhi
	lsr	r7, r2, #16
	ldmia	r5!, {r0, r1, r2, r3}
	add	lr, sp, #16
	stmia	lr!, {r0, r1, r2, r3}
	ldm	r5, {r0, r1}
	str	r0, [lr], #4
	strb	r7, [r6]
	mov	r4, #55
	mov	ip, #80
	strh	r1, [lr]	@ movhi
	ldr	r7, .L7+28
	add	r5, sp, #14
	add	r6, sp, #4
	b	.L3
.L6:
	ldrb	ip, [r6, #1]!	@ zero_extendqisi2
.L3:
	ldrh	r3, [r5, #2]!
	mov	r0, r4
	mov	r2, ip
	mov	r1, #70
	and	r3, r3, #255
	add	r4, r4, #12
	mov	lr, pc
	bx	r7
	cmp	r4, #187
	bne	.L6
	ldr	r3, .L7+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L7+36
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L7+40
	ldr	r2, .L7+44
	strb	r3, [r1]
	str	r3, [r2]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	start04Pal
	.word	-2147483392
	.word	DMANow
	.word	start04Bitmap
	.word	drawFullscreenImage4
	.word	.LC1
	.word	.LANCHOR0
	.word	drawChar4
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	rSeed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r1, #128
	mvn	ip, #170
	mov	r0, #2
	mov	r2, #0
	strh	r1, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	ldr	r1, .L10
	strh	r0, [r3, #130]	@ movhi
	ldr	r0, .L10+4
	ldrh	ip, [r1, #48]
	ldr	r3, .L10+8
	ldr	r1, .L10+12
	strh	ip, [r0]	@ movhi
	strh	r2, [r1]	@ movhi
	str	r2, [r3]
	b	goToStart
.L11:
	.align	2
.L10:
	.word	67109120
	.word	buttons
	.word	highScore
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L19
	ldr	r3, [r4]
	ldr	r2, .L19+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L19+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L12
	ldr	r3, .L19+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L18
.L12:
	pop	{r4, lr}
	bx	lr
.L18:
	ldr	r0, [r4]
	ldr	r3, .L19+16
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L19+20
	ldr	r3, .L19+24
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	rSeed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L22
	strb	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"game paused!\000"
	.align	2
.LC3:
	.ascii	"Press 'start' to resume.\000"
	.align	2
.LC4:
	.ascii	"Press 'A' to see scoreboard.\000"
	.align	2
.LC5:
	.ascii	"Press 'select' to restart.\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #7
	ldr	r3, .L26
	mov	lr, pc
	bx	r3
	ldr	r4, .L26+4
	mov	r3, #255
	mov	r1, #40
	mov	r0, #84
	ldr	r2, .L26+8
	mov	lr, pc
	bx	r4
	mov	r3, #255
	mov	r1, #80
	mov	r0, #45
	ldr	r2, .L26+12
	mov	lr, pc
	bx	r4
	mov	r3, #255
	mov	r1, #100
	mov	r0, #35
	ldr	r2, .L26+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L26+20
	mov	r1, #122
	mov	r0, #42
	mov	r3, #255
	mov	lr, pc
	bx	r4
	ldr	r3, .L26+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L26+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L26+32
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	fillScreen4
	.word	drawString4
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"game over\000"
	.align	2
.LC7:
	.ascii	"final score:\000"
	.align	2
.LC8:
	.ascii	"%d\000"
	.align	2
.LC9:
	.ascii	"Press 'start' to play again\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #22
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	ldr	r4, .L30+4
	mov	r3, #7
	mov	r1, #65
	mov	r0, #90
	ldr	r2, .L30+8
	mov	lr, pc
	bx	r4
	mov	r3, #7
	mov	r1, #76
	mov	r0, #70
	ldr	r2, .L30+12
	mov	lr, pc
	bx	r4
	ldr	r5, .L30+16
	ldr	r3, .L30+20
	mov	r0, r5
	ldr	r2, [r3]
	ldr	r1, .L30+24
	ldr	r3, .L30+28
	mov	lr, pc
	bx	r3
	mov	r2, r5
	mov	r3, #7
	mov	r1, #77
	mov	r0, #145
	mov	lr, pc
	bx	r4
	mov	r3, #7
	mov	r1, #100
	mov	r0, #33
	ldr	r2, .L30+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L30+36
	mov	r1, #111
	mov	r0, #35
	mov	r3, #7
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+44
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L30+48
	strb	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	fillScreen4
	.word	drawString4
	.word	.LC6
	.word	.LC7
	.word	playerBuffer
	.word	playerScore
	.word	.LC8
	.word	sprintf
	.word	.LC4
	.word	.LC9
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"score: \000"
	.align	2
.LC11:
	.ascii	"lives: \000"
	.text
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L42
	ldr	r6, .L42+4
	ldr	r8, .L42+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L42+12
	mov	lr, pc
	bx	r6
	mov	r3, #23
	mov	r1, #3
	mov	r0, #184
	ldr	r2, .L42+16
	mov	lr, pc
	bx	r4
	ldr	r7, .L42+20
	ldr	r2, [r8]
	ldr	r1, .L42+24
	ldr	r0, .L42+28
	mov	lr, pc
	bx	r7
	ldr	r5, .L42+32
	mov	r3, #23
	mov	r1, #4
	mov	r0, #224
	ldr	r2, .L42+28
	mov	lr, pc
	bx	r4
	mov	r3, #8
	mov	r1, #3
	mov	r0, #1
	ldr	r2, .L42+36
	mov	lr, pc
	bx	r4
	ldr	r2, [r5]
	ldr	r1, .L42+24
	ldr	r0, .L42+40
	mov	lr, pc
	bx	r7
	mov	r1, #4
	mov	r0, #40
	ldr	r2, .L42+40
	mov	r3, #8
	mov	lr, pc
	bx	r4
	ldr	r3, .L42+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+48
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r6
	ldr	r3, .L42+52
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L33
	ldr	r3, .L42+56
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
.L33:
	ldr	r3, [r5]
	cmp	r3, #0
	ble	.L41
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L41:
	ldr	r3, .L42+60
	ldr	r2, [r8]
	ldr	r1, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	cmp	r2, r1
	strgt	r2, [r3]
	b	goToLose
.L40:
	bl	goToPause
	b	.L33
.L43:
	.align	2
.L42:
	.word	updateGame
	.word	drawGame
	.word	playerScore
	.word	drawString4
	.word	.LC10
	.word	sprintf
	.word	.LC8
	.word	playerBuffer
	.word	playerLives
	.word	.LC11
	.word	livesBuffer
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	highScore
	.size	game, .-game
	.section	.rodata.str1.4
	.align	2
.LC12:
	.ascii	"high score:\000"
	.text
	.align	2
	.global	goToScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToScore, %function
goToScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #9
	ldr	r3, .L46
	mov	lr, pc
	bx	r3
	mov	r1, #76
	ldr	r4, .L46+4
	mov	r0, r1
	mov	r3, #7
	ldr	r2, .L46+8
	mov	lr, pc
	bx	r4
	ldr	r5, .L46+12
	ldr	r3, .L46+16
	mov	r0, r5
	ldr	r2, [r3]
	ldr	r1, .L46+20
	ldr	r3, .L46+24
	mov	lr, pc
	bx	r3
	mov	r2, r5
	mov	r3, #7
	mov	r1, #77
	mov	r0, #145
	mov	lr, pc
	bx	r4
	ldr	r2, .L46+28
	mov	r1, #100
	mov	r0, #35
	mov	r3, #7
	mov	lr, pc
	bx	r4
	ldr	r3, .L46+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+36
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L46+40
	strb	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	fillScreen4
	.word	drawString4
	.word	.LC12
	.word	highScoreBuffer
	.word	highScore
	.word	.LC8
	.word	sprintf
	.word	.LC9
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToScore, .-goToScore
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L63
	ldr	r3, .L63+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L49
	ldr	r2, .L63+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L49
	mov	r1, #2
	ldr	r2, .L63+12
	strb	r1, [r2]
.L50:
	tst	r3, #1
	beq	.L48
	ldr	r3, .L63+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L62
.L48:
	pop	{r4, lr}
	bx	lr
.L49:
	tst	r3, #4
	beq	.L50
	ldr	r2, .L63+8
	ldrh	r2, [r2]
	tst	r2, #4
	bne	.L50
	bl	goToStart
	ldrh	r3, [r4]
	b	.L50
.L62:
	pop	{r4, lr}
	b	goToScore
.L64:
	.align	2
.L63:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L77
	ldr	r3, .L77+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L66
	ldr	r2, .L77+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L75
.L66:
	tst	r3, #1
	beq	.L65
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L76
.L65:
	pop	{r4, lr}
	bx	lr
.L76:
	pop	{r4, lr}
	b	goToScore
.L75:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L66
.L78:
	.align	2
.L77:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	score
	.syntax unified
	.arm
	.fpu softvfp
	.type	score, %function
score:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L86
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L79
	ldr	r3, .L86+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L85
.L79:
	pop	{r4, lr}
	bx	lr
.L85:
	pop	{r4, lr}
	b	goToStart
.L87:
	.align	2
.L86:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	score, .-score
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"Debugging Initialized\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r5, #67108864
	ldr	r2, .L100
	push	{r4, r7, fp, lr}
	ldr	r3, .L100+4
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r0, .L100+8
	ldr	r3, .L100+12
	mov	lr, pc
	bx	r3
	mov	r0, #128
	mvn	r1, #170
	mov	r2, #2
	mov	r3, #0
	strh	r0, [r5, #132]	@ movhi
	ldr	r4, .L100+16
	strh	r1, [r5, #128]	@ movhi
	strh	r2, [r5, #130]	@ movhi
	ldr	r0, .L100+20
	ldrh	ip, [r4, #48]
	ldr	r7, .L100+24
	ldr	r5, .L100+28
	ldr	r2, .L100+32
	strh	ip, [r7]	@ movhi
	str	r3, [r0]
	strh	r3, [r5]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r6, .L100+36
	ldr	fp, .L100+40
	ldr	r10, .L100+44
	ldr	r9, .L100+48
	ldr	r8, .L100+52
.L89:
	ldrb	r2, [r6]	@ zero_extendqisi2
	ldrh	r3, [r7]
.L90:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L90
.L92:
	.word	.L96
	.word	.L95
	.word	.L94
	.word	.L93
	.word	.L91
.L91:
	ldr	r3, .L100+56
	mov	lr, pc
	bx	r3
	b	.L89
.L93:
	mov	lr, pc
	bx	r8
	b	.L89
.L94:
	mov	lr, pc
	bx	r10
	b	.L89
.L95:
	mov	lr, pc
	bx	r9
	b	.L89
.L96:
	mov	lr, pc
	bx	fp
	b	.L89
.L101:
	.align	2
.L100:
	.word	1044
	.word	mgba_open
	.word	.LC13
	.word	mgba_printf
	.word	67109120
	.word	highScore
	.word	buttons
	.word	oldButtons
	.word	goToStart
	.word	state
	.word	start
	.word	game
	.word	pause
	.word	score
	.word	lose
	.size	main, .-main
	.comm	highScoreBuffer,41,4
	.comm	highScore,4,4
	.comm	rSeed,4,4
	.comm	livesBuffer,41,4
	.comm	playerBuffer,41,4
	.comm	state,1,1
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	coolDown,4,4
	.comm	enemiesLeft,4,4
	.comm	timeTrack,4,4
	.comm	currentEnemies,4,4
	.comm	playerLives,4,4
	.comm	playerScore,4,4
	.comm	NOTES,2,2
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	161
	.short	161
	.short	161
	.short	161
	.short	161
	.short	31
	.short	161
	.short	161
	.short	161
	.short	161
	.short	161
	.ident	"GCC: (devkitARM release 53) 9.1.0"
