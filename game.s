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
	.file	"game.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d, left enemies in update game\000"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies.part.0, %function
updateEnemies.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r1, [r0, #4]
	cmp	r1, #138
	mov	r4, r0
	sub	sp, sp, #20
	bgt	.L17
.L2:
	ldr	ip, .L20
	ldr	r5, [ip, #16]
	ldr	r6, [ip, #4]
	ldr	r0, [r4]
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	ldr	lr, [ip]
	ldr	r7, [ip, #12]
	ldr	ip, [ip, #8]
	cmp	r5, #0
	stmib	sp, {r6, r7, ip}
	str	lr, [sp]
	ldr	r6, .L20+4
	sub	r1, r1, #1
	sub	r0, r0, #2
	sub	r2, r2, #2
	sub	r3, r3, #1
	bne	.L3
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L18
.L5:
	ldr	r5, .L20+8
	ldr	r2, [r5, #8]
	ldr	r3, [r4, #8]
	ldr	r1, [r5, #12]
	ldr	r0, [r5, #4]
	ldr	ip, [r5]
	str	r2, [sp, #12]
	ldr	r2, [r4, #12]
	str	r1, [sp, #8]
	ldr	r1, [r4, #4]
	str	r0, [sp, #4]
	ldr	r0, [r4]
	sub	r3, r3, #1
	str	ip, [sp]
	sub	r2, r2, #2
	sub	r1, r1, #1
	sub	r0, r0, #2
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L19
.L7:
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	str	r3, [r4, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L3:
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L5
	mov	r3, #0
	ldr	r0, .L20+12
	ldr	r2, .L20+16
	ldr	r1, [r0]
	str	r3, [r4, #16]
	ldr	r3, [r2]
	sub	r1, r1, #1
	add	r3, r3, #1
.L15:
	str	r1, [r0]
	str	r3, [r2]
	ldr	r0, .L20+20
	ldr	r3, .L20+24
	mov	lr, pc
	bx	r3
	b	.L5
.L19:
	mov	r3, #67108864
	mov	r0, #22272
	mov	r2, #0
	strh	r0, [r3, #104]	@ movhi
	ldr	r1, .L20+28
	ldr	r0, .L20+16
	ldr	ip, .L20+12
	strh	r1, [r3, #108]	@ movhi
	ldr	r3, [r0]
	ldr	r1, [ip]
	add	r3, r3, #1
	str	r2, [r4, #16]
	str	r3, [r0]
	sub	r1, r1, #1
	ldr	r0, .L20+20
	ldr	r3, .L20+24
	str	r1, [ip]
	str	r2, [r5, #20]
	mov	lr, pc
	bx	r3
	b	.L7
.L17:
	mov	ip, #0
	ldr	r0, .L20+12
	ldr	r2, .L20+32
	ldr	r1, [r0]
	ldr	r3, [r2]
	sub	r1, r1, #1
	str	r1, [r0]
	sub	r3, r3, #1
	str	ip, [r4, #16]
	ldr	r0, .L20+20
	ldr	r5, .L20+24
	str	r3, [r2]
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #4]
	b	.L2
.L18:
	ldr	r0, .L20+12
	ldr	r2, .L20+32
	ldr	r1, [r0]
	ldr	r3, [r2]
	str	r5, [r4, #16]
	sub	r1, r1, #1
	sub	r3, r3, #1
	b	.L15
.L21:
	.align	2
.L20:
	.word	player
	.word	collision
	.word	bullet
	.word	enemiesLeft
	.word	playerScore
	.word	.LC0
	.word	mgba_printf
	.word	-14420
	.word	playerLives
	.size	updateEnemies.part.0, .-updateEnemies.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet.part.0, %function
drawBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #27
	push	{r4, lr}
	sub	sp, sp, #8
	str	r3, [sp]
	ldr	r0, .L24
	ldr	r4, .L24+4
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	bullet
	.word	drawRect4
	.size	drawBullet.part.0, .-drawBullet.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #100
	mov	ip, #120
	mov	r0, #28
	mov	r1, #20
	ldr	r3, .L28
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L29:
	.align	2
.L28:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullet, %function
initBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #2
	mov	r0, #1
	ldr	r3, .L31
	ldm	r3, {r2, ip}
	ldr	r3, .L31+4
	add	r2, r2, #13
	stm	r3, {r2, ip}
	str	r0, [r3, #20]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	bx	lr
.L32:
	.align	2
.L31:
	.word	player
	.word	bullet
	.size	initBullet, .-initBullet
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"%d, enemy number\000"
	.align	2
.LC2:
	.ascii	"%d, spacer 2\000"
	.align	2
.LC3:
	.ascii	"%d, spacer 3\000"
	.align	2
.LC4:
	.ascii	"%d, spacer 4\000"
	.align	2
.LC5:
	.ascii	"%d, enemy x\000"
	.align	2
.LC6:
	.ascii	"%d, enemy y\000"
	.text
	.align	2
	.global	initEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L47
	sub	sp, sp, #12
	mov	lr, pc
	bx	r8
	ldr	r5, .L47+4
	smull	r3, r5, r0, r5
	sub	r5, r5, r0, asr #31
	add	r5, r5, r5, lsl #1
	sub	r5, r0, r5
	add	r10, r5, #2
	mov	r1, r10
	ldr	r0, .L47+8
	ldr	r7, .L47+12
	mov	lr, pc
	bx	r7
	ldr	r1, .L47+16
	ldr	r2, .L47+20
	cmp	r10, #0
	str	r10, [r1]
	str	r10, [r2]
	beq	.L33
	ldr	r6, .L47+24
	mov	fp, #0
	mov	r4, r6
	mov	r9, #5
	add	r5, r5, r5, lsl #2
	lsl	r5, r5, #1
	str	r6, [sp, #4]
	add	r5, r5, #20
.L38:
	mov	r1, #28
	mov	r2, #20
	mov	r3, #1
	cmp	r10, #3
	str	r9, [r4, #4]
	str	r1, [r4, #12]
	str	r2, [r4, #8]
	str	r3, [r4, #16]
	beq	.L35
	cmp	r10, #4
	beq	.L36
	cmp	r10, #2
	beq	.L46
.L37:
	add	fp, fp, #10
	cmp	fp, r5
	add	r4, r4, #24
	bne	.L38
	mov	r4, #0
	ldr	r6, [sp, #4]
	ldr	r8, .L47+28
	ldr	r5, .L47+32
.L39:
	ldr	r1, [r6]
	mov	r0, r8
	mov	lr, pc
	bx	r7
	add	r4, r4, #1
	ldr	r1, [r6, #4]
	mov	r0, r5
	mov	lr, pc
	bx	r7
	cmp	r10, r4
	add	r6, r6, #24
	bgt	.L39
.L33:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L46:
	mov	lr, pc
	bx	r8
	ldr	r3, .L47+36
	smull	r2, r3, r0, r3
	asr	r1, r0, #31
	add	r3, r3, r0
	rsb	r1, r1, r3, asr #6
	add	r3, r1, r1, lsl #1
	rsb	r1, r1, r3, lsl #3
	sub	r0, r0, r1, lsl #2
	add	r6, r0, #1
	mov	r1, r6
	ldr	r0, .L47+40
	mov	lr, pc
	bx	r7
	add	r1, fp, r6
	add	r3, fp, fp, lsl #3
	add	r1, r1, r3
	str	r1, [r4]
	b	.L37
.L35:
	mov	lr, pc
	bx	r8
	ldr	r3, .L47+44
	smull	r2, r3, r0, r3
	asr	r1, r0, #31
	rsb	r1, r1, r3, asr #4
	add	r3, r1, r1, lsl #1
	add	r1, r1, r3, lsl #2
	sub	r0, r0, r1, lsl #2
	add	r6, r0, #1
	mov	r1, r6
	ldr	r0, .L47+48
	mov	lr, pc
	bx	r7
	add	r1, r6, fp, lsl #1
	add	r3, fp, fp, lsl #2
	add	r1, r1, r3
	str	r1, [r4]
	b	.L37
.L36:
	mov	lr, pc
	bx	r8
	rsbs	r3, r0, #0
	and	r3, r3, #31
	and	r1, r0, #31
	rsbpl	r1, r3, #0
	add	r6, r1, #1
	mov	r1, r6
	ldr	r0, .L47+52
	mov	lr, pc
	bx	r7
	add	r1, fp, r6
	add	r1, r1, fp, lsl #2
	str	r1, [r4]
	b	.L37
.L48:
	.align	2
.L47:
	.word	rand
	.word	1431655766
	.word	.LC1
	.word	mgba_printf
	.word	currentEnemies
	.word	enemiesLeft
	.word	enemies
	.word	.LC5
	.word	.LC6
	.word	-1307163959
	.word	.LC2
	.word	1321528399
	.word	.LC3
	.word	.LC4
	.size	initEnemy, .-initEnemy
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	lr, #100
	mov	ip, #120
	mov	r5, #3
	mov	r0, #28
	mov	r1, #20
	ldr	r2, .L51
	ldr	r3, .L51+4
	str	r4, [r2]
	ldr	r2, .L51+8
	str	r4, [r3]
	str	r4, [r2, #20]
	ldr	r3, .L51+12
	ldr	r2, .L51+16
	str	lr, [r3]
	str	ip, [r3, #4]
	ldr	r6, .L51+20
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	str	r5, [r2]
	bl	initEnemy
	mov	r0, r5
	mov	r3, #16
	mov	r2, #83886080
	ldr	r1, .L51+24
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	r3, #16
	ldr	r2, .L51+28
	ldr	r1, .L51+32
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	r3, #16
	ldr	r2, .L51+36
	ldr	r1, .L51+40
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	r3, #16
	ldr	r2, .L51+44
	ldr	r1, .L51+48
	mov	lr, pc
	bx	r6
	ldr	r3, .L51+52
	strh	r4, [r3, #254]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	playerScore
	.word	coolDown
	.word	bullet
	.word	player
	.word	playerLives
	.word	DMANow
	.word	enemy04Pal
	.word	83886112
	.word	player01Pal+32
	.word	83886144
	.word	player04Pal+64
	.word	83886176
	.word	star04Pal+96
	.word	83886336
	.size	initGame, .-initGame
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L77
	ldrh	r2, [r3]
	tst	r2, #32
	push	{r4, lr}
	ldr	r3, .L77+4
	bne	.L54
	ldr	r1, [r3]
	cmp	r1, #0
	subgt	r1, r1, #4
	strgt	r1, [r3]
.L54:
	tst	r2, #16
	bne	.L55
	ldr	r1, [r3]
	cmp	r1, #211
	addle	r1, r1, #4
	strle	r1, [r3]
.L55:
	tst	r2, #64
	bne	.L56
	ldr	r1, [r3, #4]
	cmp	r1, #0
	subgt	r1, r1, #4
	strgt	r1, [r3, #4]
.L56:
	tst	r2, #128
	bne	.L57
	ldr	r1, [r3, #4]
	cmp	r1, #138
	addle	r1, r1, #4
	strle	r1, [r3, #4]
.L57:
	tst	r2, #1
	bne	.L58
	mov	ip, #2
	mov	lr, #1
	ldr	r0, [r3]
	ldr	r1, .L77+8
	add	r0, r0, #13
	str	r0, [r1]
	ldr	r0, [r3, #4]
	str	lr, [r1, #20]
	str	r0, [r1, #4]
	str	ip, [r1, #12]
	str	ip, [r1, #8]
.L58:
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bne	.L59
	ldr	r0, .L77+12
	ldr	r1, [r0]
	cmp	r1, #0
	ble	.L63
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r0]
	beq	.L63
.L53:
	pop	{r4, lr}
	bx	lr
.L59:
	ldr	r0, .L77+16
	ldr	r2, [r0]
	add	r1, r2, #1
	cmp	r1, #10
	str	r1, [r0]
	sub	r2, r2, #10
	bls	.L68
	cmp	r2, #9
	bhi	.L65
.L66:
	mov	r2, #67108864
	mov	lr, #33536
	mov	ip, #125
	ldr	r0, .L77+20
	strh	lr, [r2, #98]	@ movhi
	strh	ip, [r2, #96]	@ movhi
	strh	r0, [r2, #100]	@ movhi
.L65:
	cmp	r1, #199
	ble	.L53
	mov	r2, #0
	mov	r0, #250
	ldr	r1, .L77+12
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r0, [r1]
	pop	{r4, lr}
	bx	lr
.L63:
	tst	r2, #2
	bne	.L53
	mov	r2, #1
	mov	r1, #67108864
	mov	lr, #33536
	mov	ip, #125
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	r4, .L77+16
	ldr	r3, .L77+24
	str	r2, [r4]
	str	r2, [r0]
	strh	lr, [r1, #98]	@ movhi
	strh	ip, [r1, #96]	@ movhi
	pop	{r4, lr}
	strh	r3, [r1, #100]	@ movhi
	bx	lr
.L68:
	mov	r0, #67108864
	mov	lr, #33536
	mov	ip, #125
	cmp	r2, #9
	ldr	r2, .L77+24
	strh	lr, [r0, #98]	@ movhi
	strh	ip, [r0, #96]	@ movhi
	strh	r2, [r0, #100]	@ movhi
	bls	.L66
	b	.L53
.L78:
	.align	2
.L77:
	.word	buttons
	.word	player
	.word	bullet
	.word	coolDown
	.word	timeTrack
	.word	-14670
	.word	-15005
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L95
	bl	updatePlayer
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L80
	mov	r5, #0
	ldr	r4, .L95+4
.L82:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	add	r5, r5, #1
	movne	r0, r4
	blne	updateEnemies.part.0
.L81:
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #24
	bgt	.L82
.L80:
	ldr	r3, .L95+8
	ldr	r2, [r3, #4]
	cmp	r2, #0
	movle	r2, #0
	strle	r2, [r3, #20]
	ble	.L84
	ldr	r1, [r3, #20]
	cmp	r1, #0
	subne	r2, r2, #2
	strne	r2, [r3, #4]
.L84:
	ldr	r3, .L95+12
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L94
	pop	{r4, r5, r6, lr}
	bx	lr
.L94:
	pop	{r4, r5, r6, lr}
	b	initEnemy
.L96:
	.align	2
.L95:
	.word	currentEnemies
	.word	enemies
	.word	bullet
	.word	enemiesLeft
	.size	updateGame, .-updateGame
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemies.part.0
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L103
	push	{r4, lr}
	ldr	r2, [r3, #16]
	cmp	r2, #0
	ldreq	ip, .L103+4
	ldrne	ip, .L103+8
	sub	sp, sp, #8
	ldm	r3, {r0, r1}
	ldr	r2, [r3, #12]
	ldr	r4, .L103+12
	ldr	r3, [r3, #8]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	player
	.word	player01Bitmap
	.word	player04Bitmap
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L122
	ldr	r3, .L122+4
	mov	r0, #255
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	bl	drawPlayer
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L106
	mov	r5, #0
	ldr	r4, .L122+8
	ldr	r8, .L122+12
	ldr	r7, .L122+16
.L108:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	add	r5, r5, #1
	bne	.L119
.L107:
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #24
	bgt	.L108
.L106:
	ldr	r3, .L122+20
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	.L120
	ldr	r3, .L122+24
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L121
.L110:
	mov	r5, #20
	mov	r1, #0
	ldr	r4, .L122+28
	mov	r0, r1
	mov	r3, #1
	mov	r2, #240
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r1, #0
	mov	r3, #160
	mov	r0, r1
	mov	r2, #1
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #160
	mov	r2, #1
	mov	r1, #0
	mov	r0, #239
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r2, #240
	mov	r1, #159
	mov	r0, #0
	str	r5, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L119:
	str	r8, [sp]
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r7
	b	.L107
.L120:
	bl	drawBullet.part.0
	ldr	r3, .L122+24
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L110
.L121:
	mov	r3, #8
	ldr	r1, .L122+32
	mov	r2, r3
	str	r1, [sp]
	mov	r0, #172
	mov	r1, #3
	ldr	r4, .L122+16
	mov	lr, pc
	bx	r4
	b	.L110
.L123:
	.align	2
.L122:
	.word	currentEnemies
	.word	fillScreen4
	.word	enemies
	.word	enemy04Bitmap
	.word	drawImage4
	.word	bullet
	.word	coolDown
	.word	drawRect4
	.word	star04Bitmap
	.size	drawGame, .-drawGame
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldr	r2, .L133
	sub	sp, sp, #8
	ldr	r3, [r0, #8]
	str	r2, [sp]
	ldr	r4, .L133+4
	ldr	r2, [r0, #12]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L134:
	.align	2
.L133:
	.word	enemy04Bitmap
	.word	drawImage4
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L137
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxeq	lr
	b	drawBullet.part.0
.L138:
	.align	2
.L137:
	.word	bullet
	.size	drawBullet, .-drawBullet
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L146
	ldr	r2, [r3, #4]
	cmp	r2, #0
	ble	.L145
	ldr	r1, [r3, #20]
	cmp	r1, #0
	subne	r2, r2, #2
	strne	r2, [r3, #4]
	bx	lr
.L145:
	mov	r2, #0
	str	r2, [r3, #20]
	bx	lr
.L147:
	.align	2
.L146:
	.word	bullet
	.size	updateBullet, .-updateBullet
	.comm	bullet,24,4
	.comm	player,24,4
	.comm	enemies,96,4
	.comm	NOTES,2,2
	.comm	coolDown,4,4
	.comm	enemiesLeft,4,4
	.comm	timeTrack,4,4
	.comm	currentEnemies,4,4
	.comm	playerLives,4,4
	.comm	playerScore,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
