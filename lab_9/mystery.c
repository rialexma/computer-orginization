#include <stdio.h>
int mystery (unsigned int a){
    printf("%d\n", a);

    if(a == 0)
        return a;
    else
        return mystery(a - 1) + mystery(a - 1) + 1;


}
int main(){

    int a = 7;
    mystery(a);
    return 0;
}


