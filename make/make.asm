	counter equ 21h

	org	0x00
	goto	init

	org	0x04
	retfie

init:
	movlw	07h
	movwf	cmcon
	bsf	status,05h
	movlw	b'11111111'
	movwf	trisa
	clrw
	movwf	trisb
	bcf	status,05h
	goto main

lookup:
	movf	counter,0
	addwf	pcl,1

	retlw	b'11000000';0
	retlw	b'11111001';1
	retlw	b'10100100';2
	retlw	b'10110000';3
	retlw	b'10011001';4
	retlw	b'10010010';5
	retlw	b'10000011';6
	retlw	b'11111000';7
	retlw	b'10000000';8
	retlw	b'10011000';9
	retlw	b'10001000';a
	retlw	b'10000010';b
	retlw	b'11000110';c
	retlw	b'10100001';d
	retlw	b'10000110';e
	retlw	b'10001110';f

adding:
	addwf	counter,1

	return

main:
	clrf	counter
	btfsc	porta,4h
	movlw	b'00000001'
	call	adding
	clrw
	btfsc	porta,5h
	movlw	b'00000010'
	call	adding
	clrw
	btfsc	porta,6h
	movlw	b'00000100'
	call	adding
	clrw
	btfsc	porta,7h
	movlw	b'00001000'
	call	adding
	clrw
	call	lookup
	movwf	portb
	clrw
	goto	main
	end