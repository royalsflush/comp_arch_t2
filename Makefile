CC = gcc
CFLAGS = -Wall -Wshadow

.PHONY: all clean cc asm

all: cc asm

cc: t2_main.c t2.c t2.h
	echo Compiling C version...
	$(CC) t2_main.c t2.c -o t2_c $(CFLAGS)

asm: t2_main.c t2.asm t2.h
	echo Compiling Assembly version...
	$(CC) t2_main.c t2.asm -o t2_asm $(CFLAGS)

clean:
	rm t2_c t2_asm
