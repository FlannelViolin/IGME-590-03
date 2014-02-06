//
//  main.c
//  BMICalc
//
//  Created by Student on 2/6/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#include <stdio.h>

typedef struct{
    float height;
    int weight;
}Person;

float bodyMassIndex(Person p){
    
    return p.weight / (p.height * p.height);
}

int main(int argc, const char * argv[])
{
    Person person;
    person.weight = 96;
    person.height = 1.8;
    
    printf("person weighs %i kilograms\n",person.weight);
     printf("person is %.2f meters tall\n",person.height);
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}

