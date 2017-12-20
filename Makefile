CC = gcc
CFLAGS = -Wall -Werror -O2
LMFLAG = -lm

all: lz77

lz77: main.o lz77.o tree.o bitio.o
	$(CC) -o lz77 main.o lz77.o tree.o bitio.o $(LMFLAG)

main.o: main.c bitio.h lz77.h
	$(CC) $(CFLAGS) -c main.c $(LMFLAG)

lz77.o: lz77.c bitio.h tree.h
	$(CC) $(CFLAGS) -c lz77.c $(LMFLAG)

tree.o: tree.c tree.h
	$(CC) $(CFLAGS) -c tree.c $(LMFLAG)

bitio.o: bitio.c bitio.h
	$(CC) $(CFLAGS) -c bitio.c $(LMFLAG)

.PHONY: clean

clean:
	-rm -f *.o lz77
