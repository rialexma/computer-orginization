#include <stdio.h>

int main(){
    int x, typo;
    printf("Enter the number of lines for the punishment: ");
    scanf("%d", &x);
    if ( x < 0){
        printf("You entered an incorrect value for the number of lines!");
        return 0;
    }
    printf("Enter the line for which we want to make a typo: ");
    scanf("%d", &typo);
        if (typo < 0){
            printf("you entered the incorrect value for the line typo!");
            return 0;
        }  
    for (int i = 0; i < x; i++){
        if (i == typo - 1){
            printf("C programminng languag is the bet ");
        }
        else{
            printf("C programminng languag is the best ");
        }
    }
    return 0;
}
