#include <string.h>
#include "dsq_list_gen.h"

//O(1)
void init(sqlist* sl, int size)
{
	sl->datasize=size;
	sl->len=0;
	sl->maxsize=100;
	sl->data=malloc(size*sl->maxsize); 
}

//O(1)
void clear(sqlist* sl)
{
	free(sl->data);
	sl->datasize=0;
	sl->maxsize=0;
	sl->len=0;
}

//O(1)
int getValue(const sqlist* sl, int pos,
             void* value)
{
	if(pos<0||pos>=sl->len)
		return -1;
	else
		{
			memcpy(value, sl->data+pos*sl->datasize, sl->datasize);
			return 0;
		}
}

//O(n)
int insert(sqlist* sl, int pos,
           void* value)
{
	int i;
	if(pos<0||pos>sl->len)
		return -1;
	if(sl->len==sl->maxsize){
		void* tmp=malloc(sl->datasize
			*sl->maxsize*2);
		memcpy(tmp,sl->data,sl->datasize*(pos-1));
		memcpy(tmp+pos*sl->datasize,value,sl->datasize);
		memcpy(tmp+(pos+1)*sl->datasize,
			sl->data+(pos+1)*sl->datasize,
			sl->datasize*(sl->len-pos));
		free(sl->data);
		sl->data=tmp;
		sl->maxsize*=2;
	}
	memmove(sl->data+(pos+1)*sl->datasize,
			sl->data+pos*sl->datasize,
	        (sl->len-pos)*sl->datasize);
	memcpy(sl->data+pos*sl->datasize,value,sl->datasize); 
	sl->len++;
	return 0;
}

//O(n)
int erase(sqlist* sl, int pos)
{
	if(pos<0||pos>=sl->len)
		return -1;
	memmove(sl->data+pos*sl->datasize,
			sl->data+(pos+1)*sl->datasize,
	        (sl->len-pos)*sl->datasize);
	sl->len--;
	return 0;
}

int find(const sqlist* sl, void* value)
{
	int i;
	for(i=0;i<sl->len;++i){
		if(memcmp(sl->data+i*sl->datasize,value,sl->datasize)==0)
			return i;
	}
	return -1;
}

int find_n_if(const sqlist* sl, int con(const void*))
{
	int cnt=0,i;
	for(i=0; i<sl->len; ++i){
		if(con(sl->data+i*sl->datasize))
			cnt++;
	}
	return cnt;
}

int find_n(const sqlist* sl, void* value)
{
	int cnt=0,i;
	for(i=0; i<sl->len; ++i){
		if(memcmp(sl->data+i*sl->datasize,value,sl->datasize)==0)
			cnt++;
	}
	return cnt;
}

//O(1)
void push_back(sqlist* sl, void* value)
{
	if(sl->len==sl->maxsize){
		void* tmp=malloc(sl->datasize*sl->maxsize*2);
		memcpy(tmp,sl->data,sl->datasize*sl->maxsize);
		memcpy(tmp+sl->datasize*sl->maxsize,value,sl->datasize);
		free(sl->data);
		sl->data=tmp;
		sl->maxsize*=2;
	}
	else
		memcpy(sl->data+sl->len*sl->datasize,value,sl->datasize);
	sl->len++;
}

int pop_back(sqlist* sl)
{
	if(sl->len==0)
		return -1;
	else{
		sl->len--;
		return 0;
	}
}




