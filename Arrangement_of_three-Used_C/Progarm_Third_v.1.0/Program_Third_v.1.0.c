/**@pram......
   @author: H.Chang Ma
   @email: mhzever@live.com
   @Creat Time:2014/4/5 
   @Completion Time:
*/
#include<stdio.h>
#include<stdlib.h>
typedef int Status;
#define OK 1
#define ERROR 0
struct nodeN{
	int data[5];
	struct nodeN *next;
};
struct nodeM{
	int data[6];
	struct nodeM *next;
};
struct nodeLF{
	int data[15];
	struct nodeLF *next;
};
struct nodeLS{
	int data[18];
	struct nodeLS *next;
};
struct nodeF{
	int data0[15];
	int data1[18];
	struct nodeF *next;
};
typedef struct nodeN *LinkListN;
typedef struct nodeM *LinkListM;
typedef struct nodeLF *LinkListLF;
typedef struct nodeLS *LinkListLS;
typedef struct nodeF *LinkListF;
Status LinkListN_Init(LinkListN *N)
{
	(*N)=(LinkListN)malloc(sizeof(struct nodeN));
	if(!(*N))
	{
		return ERROR;
	}
	(*N)->next=NULL;
	return OK;
}
Status LinkListM_Init(LinkListM *M)
{
	(*M)=(LinkListM)malloc(sizeof(struct nodeM));
	if(!(*M))
	{
		return ERROR;
	}
	(*M)->next=NULL;
	return OK;
}
Status LinkListLF_Init(LinkListLF *LF)
{
	(*LF)=(LinkListLF)malloc(sizeof(struct nodeLF));
	if(!(*LF))
	{
		return ERROR;
	}
	(*LF)->next=NULL;
	return OK;
}
Status LinkListLS_Init(LinkListLS *LS)
{
	(*LS)=(LinkListLS)malloc(sizeof(struct nodeLS));
	if(!(*LS))
	{
		return ERROR;
	}
	(*LS)->next=NULL;
	return OK;
}
Status LinkListF_Init(LinkListF *F)
{
	(*F) = (LinkListF)malloc(sizeof(struct nodeF));
	if(!(*F))
		return ERROR;
	(*F)->next=NULL;
	return OK;
}
/*
-------------- ------ 
| 0 | 1 | 2 | 3 | 4 | 
————————----- 
*/
void First_Step(int (*a)[2])//生成0，1或者2，3H或4，5处可能的序列 
{
	int i,j=0,k;
	for(i=0;i<11;i++)
	{
		for(k=0;k<11;k++,j++)
		{
			if(i<k)
			{
				a[j][0]=i;
				a[j][1]=k;
			}
			else if(i>=k)
			{
				j--;
			}
		}
	}
}
void Print_First_Step(int (*a)[2])//打印a[45][2] 
{
	int i,j,cou=0;
	for(i=0;i<55;i++)
		{
			for(j=0;j<2;j++)
				{
					cou++;
					printf("%d ",a[i][j]);
				}
			printf("\n");
		}
		printf("%d\n",cou);	
}

//*********************///
//*********************///
void Second_Step_N(int (*a)[2],LinkListN *N)//确定可行的序列0，1，2，3，4 
{
	LinkListN p,temp;
	int i,j,k,flag,flag0;
	p=(*N);
	for(i=0;i<55;i++)
	{
		temp=(LinkListN)malloc(sizeof(struct nodeN));
		if(!temp)
		{
			printf("malloc temp ERROR,and located Second_Step_N()");
			return ;
		}
		flag=0;
		for(j=0;j<55;j++)
		{
			if(flag==1)
			{
				temp=(LinkListN)malloc(sizeof(struct nodeN));
				if(!temp)
				{
					printf("malloc temp ERROR,and located Second_Step()");
					return ;
				}
			}
			flag=0;
			temp->data[0]=a[i][0];
			temp->data[1]=a[i][1];
			if(a[j][0]>a[i][1])
			{
				flag++;
				temp->data[2]=a[j][0];
				temp->data[3]=a[j][1];
			}
			if(flag==1)
			{
				
				for(k=0;k<11;k++)
				{
					flag0=0;
					if(k>temp->data[3])
					{
						temp->data[4]=k;
						p->next=temp;
						p=temp;
						flag0++;
					}
					if(flag0==1)
					{
						temp=(LinkListN)malloc(sizeof(struct nodeN));
						if(!temp)
						{
							printf("malloc temp ERROR,and located Second_Step()");
							return ;
						}
						temp->data[0]=p->data[0];	
						temp->data[1]=p->data[1];
						temp->data[2]=p->data[2];
						temp->data[3]=p->data[3];	
					}
				}
			}
		}
		p->next=NULL;
	}
	p=(*N)->next;
}
void Second_Step_M(int (*a)[2],LinkListM *M)//确定可行的序列0，1，2，3，4 ,5
{
	LinkListM p,temp;
	int i,j,k,flag,flag0;
	p=(*M);
	for(i=0;i<55;i++)
	{
		temp=(LinkListM)malloc(sizeof(struct nodeM));
		if(!temp)
		{
			printf("malloc temp ERROR,and located Second_Step_N_M()");
			return ;
		}
		flag=0;
		for(j=0;j<55;j++)
		{
			if(flag==1)
			{
				temp=(LinkListM)malloc(sizeof(struct nodeM));
				if(!temp)
				{
					printf("malloc temp ERROR,and located Second_Step_M()");
					return ;
				}
			}
			flag=0;
			temp->data[0]=a[i][0];
			temp->data[1]=a[i][1];
			if(a[j][0]>a[i][1])
			{
				flag++;
				temp->data[2]=a[j][0];
				temp->data[3]=a[j][1];
			}
			if(flag==1)
			{
				
				for(k=0;k<55;k++)
				{
					flag0=0;
					if(a[k][0]>a[j][1])
					{
						temp->data[4]=a[k][0];
						temp->data[5]=a[k][1];
						p->next=temp;
						p=temp;
						flag0++;
					}
					if(flag0==1)
					{
						temp=(LinkListM)malloc(sizeof(struct nodeM));
						if(!temp)
						{
							printf("malloc temp ERROR,and located Second_Step_M()");
							return ;
						}
						temp->data[0]=p->data[0];	
						temp->data[1]=p->data[1];
						temp->data[2]=p->data[2];
						temp->data[3]=p->data[3];	
					}
				}
			}
		}
		p->next=NULL;
	}
	p=(*M)->next;
}
void Traversal_N(LinkListN N)
{
	LinkListN p;
	int i;
	FILE *fp=fopen(".\\LinkList_N.txt","w");
	if(!fp)
	{
		printf("open or creat file failed.\n");
		return ;
	} 
	p=N->next;
	while(p)
	{
		for(i=0;i<5;i++)
		{
			fprintf(fp,"%d ",p->data[i]);
		}
		fprintf(fp,"\n");
		p=p->next; 
	}
	fclose(fp);
}
void Traversal_M(LinkListM M)
{
	LinkListM p;
	int i;
	FILE *fp=fopen(".\\LinkList_M.txt","w");
	if(!fp)
	{
		printf("open or creat file failed.\n");
		return;
	}
	p=M->next;
	while(p)
	{
		for(i=0;i<6;i++)
		{
			fprintf(fp,"%d ",p->data[i]);
		}
		fprintf(fp,"\n");
		p=p->next; 
	}
	fclose(fp);
}
void Traversal_LF(LinkListLF LF)
{
	LinkListLF p;
	int i;
	FILE *fp=fopen(".\\LinkList_LF.txt","w");
	if(!fp)
	{
		printf("open or creat file failed.\n");
		return;
	}
	p=LF->next;
	while(p)
	{
		for(i=0;i<15;i++)
		{
			fprintf(fp,"%d ",p->data[i]);
		}
		fprintf(fp,"\n");
		p=p->next; 
	}
	fclose(fp);
}
void Traversal_LS(LinkListLS LS)
{
	LinkListLS p;
	int i;
	FILE *fp=fopen(".\\LinkList_LS.txt","w");
	if(!fp)
	{
		printf("open or creat file failed.\n");
		return;
	}
	p=LS->next;
	while(p)
	{
		for(i=0;i<18;i++)
		{
			fprintf(fp,"%d ",p->data[i]);
		}
		fprintf(fp,"\n");
		p=p->next; 
	}
	fclose(fp);
}
void Traversal_F(LinkListF F)
{
	LinkListF p;
	int i,j;
	FILE *fp=fopen(".\\Result.txt","w");
	if(!fp)
	{
		printf("open or creat file failed.\n");
		return;
	}
	if(!(F->next))
	{
		printf("F is empty.");
		return;
	}
	p=F->next;
	while(p)
	{
			for(i=0;i<5;i++)
			{
				fprintf(fp,"%d  ",p->data0[i]);
			}
			fprintf(fp,"        ");
			for(i=5;i<10;i++)
			{
				fprintf(fp,"%d  ",p->data0[i]);
			}
			fprintf(fp,"        ");
			for(i=10;i<15;i++)
			{
				fprintf(fp,"%d  ",p->data0[i]);
			}
			
			/////////////////////
			fprintf(fp,"\n");
			for(j=0;j<6;j++)
			{
				fprintf(fp,"%d  ",p->data1[j]);
			}
			fprintf(fp,"    ");
			for(j=6;j<12;j++)
			{
				fprintf(fp,"%d  ",p->data1[j]);
			}
			fprintf(fp,"    ");
			for(j=12;j<18;j++)
			{
				fprintf(fp,"%d  ",p->data1[j]);
			}
			fprintf(fp,"\n");
		//	printf("-------------------------------------------------------\n");
			fprintf(fp,"-----------------------------------------------------------------\n");
		p=p->next; 
	}
	fclose(fp);
}
int LinkListN_Length(LinkListN N)//计算链表N长度 
{
	LinkListN n=N->next;
	int length=0;
	while(n)
	{
		length++;
		n=n->next;
	}
	return length;
}
int LinkListM_Length(LinkListM M)//计算链表M长度 
{
	LinkListM n=M->next;
	int length=0;
	while(n)
	{
		length++;
		n=n->next;
	}
	return length;
}
int LinkListLF_Length(LinkListLF LF)//计算链表LF长度 
{
	LinkListLF n=LF->next;
	int length=0;
	while(n)
	{
		length++;
		n=n->next;
	}
	return length;
}
int LinkListLS_Length(LinkListLS LS)//计算链表LS长度 
{
	LinkListLS n=LS->next;
	int length=0;
	while(n)
	{
		length++;
		n=n->next;
	}
	return length;
}
int LinkListF_Length(LinkListF F)//计算链表F长度 
{
	LinkListF n=F->next;
	int length=0;
	while(n)
	{
		length++;
		n=n->next;
	}
	return length;
}
void Free_N(LinkListN *N)//êí·?oó?ú??ó?μ?á′±í 
{
	LinkListN temp,p=(*N)->next;
	while(p)
	{
		temp=p;
		p=p->next; 
		free(temp);
	}
	(*N)->next=NULL; 
}
void Free_M(LinkListM *M)//êí·?oó?ú??ó?μ?á′±í 
{
	LinkListM temp,p=(*M)->next;
	while(p)
	{
		temp=p;
		p=p->next; 
		free(temp);
	}
	(*M)->next=NULL; 
}
void Free_LS(LinkListLS *LS)//êí·?oó?ú??ó?μ?á′±í 
{
	LinkListLS temp,p=(*LS)->next;
	while(p)
	{
		temp=p;
		p=p->next; 
		free(temp);
	}
	(*LS)->next=NULL; 
}
void Free_LF(LinkListLF *LF)//êí·?oó?ú??ó?μ?á′±í 
{
	LinkListLF temp,p=(*LF)->next;
	while(p)
	{
		temp=p;
		p=p->next; 
		free(temp);
	}
	(*LF)->next=NULL; 
}
void Free_F(LinkListF *F)//êí·?oó?ú??ó?μ?á′±í 
{
	LinkListF temp,p=(*F)->next;
	while(p)
	{
		temp=p;
		p=p->next; 
		free(temp);
	}
	(*F)->next=NULL; 
}
void Third_Step(int (*val)[3],int *length)//获取n个三位数 
{
       int i,j;
       FILE *fp;
       int input;
       printf("Keep documents need to be calculated in the Current Folder !\nMake sure filename is \"array\",and format is \".txt\"\n");
       printf("Please enter the number of the array to be calculated.\n(Recommended  more than 43)\nhuw many?:");
       scanf("%d",&input);
       if((fp=fopen(".\\array.txt","r"))==NULL)
       {
             printf("File open failed !\n");
             return;
       }
       for(i=0;i<input;i++)//读取
           for(j=0;j<3;j++)
              fscanf(fp,"%d",&val[i][j]);
       for(i=0;i<input;i++)//显示
        {
               for(j=0;j<3;j++)
                    printf("%d ",val[i][j]);
               printf("\n");
 
        }
       printf("\n");
       fclose(fp);
       *length=input;
}
void Forth_Step_LF(LinkListN N,LinkListLF *L,int (*val)[3],int length)
{
	LinkListN n1,n2,n3;
	LinkListLF p,temp;
	n1=N->next;
	n2=N->next;
	n3=N->next;
	p=(*L);
	int i,j,k;
	int flag0,flag1,flag2,flag;
	double num=0,n=10;
	while(n1)
	{
		n2=N->next;
		num=num+0.21645;
		if((int)(num-n)==0)
		{
			n+=10;
			printf("Calculating of LF,Waiting.....%.0lf%%\n",num+1);
		}
		if(num>90.46&&num<90.5)
		{
				printf("Calculating of LF,Waiting.....100%%\n");
		}
		
		while(n2)
		{
			n3=N->next;
			while(n3)
			{
				flag=0;
				for(i=0;i<length;i++)
				{
					flag0=0,flag1=0,flag2=0;
				//	for(j=0;j<5;j++)
				//	{
						if(val[i][0]==n1->data[0]||\
						   val[i][0]==n1->data[1]||\
						   val[i][0]==n1->data[2]||\
						   val[i][0]==n1->data[3]||\
						   val[i][0]==n1->data[4])
						{
							flag0++;
						}
						if(val[i][1]==n2->data[0]||\
					       val[i][1]==n2->data[1]||\
						   val[i][1]==n2->data[2]||\
						   val[i][1]==n2->data[3]||\
						   val[i][1]==n2->data[4])
						{
							flag1++;
						}
						if(val[i][2]==n3->data[0]||\
						   val[i][2]==n3->data[1]||\
						   val[i][2]==n3->data[2]||\
						   val[i][2]==n3->data[3]||\
						   val[i][2]==n3->data[4])
						{
							flag2++;
						}
						
						
						
				//	}
					if((flag0==0&&flag1==0&&flag2==0)||(flag0==1&&flag1==1&&flag2==1))
					{
					//	do nothing 
					}
				//	if((flag0!=0&&flag1!=0)||(flag0!=0&&flag2!=0)||(flag1!=0&&flag2!=0))
					else
					{
						flag++;					
					}
				}
				if(flag==length)
				{
						temp=(LinkListLF)malloc(sizeof(struct nodeLF));
						if(!temp)
						{
							printf("malloc temp ERROR,and located Forth_Step_LF()");
							return ;
						}
					//	for(k=0;k<5;k++)
					//	{
						for(k=0;k<5;k++)
						{
							temp->data[k]=n1->data[k];
							temp->data[k+5]=n2->data[k];
							temp->data[k+10]=n3->data[k];
						}
						
					//	}
						p->next=temp;
						p=temp;
				}
				n3=n3->next;
			}
			n2=n2->next;
		}
		n1=n1->next;
	} 
	p->next=NULL;
}

void Forth_Step_LS(LinkListM M,LinkListLS *L,int (*val)[3],int length)
{
	LinkListM n1,n2,n3;
	LinkListLS p,temp;
	n1=M->next;
	n2=M->next;
	n3=M->next;
	p=(*L);
	int i,j,k;
	int flag0,flag1,flag2,flag;
	double num=0,n=10;
	while(n1)
	{
		n2=M->next;
		num=num+0.21645;
		if((int)(num-n)==0)
		{
			n+=10;
			printf("Calculating of LS,Waiting.....%.0lf%%\n",num+1);
		}
		if(num>90.46&&num<90.5)
		{
				printf("Calculating of LS,Waiting.....100%%\n");
		}
		
		while(n2)
		{
			n3=M->next;
			while(n3)
			{
				flag=0;
				for(i=0;i<length;i++)
				{
					flag0=0,flag1=0,flag2=0;
					for(j=0;j<6;j++)
					{
						if(val[i][0]==n1->data[j])
						{
							flag0++;
						}
						if(val[i][1]==n2->data[j])
						{
							flag1++;
						}
						if(val[i][2]==n3->data[j])
						{
							flag2++;
						}
						
						
						
					}
						if((flag0==0&&flag1==0&&flag2==0)||(flag0==1&&flag1==1&&flag2==1))
						{
							//	do nothing 
						}
						//	if((flag0!=0&&flag1!=0)||(flag0!=0&&flag2!=0)||(flag1!=0&&flag2!=0))
						else
						{
							flag++;					
						}
					}
					if(flag==length)
					{
						temp=(LinkListLS)malloc(sizeof(struct nodeLS));
						if(!temp)
						{
							printf("malloc temp ERROR,and located Forth_Step_LS()");
							return ;
						}
						for(k=0;k<6;k++)
						{
							temp->data[k]=n1->data[k];
							temp->data[k+6]=n2->data[k];
							temp->data[k+12]=n3->data[k];
						}
						p->next=temp;
						p=temp;
					}
					n3=n3->next;
				}
				n2=n2->next;
			}
			n1=n1->next;
		}
	
	p->next=NULL;
}

void Fifth_Step(LinkListLF L1,LinkListLS L2,LinkListF *F)
{
	LinkListLF l1=L1->next;
	LinkListLS l2;
	LinkListF p=(*F),temp;
	int i,j,k,flag0;
/*	if(p->next!=NULL)
	{
		while(p->next)
		{
			p=p->next;
		}
	}*/
	while(l1)
	{
		
		l2=L2->next;
		while(l2)
		{
			if(l2->data[0]>l1->data[0])
			{
				flag0=0;
				for(i=0;i<6;i++)
				{
					for(j=0;j<5;j++)
					{
						if(l2->data[i]==l1->data[j]||\
						l2->data[i+6]==l1->data[j+5]||\
						l2->data[i+12]==l1->data[j+10])
						{
							flag0++;
						}
					}
				}
				if(flag0==0)
				{
					temp=(LinkListF)malloc(sizeof(struct nodeF));
						if(!temp)
						{
							printf("malloc temp ERROR,and located fifth_Step()");
							return ;
						}
						for(k=0;k<15;k++)
						{
							temp->data0[k]=l1->data[k];														
						}
						for(k=0;k<18;k++)
						{
							temp->data1[k]=l2->data[k];
						} 					
						p->next=temp;
						p=temp;
				}
			}
			l2=l2->next;
		}
		l1=l1->next;
	}
	p->next=NULL;
}

int main()
{
	int a[55][2],val[100][3],length,linklength,flag=0;
	LinkListN N;
	LinkListM M;
	LinkListLF LF;
	LinkListLS LS;
	LinkListF F;
	First_Step(a);
//	Print_First_Step(a);
	while(flag==0)
	{
		char c;
		if(LinkListN_Init(&N))
	 		printf("Succeed Init N.\n");
		if(LinkListM_Init(&M))
	 		printf("Succeed Init M.\n");
		if(LinkListLF_Init(&LF))
	 		printf("Succeed Init N.\n");
		if(LinkListLS_Init(&LS))
	 		printf("Succeed Init M.\n");
		if(LinkListF_Init(&F))
	 		printf("Succeed Init F.\n");
		Second_Step_N(a,&N);//确定可行的序列0，1，2，3，4 
		Traversal_N(N);
		printf("the length of N=%d\n",LinkListN_Length(N));
	
		Second_Step_M(a,&M);//确定可行的序列0，1，2，3，4 ,5
		Traversal_M(M);
		printf("the length of M=%d\n",LinkListM_Length(M));
	
		Third_Step(val,&length);
	
		Forth_Step_LF(N,&LF,val,length);
		printf("the length of LF=%d\n",LinkListLF_Length(LF));
		Free_N(&N);
		Traversal_LF(LF);
	
		Forth_Step_LS(M,&LS,val,length);
		printf("the length of LS=%d\n",LinkListLS_Length(LS));
		Free_M(&M);
		Traversal_LS(LS);
		
   		Fifth_Step(LF,LS,&F);
   		linklength=LinkListF_Length(F);
   		printf("the length of F=%d\n",linklength);
    
		Free_LF(&LF);
		Free_LS(&LS);
	
    	
    	if(linklength==0) 
		{
			printf("According to calculations, Does not meet the array.\n\n");
			printf("Do you want to continue?Yes,press any key.  NO,press N \n");
			c=getch();
		}
		else
		{
			Traversal_F(F);
			printf("_____________________________________________\n");
			printf("Result has stored in Current Folder and named \"Result.txt\"\nNow,you can close program!Thank you for this use.\n");
			printf("---------------------------------------------\n\n");
			printf("Do you want to continue?Yes,press any key.  NO,press N \n");
			c=getch();
		}
		Free_F(&F);
		if(c=='n'||c=='N')
			flag++;
	}
	system("pause");
	return 0;
}
