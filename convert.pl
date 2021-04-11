#!/usr/bin/perl
use strict;
use warnings;

my $id = 1;

while (<>) {
    s/^\d+ //;
    s/\s+\n/\n/;
    $_ = lc $_;
    if (/^(\w+)\s+(\w+.*\n)/) {
        print "$1\n";
        $_ = "    $2";
    }
    s/\.byte/dta/;
    s/\.word (\S+)/dta a($1)/;
    s/^\s*\*\s*=\s*/  org /;
    s/^(\S+)\s*=\s*/$1 equ /;
    s/(ror|rol|asl|lsr) a/$1 @/;
    s/\s*\.opt no list.*\n//;
    s/.*sysequ.*/   icl 'sys.asm'/;
    s/.*iomac.*\n//;
    s/\.include #d:(\S+)\.src/icl '$1.asm'/;
    s/\.include #d:(\S+)/icl '$1'/;
    s/^\s+/    /;
    s/\$f6a4/putc/;
    s/\$f6e2/getc/;
    if (/(open\s+(\w+),(\w+),(\w+),"(\S+)")/) {
        my ($cmd, $ch, $aux1, $aux2, $spec) = ($1, $2, $3, $4, $5);
        $aux1 =~ s/opout/OPNOT/;
        $spec =~ s/p:/P:/;
        $_ = qq{    ; $cmd
    ldx #$ch
    mva #OPEN ICCOM,x
    mva #$aux1 ICAX1,x
    mva #$aux2 ICAX2,x
    jmp lbl$id
spec$id
    dta c'$spec',0
lbl$id
    mwa #spec$id ICBAL,x
    jsr CIOV
};
        ++$id;
    }
    if (/(bput\s+(\w+),(\w+),(\w+))/) {
        my ($cmd, $ch, $buf, $len) = ($1, $2, $3, $4);
        $_ = qq{    ; $cmd
    ldx #$ch
    mva #PUTCHR ICCOM,x
    mwa #$buf ICBAL,x
    mwa #$len ICBLL,x
    jsr CIOV
};
        ++$id;
    }
    s/dta "(.*)"/dta c'@{[uc $1]}'/;
    print;
}
