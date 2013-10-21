CC = gcc
CFLAGS = -Wall -Wshadow

.PHONY: cc asm

all: cc asm
cc: t2_main.c t2.c t2.h
	echo Compiling C version...
	$(CC) t2_main.c t2.c -o t2_c $(CFLAGS)
asm:
	echo Compiling Assembly version...

clean:
	rm t2_c t2_asm
