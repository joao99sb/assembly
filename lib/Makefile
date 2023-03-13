converter = converter
tstLib = tstLib

tstLib:${tstLib}.o
	ld -s -o ${tstLib} ${tstLib}.o
	rm -rf *.o

converter:${converter}.o
	ld -s -o ${converter} ${converter}.o
	rm -rf *.o
	

%.o: %.asm
	nasm -f elf64 $<
