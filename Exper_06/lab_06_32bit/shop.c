//80X86 lab 6
//2020/5/9
//Manjaro
//hustccc
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
void	nasmprintf(int fd,char* msg,int length);
void 	nasmscanf(int fd,char* msg,int length);
int menu()
{	
	nasmprintf(1,"Welcome to my shop!\n",20);
	nasmprintf(1,"-----Menu-----\n",16);
	nasmprintf(1,"[user] \n",8);
	nasmprintf(1,"[good] \n",9);
	nasmprintf(1,"[1] Login\n",11);
	nasmprintf(1,"[2] Find\n",10);
	nasmprintf(1,"[3] Buy\n",9);
	nasmprintf(1,"[4] Compute\n",13);
	nasmprintf(1,"[5] Rank",10);
	nasmprintf(1,"[6] Change\n",12);
	nasmprintf(1,"[7] Move\n",10);
	nasmprintf(1,"[8] Address\n",13);
	nasmprintf(1,"[9] Quit\n",10);
	nasmprintf(1,"[*] Please input number(1~9):",30);

	return 0;
}

