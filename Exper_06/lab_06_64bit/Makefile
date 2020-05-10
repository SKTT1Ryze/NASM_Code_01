#Makefile for assemble lab 6
#2020/5/10
#Manjaro
#hustccc
TARGET=shop_64
OBJECT=shop_64_nasm.o shop_64.c
SOURCE=shop_64.asm
GFLAG=
NFLAG=-f elf64
#make
$(TARGET):$(OBJECT)
	gcc $(OBJECT) -o $(TARGET)
$(OBJECT):$(SOURCE)
	#nasm -f elf64 shop_64.asm -o shop_64_nasm.o
	#nasm -f elf64 $(SOURCE) -o shop_64_nasm.o
	nasm $(NFLAG) $(SOURCE) -o shop_64_nasm.o

#clean
.PHONY:clean
clean:
	rm -rf *.o
