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

int is_empty(stack* s){
	return s->top < 0;
};

void pop(stack* s) {     
	if (is_empty(s) == 1) { return 0; }
	else (s->top)--;   
}

int top(stack* s){
	if (s->top != -1)
		return s->data[s->top];
	
	return 10;
}

void push(stack* s, int data) {   
	if (s->top > MAX_SIZE) 
		return;
	else s->top++; s->data[s->top] = data;
}

int main() {
	return 0;
}
