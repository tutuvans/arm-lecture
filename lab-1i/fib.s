	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, lr}
	mov r3,#-1	@r3=pre
	mov r4,#1	@r4=now	
	mov r5,#0	@r5=result
	mov r6,r0	@r6 is i
	@ END CODE MODIFICATION

.for_loop:
	@countdown loop
	add r5,r3,r4	@result=pre+now
	mov r3,r4	@pre=now
	mov r4,r5	@now=result
	subs r6,r6,#1	@i=i-1
	it ge
	bge .for_loop

	mov r0,r5
	pop {r3,r4,r5,r6,pc}

	.size fibonacci, .-fibonacci
	.end
