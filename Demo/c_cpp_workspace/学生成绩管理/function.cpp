#include "function.h"

void studentsys::input(int num)
{
	float grades1;
	cout<<"请输入成绩"<<endl;
	cin>>grades1;
	stu[num].grades=grades1;
}
void studentsys::output(int num)
{
	for(int i=0;i<num;i++)
	{
		cout<<"序号为"<<i+1<<"的成绩为"<<stu[i].grades<<endl;
	}
}
float studentsys::ave(int num)
{
	float sum=0;
		float average;
		for(int i=0;i<num;i++)
		{
			sum=sum+stu[i].grades;
		}
		average=sum/num;
		cout<<"平均成绩为"<<average<<endl;
		return average;
}


void studentsys::bubble_sort(int num)
{
	int haschange;
    float temp;
	for(int i=1;i<num;i++)
	{
		haschange=0;
		for(int j=0;j<num-1;j++)
		{
			if(stu[j].grades>stu[j+1].grades)
			{
				temp=stu[j].grades;
				stu[j+1].grades=stu[j+1].grades;
				stu[j+1].grades=temp;
				haschange=1;
			}
		}
		if(haschange==0) break;
	}
}
