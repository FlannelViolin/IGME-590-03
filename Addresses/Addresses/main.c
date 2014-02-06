//
//  main.c
//  Addresses
//
//  Created by Student on 2/6/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{

    // insert code here...
    int i = 17;
    int *addressOfI = &i;
    printf("i stores its value at %p\n",addressOfI);
    printf("this function starts at %p\n",main);
    printf("The int stored at addressofI is %d\n",*addressOfI);
    *addressOfI = 89;
    printf("Now i is:%db\n",*addressOfI);
    
    printf("An int is %zu bytes \n", sizeof(int));
    printf("An int pointer is %zu bytes \n", sizeof(int *));
    
    printf("A float is %zu bytes \n", sizeof(float));
    printf("A double is %zu bytes \n", sizeof(double));
    
    ///added from sg
    int age =20;
    printf("age before shenanigans:%i,   ",age);
    int *agePtr;
    agePtr = &age;
    *agePtr = 100;
    printf("age after shenanigans:%i\n ",age);
    ///
    
    
    return 0;
}

