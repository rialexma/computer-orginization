#include <stdio.h>

int main(){
    char first [20], last [20];
    printf("Please enter your name:\n ");
    scanf("%s %s", first, last);
    
    printf("Welcome to CSE 31, %s %s \n", first, last);

    return 0;
}
