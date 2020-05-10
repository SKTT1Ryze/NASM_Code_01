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
void	Menu();
void	startHint();
int	main()
{
	int	i=0;
	int	a,b;
	char	op;
	char	*user="user";
	char	*good="good";
	//nasmprintf(1,"this is printed by nasm\n",25);
	startHint();
	while(1)
	{
		printf("[%s][%s] ",user,good);
		//op=getchar();
		scanf("%c",&op);
		switch(op){
			case '1':printf("1\n");getchar();break;
			case '2':printf("2\n");getchar();break;
			case '3':printf("3\n");getchar();break;
			case '4':printf("4\n");getchar();break;
			case '5':printf("5\n");getchar();break;
			case '6':printf("6\n");getchar();break;
			case '7':printf("7\n");getchar();break;
			case '8':printf("8\n");getchar();break;
			case '9':printf("9\n");return	0;getchar();break;
			case 'm':printf("m\n");getchar();break;
			case 'h':printf("h\n");getchar();break;
			case 's':printf("s\n");getchar();break;
			case 'q':printf("Quit\n");return	0;getchar();break;
			default :printf("Command not found: %c\n",op);getchar();break;
		}
	}
	return	0;
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
	printf("9.Quit    => return to shell\n");
	printf("[Option]\n");
	printf("1.Type \'m\' to show menu\n");
	printf("2.Type \'h\' to show help\n");
	printf("3.Type \'s\' to show status\n");
	printf("\n");
	printf("Good luck\n");
}


