/*************************
	由动态数组构成的
	通用数据类型的
	顺序表的结构和操作 
**************************/
#ifndef DSQ_STACK_GEN_H__
#define DSQ_STACK_GEN_H__

#include<stdlib.h>

typedef struct{
	void* data; //指向数据域的首指针 
	int datasize; //每个数据元素的大小 
	int maxsize; //当前最大长度 
	int len; //实际长度 
}Stack;

/*
   初始化，指定实际长度为0，最大长度为100 
   参数：
   	sqlist* sl  待初始化的顺序表指针
   返回值：
   	无	 
*/
void init(sqlist* sl, int size);

/*
   清空 
   参数：
   	sqlist* sl  待清空的顺序表指针
   返回值：
   	无	 
*/
void clear(sqlist* sl); 

/*
   返回指定位置的元素 
   参数：
   	const sqlist* sl 待操作的顺序表指针
	int pos  指定的位置，下标从0开始
	void* value  找到的元素值对应的指针 
   返回值：
   	0表示找到
	-1表示无效位置 
*/
int getValue(const sqlist* sl, int pos, 
	void* value);

/*
   在指定位置插入一个元素
   参数：
    sqlist* sl 待操作的顺序表指针
    int pos  待插入数据的位置，下标从0开始
	void* value  待插入数据的指针 
   返回值：
    0表示插入成功
	-1表示插入失败 
*/
int insert(sqlist* sl, int pos, 
	void* value);

/*
   在指定位置删除一个元素 
   参数：
    sqlist* sl 待操作的顺序表指针
    int pos  待删除数据的位置，下标从0开始
   返回值：
    0表示删除成功
	-1表示删除失败 
*/
int erase(sqlist* sl, int pos);

/*
   查找第一个满足条件的元素的位置 
   参数：
    const sqlist* sl 待操作的顺序表指针
    void* value  待查找的元素的指针 
   返回值：
    0或正整数表示找到了，返回对应的下标
	-1表示没有找到 
*/
int find(const sqlist* sl, void* value);

/*
   查找满足值指定条件的个数 
   参数：
    const sqlist* sl 待操作的顺序表指针
    int con(const void*)  需满足条件的函数指针 
   返回值：
    找到元素的个数 
*/
int find_n_if(const sqlist* sl, int con(const void*));

/*
   查找等于指定元素值的个数 
   参数：
    sqlist* sl 待操作的顺序表指针
    void* value  待查找的元素的值 
   返回值：
    找到元素的个数 
*/
int find_n(const sqlist* sl, void* value); 

/*
   尾部插入 
   参数：
    sqlist* sl 待操作的顺序表指针
    void* value  要插入的元素的指针 
   返回值：
    0代表成功
	-1代表失败 
*/
void push_back(sqlist* sl, void* value);

/*
   尾部删除 
   参数：
    sqlist* sl 待操作的顺序表指针
   返回值：
    0代表成功
	-1代表失败 
*/
int pop_back(sqlist* sl);

#endif
