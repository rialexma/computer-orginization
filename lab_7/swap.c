#include <stdio.h>

void proc(int *num){
    int *stack = *num;
}

void breakit(){
    int *test1 = (*int) malloc(sizeof(*int));
    int *test2 = (*int) malloc(sizeof(*int));

}

void swap (int *px, int *py) {
    int *temp;
    *temp = *px;
    *px = *py;
    *py = *temp;
}


int main (){
    int a = 2, b = 3;
    printf("%d, %d\n", a, b);
    breakit();
    proc(&a);
    swap(&a, &b);
    printf("%d, %d\n", a, b);


}
