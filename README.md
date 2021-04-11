# Port of edfries-chess to XASM

## Usage

    git clone https://github.com/lybrown/edfries-chess-xasm
    cd edfries-chess-xasm
    git clone https://github.com/savetz/edfries-chess
    make

## Notes

The original code only works on 400/800 machines due to calls to EOUTCH at
$F6A4. This patch includes a substitute routine.

## Discussion

https://atariage.com/forums/topic/318961-assembly-source-code-for-5-programs-by-ed-fries/?tab=comments#comment-4791079
