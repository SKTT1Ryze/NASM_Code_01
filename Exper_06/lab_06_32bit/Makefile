#Makefile for lab 6
#2020/5/9

shop:shop_asm.o shop_c.o
	sudo ld -m elf_i386  shop_asm.o shop_c.o -o shop
shop_asm.o:shop.asm
	sudo nasm -f  elf shop.asm -o shop_asm.o
shop_c.o:shop.c
	sudo gcc -g -m32 -c shop.c -o shop_c.o

