    icl 'main.asm'

putc
    cmp #13
    beq putc_newline
    tax
    ldy ROWCRS
    mva putc_lo,y $FE
    mva putc_hi,y $FF
    ldy COLCRS
    ; asc2int
    ; https://atariage.com/forums/topic/289053-programmers-reference-manual/?do=findComment&comment=4238974
    ;-------
    txa
    asl @
    sbc #$3F
    spl:eor #$40
    cpx #128
    ror @
    ;-------
    sta ($FE),y
    iny
    sty COLCRS
    cpy #40
    bne putc_1
putc_newline
    mva #0 COLCRS
    inc ROWCRS
    lda ROWCRS
    eor #25
    sne:sta ROWCRS
putc_1
    rts

putc_lo
    :24 dta <[$BC40+#*40]
putc_hi
    :24 dta >[$BC40+#*40]

getc
    lda #0
    rts
