/*************************
	�ɶ�̬���鹹�ɵ�
	ͨ���������͵�
	˳���Ľṹ�Ͳ��� 
**************************/
#ifndef DSQ_STACK_GEN_H__
#define DSQ_STACK_GEN_H__

#include<stdlib.h>

typedef struct{
	void* data; //ָ�����������ָ�� 
	int datasize; //ÿ������Ԫ�صĴ�С 
	int maxsize; //��ǰ��󳤶� 
	int len; //ʵ�ʳ��� 
}Stack;

/*
   ��ʼ����ָ��ʵ�ʳ���Ϊ0����󳤶�Ϊ100 
   ������
   	sqlist* sl  ����ʼ����˳���ָ��
   ����ֵ��
   	��	 
*/
void init(sqlist* sl, int size);

/*
   ��� 
   ������
   	sqlist* sl  ����յ�˳���ָ��
   ����ֵ��
   	��	 
*/
void clear(sqlist* sl); 

/*
   ����ָ��λ�õ�Ԫ�� 
   ������
   	const sqlist* sl ��������˳���ָ��
	int pos  ָ����λ�ã��±��0��ʼ
	void* value  �ҵ���Ԫ��ֵ��Ӧ��ָ�� 
   ����ֵ��
   	0��ʾ�ҵ�
	-1��ʾ��Чλ�� 
*/
int getValue(const sqlist* sl, int pos, 
	void* value);

/*
   ��ָ��λ�ò���һ��Ԫ��
   ������
    sqlist* sl ��������˳���ָ��
    int pos  ���������ݵ�λ�ã��±��0��ʼ
	void* value  ���������ݵ�ָ�� 
   ����ֵ��
    0��ʾ����ɹ�
	-1��ʾ����ʧ�� 
*/
int insert(sqlist* sl, int pos, 
	void* value);

/*
   ��ָ��λ��ɾ��һ��Ԫ�� 
   ������
    sqlist* sl ��������˳���ָ��
    int pos  ��ɾ�����ݵ�λ�ã��±��0��ʼ
   ����ֵ��
    0��ʾɾ���ɹ�
	-1��ʾɾ��ʧ�� 
*/
int erase(sqlist* sl, int pos);

/*
   ���ҵ�һ������������Ԫ�ص�λ�� 
   ������
    const sqlist* sl ��������˳���ָ��
    void* value  �����ҵ�Ԫ�ص�ָ�� 
   ����ֵ��
    0����������ʾ�ҵ��ˣ����ض�Ӧ���±�
	-1��ʾû���ҵ� 
*/
int find(const sqlist* sl, void* value);

/*
   ��������ֵָ�������ĸ��� 
   ������
    const sqlist* sl ��������˳���ָ��
    int con(const void*)  �����������ĺ���ָ�� 
   ����ֵ��
    �ҵ�Ԫ�صĸ��� 
*/
int find_n_if(const sqlist* sl, int con(const void*));

/*
   ���ҵ���ָ��Ԫ��ֵ�ĸ��� 
   ������
    sqlist* sl ��������˳���ָ��
    void* value  �����ҵ�Ԫ�ص�ֵ 
   ����ֵ��
    �ҵ�Ԫ�صĸ��� 
*/
int find_n(const sqlist* sl, void* value); 

/*
   β������ 
   ������
    sqlist* sl ��������˳���ָ��
    void* value  Ҫ�����Ԫ�ص�ָ�� 
   ����ֵ��
    0����ɹ�
	-1����ʧ�� 
*/
void push_back(sqlist* sl, void* value);

/*
   β��ɾ�� 
   ������
    sqlist* sl ��������˳���ָ��
   ����ֵ��
    0����ɹ�
	-1����ʧ�� 
*/
int pop_back(sqlist* sl);

#endif
