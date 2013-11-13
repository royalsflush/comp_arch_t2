CFLAGS = -Wall -Wshadow
ASMFLAGS = -f elf

.PHONY: all clean cc asm fib

all: cc asm fib

cc: t2_main.c t2.c t2.h gcc_int64.h
	echo Compiling C version...
	gcc t2_main.c t2.c -o t2_c $(CFLAGS)

asm: t2_main.c t2.asm t2.h gcc_int64.h
	echo Compiling Assembly version...
#	gcc t2_main.c t2.asm -o t2_asm $(CFLAGS)

fib: x64codegen.cpp fib64.h fib64.asm gcc_int64.h
	nasm -f elf fib64.asm
	gcc -c x64codegen.cpp $(CFLAGS)
	gcc x64codegen.o -m64 fib64.o -o fib64 $(CFLAGS)

clean:
	rm t2_c t2_asm *.o
