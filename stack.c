#include <stdio.h>
#define MAX_SIZE 100

typedef struct stack{
	int data[MAX_SIZE];
	int top;
}stack;

stack init(){
stack s = { {0,}, -1 };
return s;
}
				

int is_empty(stack* );

void pop(stack* );

int top(stack* );

void push(stack* , int );

int main() {
	return 0;
}
