;       SCREEN

ROWCRS equ $54
COLCRS equ $55

TEMP1 equ $312+1                   ;TEMP LOCATIONS

;       IOCB OFFSETS

IOCB equ $340                   ;I/O CONTROL BLOCKS
ICHID equ $340                   ;HANDLER INDEX ($FF = FREE)
ICDNO equ $341                   ;DEVICE NUMBER (DRIVE NUMBER)
ICCOM equ $342                   ;COMMAND CODE
ICSTA equ $343                   ;STATUS
ICBAL equ $344                   ;BUFFER ADDRESS
ICBAH equ $345                   ; ...
ICPTL equ $346                   ;PUT BYTE ROUTINE ADDRESS - 1
ICPTH equ $347                   ; ...
ICBLL equ $348                   ;BUFFER LENGTH
ICBLH equ $349                   ; ...
ICAX1 equ $34A                   ;AUXILLARY INFO
ICAX2 equ $34B                   ; ...
ICSPR equ $34C                   ;4 SPARE BYTES

;       JUMP VECTOR TABLE

DISKIV equ $E450                  ;DISK INITIALIZATION
DSKINV equ $E453                  ;DISK INTERFACE
CIOV equ $E456                  ;CIO ROUTINE
SIOV equ $E459                  ;SIO ROUTINE
SETVBV equ $E45C                  ;SET VERTICAL BLANK VECTORS
SYSVBV equ $E45F                  ;SYSTEM VERTICAL BLANK ROUTINE
XITVBV equ $E462                  ;EXIT VERTICAL BLANK ROUTINE
SIOINV equ $E465                  ;SIO INIT
SENDEV equ $E468                  ;SEND ENABLE ROUTINE
INTINV equ $E46B                  ;INTERRUPT HANDLER INIT
CIOINV equ $E46E                  ;CIO INIT
BLKBDV equ $E471                  ;BLACKBOARD MODE
WARMSV equ $E474                  ;WARM START ENTRY POINT
COLDSV equ $E477                  ;COLD START ENTRY POINT
RBLOKV equ $E47A                  ;CASSETTE READ BLOCK VECTOR
CSOPIV equ $E47D                  ;CASSETTE OPEN VECTOR
DSOPIV equ $E480                  ;CASSETTE OPEN FOR INPUT VECTOR

;       COMMAND CODES FOR IOCB

OPEN equ $03                    ;OPEN FOR INPUT/OUTPUT
GETREC equ $05                    ;GET RECORD (TEXT)
GETCHR equ $07                    ;GET CHARACTER(S)
PUTREC equ $09                    ;PUT RECORD (TEXT)
PUTCHR equ $0B                    ;PUT CHARACTER(S)
CLOSE equ $0C                    ;CLOSE DEVICE
STATIS equ $0D                    ;STATUS REQUEST
SPECIL equ $0E                    ;SPECIAL ENTRY COMMANDS

;       AUX1 VALUES FOR OPEN

APPEND equ $01                    ;OPEN FOR APPEND
DIRECT equ $02                    ;OPEN FOR DIRECTORY ACCESS
OPNIN equ $04                    ;OPEN FOR INPUT
OPNOT equ $08                    ;OPEN FOR OUTPUT
OPNINO equ [OPNIN|OPNOT]            ;OPEN FOR INPUT/OUTPUT
MXDMOD equ $10                    ;OPEN FOR MIXED MODE
INSCLR equ $20                    ;OPEN WITHOUT CLEARING SCREEN
