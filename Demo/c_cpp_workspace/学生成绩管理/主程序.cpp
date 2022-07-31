#include "function.h"
#include "windows.h"
#include "iostream"
#include "string"
#include "fstream"
using namespace std;

int main()
{
	int num=1;
	cout<<"请输入学生总数"<<endl;
	cin>>num;
	studentsys a;
	for(int i=0;i<num;i++)
	{
		a.input(i);
	}

	a.bubble_sort(num);
	Sleep(1000);
	
	a.output(num);
	Sleep(1000);
	a.ave(num);
    Sleep(3000);
}