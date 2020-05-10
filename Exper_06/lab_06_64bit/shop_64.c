/*
 * assemble lab 6 C file
 * 2020/5/10
 * Manjaro
 * hustccc
 */
#include<stdio.h>
#include<stdlib.h>
extern	long	add(long a, long b);
extern	void	nasmprintf(long fd,char* msg,long len);
int	main()
{
	int	i=0;
	int	a,b;
	printf("-----Welcome to my shop!-----\n");
	printf("-----Menu-----\n");
	printf("[%d] call nasm function here...\n",i);
	i++;
	nasmprintf(0,"this is printed by nasm\n",25);
	nasmprintf(0,"input a and b\n",15);
	scanf("%d",&a);
	scanf("%d",&b);
	printf("[%d] %d\n",i,add(a,b));
	i++;
	return	0;
}
