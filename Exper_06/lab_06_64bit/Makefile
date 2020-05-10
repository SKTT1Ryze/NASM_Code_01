#Makefile for assemble lab 6
#2020/5/10
#Manjaro
#hustccc
TARGET=shop_64
OBJECT=shop_64_nasm.o shop_64.c
SOURCE=shop_64.asm
#make
$(TARGET):$(OBJECT)
	gcc $(OBJECT) -o $(TARGET)
$(OBJECT):$(SOURCE)
	nasm -f elf64 shop_64.asm -o shop_64_nasm.o

#clean
.PHONY:clean
clean:
	rm -rf *.o
