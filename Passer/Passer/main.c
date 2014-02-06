//
//  main.c
//  Passer
//
//  Created by Student on 2/6/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#include <stdio.h>

int doubleIt(int num){
    return num*2;
}

void doubleItBeRef(int *num){
    *num *=2;

}
int main(int argc, const char * argv[])
{
    int x= 5;
    x = doubleIt(x);
    printf("5 doubled is %d\n",x);
    
    int y = 10;
    doubleItBeRef(&y);
    printf("10 doubled is %d\n",y);
    
    return 0;
}

