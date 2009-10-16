#!/usr/bin/tcc -run

#include <stdio.h>

int main(void){
    int bigger,smaller,lefter;

    bigger = 25;
    smaller = 15;

    while( bigger % smaller ){
        bigger = bigger - smaller;
        
        if (bigger < smaller) {    
            bigger ^= smaller;
            smaller ^= bigger;
            bigger ^= smaller;
        }

    }

    printf("the result is %d \n", smaller);
    
    return 0;
}
