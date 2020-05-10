/*
 * d
 * assemble lab 6 C file
 * 2020/5/10
 * Manjaro
 * hustccc
 */
#include"Global.h"
extern	long	nasmadd(long a, long b);
extern	long	nasmsub(long a,long b);
extern	void	nasmprintf(long fd,char* msg,long len);
extern	void	nasmscanf(long fd,char* msg,long len);
void	Menu();
void	startHint();
int	task_1();
int	task_2();
int	task_3();
int	task_4();
void	goodInit();

int	status=customer;
int	good_index;
char	*name="hustccc\n";
char	*passwd="sktt1faker\n";
char	login_name[N];
char	login_passwd[N];
char	in_good_name[10];
char	*str1="customer";
char	*str2="root";
char	*str3="good";
good	good_list[good_num];
int	main()
{
	char	op;
	goodInit();
	startHint();
	good_index=5;
	while(1)
	{
		if(status==root)
		{
			printf("[%s][%s] ",str2,good_list[good_index].showname);
		}
		else
		{
			printf("[%s][%s] ",str1,good_list[good_index].showname);
		}
		//op=getchar();
		scanf("%c",&op);
		switch(op){
			case '1':task_1();getchar();break;
			case '2':task_2();getchar();break;
			case '3':task_3();getchar();break;
			case '4':task_4();getchar();break;
			case '5':printf("5\n");getchar();break;
			case '6':printf("6\n");getchar();break;
			case '7':printf("7\n");getchar();break;
			case '8':printf("8\n");getchar();break;
			case '9':printf("Quit\n");return	0;getchar();break;
			case 'm':printf("m\n");getchar();break;
			case 'h':printf("h\n");getchar();break;
			case 's':printf("s\n");getchar();break;
			case 'q':printf("Quit\n");return	0;getchar();break;
			case 10 :break;
			default :printf("Command not found: %c\n",op);getchar();break;
		}
	}
	return	0;
}

void	goodInit()
{
	strcpy(good_list[0].name,"book\n");
	strcpy(good_list[0].showname,"book");
	good_list[0].discount=9;
	good_list[0].in_price=20;
	good_list[0].out_price=30;
	good_list[0].in_num=10;
	good_list[0].out_num=5;
	good_list[0].recommendation=0;

	strcpy(good_list[1].name,"pen\n");
	strcpy(good_list[1].showname,"pen");
	good_list[1].discount=8;
	good_list[1].in_price=11;
	good_list[1].out_price=25;
	good_list[1].in_num=16;
	good_list[1].out_num=7;
	good_list[1].recommendation=0;

	strcpy(good_list[2].name,"computer\n");
	strcpy(good_list[2].showname,"computer");
	good_list[2].discount=7;
	good_list[2].in_price=1000;
	good_list[2].out_price=2000;
	good_list[2].in_num=100;
	good_list[2].out_num=50;
	good_list[2].recommendation=0;

	int i=3;
	for(i=3;i<good_num;i++)
	{
		strcpy(good_list[i].name,"temp\n");
		strcpy(good_list[i].showname,"temp");
		good_list[i].discount=10;
		good_list[i].in_price=10;
		good_list[i].out_price=15;
		good_list[i].in_num=10;
		good_list[i].out_num=5;
		good_list[i].recommendation=0;
	}
}

void	Menu()
{
	nasmprintf(1,"-----menu-----\n",15);
	nasmprintf(1,"[user] \n",8);
	nasmprintf(1,"[good] \n",8);
	nasmprintf(1,"[1] Login\n",11);
	nasmprintf(1,"[2] Find\n",10);
	nasmprintf(1,"[3] Buy\n",9);
	nasmprintf(1,"[4] Compute\n",13);
	nasmprintf(1,"[5] Rank\n",10);
	nasmprintf(1,"[6] Change\n",12);
	nasmprintf(1,"[7] Move\n",10);
	nasmprintf(1,"[8] Address\n",13);
	nasmprintf(1,"[9] Quit\n",10);

}
void	startHint()
{
	printf("-----Welcome to my shop!-----\n");
	printf("-----------hustccc-----------\n\n");
	printf("=============================\n");
	printf("This is my last assemble lab\n");
	printf("Please enjoy here\n");
	printf("=============================\n\n");
	printf("[Usage]\n");
	printf("Type 1~9 to switch stack\n");
	printf("1.Login   => login as root mode\n");
	printf("2.Find    => find what you want in the shop\n");
	printf("3.Buy     => buy the good you chose\n");
	printf("4.Compute => compute the recommendation\n");
	printf("5.Rank    => rank the good list base on recommendation\n");
	printf("6.Change  => change the good information\n");
	printf("7.Move    => change the stack environment\n");
	printf("8.Address => info register SS\n");
	printf("9.Quit    => return to shell\n\n");
	printf("[Option]\n");
	printf("1.Type \'m\' to show menu\n");
	printf("2.Type \'h\' to show help\n");
	printf("3.Type \'s\' to show status\n");
	printf("\n");
	printf("Good luck\n");
}

int	task_1()
{
	int	i=N;
	while(i)
	{
		login_name[i-1]=0;
		login_passwd[--i]=0;
	}
	nasmprintf(1,"Login:",6);
	nasmscanf(0,login_name,N);
	nasmprintf(1,"Passwd:",7);
	nasmscanf(0,login_passwd,N);
	if(!strcmp(login_name,name)&&!strcmp(login_passwd,passwd))
	{
		nasmprintf(1,"Welcome back,master!\n",22);
		status=root;
	}
	else
	{
		nasmprintf(1,"Login faild\n",13);
		status=customer;
	}
	return 	0;
}

int	task_2()
{
	int	i=0;
	for(i=0;i<10;i++)
		in_good_name[i]=0;
	nasmprintf(1,"What you are looking for?",26);
	nasmscanf(0,in_good_name,10);
	for(i=0;i<good_num;i++)
	{
		if(!strcmp(in_good_name,good_list[i].name))
		{
			printf("Found:%s",in_good_name);
			good_index=i;
			printf("[discount]       %d\n",good_list[i].discount);
			printf("[in_price]       %d\n",good_list[i].in_price);
			printf("[out_price]      %d\n",good_list[i].out_price);
			printf("[in_num]         %d\n",good_list[i].in_num);
			printf("[out_num]        %d\n",good_list[i].out_num);
			printf("[recommendation] %d",good_list[i].recommendation);
			getchar();
			return	0;
		}

	}
	printf("Not found:%s",in_good_name);
	return	1;
}
int	task_3()
{
	printf("Buy:%s\n",good_list[good_index].showname);
	good_list[good_index].out_num=nasmadd(good_list[good_index].out_num,1);
	printf("[out_num] %ld",good_list[good_index].out_num);
	getchar();
	return	0;
}
int	task_4()
{
	int	a=66;
	int	b=2;
	printf("%ld\n",nasmsub(a,b));
	//rdi rsi rdx rcx r8 r9
	return	0;
}
