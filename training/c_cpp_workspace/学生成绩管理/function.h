#pragma once
#include "windows.h"
#include "iostream"
#include "string"
#include "fstream"
using namespace std;
#define MaxSize 10

struct student
{
	float grades;
};

class studentsys
{
private:
student stu[MaxSize];

public:
	void input(int num);
	void output(int num);
	float ave(int num);
	void bubble_sort(int num);
};
