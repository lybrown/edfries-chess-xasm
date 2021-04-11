src_dir := edfries-chess
sources := $(wildcard $(src_dir)/*.src)
asm := $(foreach src,$(sources),$(notdir $(basename $(src))).asm)

r:

# convert
c: $(asm)

out = > $@~ && mv $@~ $@

%.asm: $(src_dir)/%.src convert.pl
	./convert.pl $< $(out)

# assemble
x: port.xex
port.xex: $(asm) port.asm sys.asm

%.xex: %.asm
	xasm /o:$@ /l:$*.lst /t:$*.lab $*.asm
	perl -pi -e 's/^n /  /' $*.lab

# run
r: port.run

%.run: %.xex
	altirra $<

# clean
clean:
	rm $(asm) *.lab *.lst *.xex
