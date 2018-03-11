;=============================================================================
; @(#)delay50000.asm
;                       ________.________
;   ____   ____  ______/   __   \   ____/
;  / ___\ /  _ \/  ___/\____    /____  \ 
; / /_/  >  <_> )___ \    /    //       \
; \___  / \____/____  >  /____//______  /
;/_____/            \/                \/ 
; Copyright (c) 2017 by Alessandro Fraschetti (gos95@gommagomma.net).
;
; This file is part of the xp-pic-asm project:
;     https://github.com/gos95-electronics/xp-pic-asm
; This code comes with ABSOLUTELY NO WARRANTY.
;
; Author.....: Alessandro Fraschetti
; Company....: gos95
; Target.....: Microchip PIC 16Fxxx Microcontroller
; Compiler...: Microchip Assembler (MPASM)
; Version....: 1.0 2018/03/09
;
; Module.....: DELAY50000
; Description: 50000 cycles delay routine
;=============================================================================

        TITLE       'DELAY50000 - 50000 cycles delay'
        SUBTITLE    'Part of the xp-delay-library'

        GLOBAL      DELAY50000


;=============================================================================
; Variable declarations
;=============================================================================
GPR_VAR         UDATA
localvar1       RES         1
localvar2       RES         1


;=============================================================================
; Module
;=============================================================================
        CODE                                    ; begin module
DELAY50000
        movlw       0x0E                        ; 49993 cycles
        movwf       localvar1
        movlw       0x28
        movwf       localvar2
delay50000_loop
        decfsz      localvar1, F
        goto        $+2
        decfsz      localvar2, F
        goto        delay50000_loop
        goto        $+1                         ; 3 cycles
        nop

        return                                  ; 4 cycles (including call)

        END                                     ; end module