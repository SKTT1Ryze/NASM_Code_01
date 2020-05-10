//head file for assemble lab 6
//2020/5/10
//Manjaro
//hustccc
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define	N	20
#define	root	1
#define	customer	0
#define	good_num	10
typedef	struct	good
{
	char	name[10];
	char	showname[10];
	long	discount;
	long	in_price;
	long	out_price;
	long	in_num;
	long	out_num;
	long	recommendation;
}good;
