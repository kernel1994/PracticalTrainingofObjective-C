//
//  main.m
//  Day1
//
//  Created by kernel1994 on 16/7/3.
//  Copyright (c) 2016年 kernel1994. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * declare function taxCalc, used to calculate tax
 * param: int company is 0 or indidual is 1
 * param: int salary
 * return: float tax
 */
float taxCalc(int, int);

/**
 * calculate salary of staff which after taking out ensurence
 * param: int company is 0 or indidual is 1
 * param: int salary
 * return: float staff's salary after taking out ensurence
 */
float shouldSalaryCalc(int, int);

int main(int argc, const char * argv[])
{

    /* init salary as a negtive number */
    int salary = -1;
    /* surence type, company is 0, individual is 1 */
    int type = 0;
    
    printf("input your salary: ");
    scanf("%d", &salary);
//    printf("company is 0, individual is 1: ");
//    scanf("%d", &type);
    // type always 1 for individual tax calculate
    type = 1;
    
    float tax = taxCalc(type, salary);
    
    printf("your tax is: %.2f\n", tax);
    
    return 0;
}

float taxCalc(int type, int salary)
{
    float tax = -1.0;
    float shouldSalary = shouldSalaryCalc(type, salary);
    
    if (shouldSalary <= 1500)
    {
        tax = shouldSalary * 0.03;
    }
    else if (shouldSalary > 1500 && shouldSalary <= 4500)
    {
        tax = shouldSalary * 0.1 - 105;
    }
    else if (shouldSalary > 4500 && shouldSalary <= 9000)
    {
        tax = shouldSalary * 0.2 - 555;
    }
    else if (shouldSalary > 9000 && shouldSalary <= 35000)
    {
        tax = shouldSalary * 0.25 - 1005;
    }
    else
    {
        tax = shouldSalary * 0.45 - 13505;
    }
        
    return tax;
}

float shouldSalaryCalc(int type, int salary)
{
    float shouldSalary = -1;
    
    float oldEnsurence = 0;
    float healthEnsurence = 0;
    float deployeeEnsurence = 0;	
    float houseFoundation = 0;
    
    return shouldSalary;
}