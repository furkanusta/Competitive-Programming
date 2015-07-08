/****
     URL: http://codeforces.com/contest/490/problem/D

     Tag: math, greedy
     Difficulty: Easy
     Complexity: O(N??)

     Description: make their 2 and 3 multipliers equal
****/

#include <cstdio>
#include <cstdlib>

long long int count2, count3;
long long int a, b, c, d, tmp, ans, tmp2;
int main()
{
    scanf ("%I64d  %I64d", &a, &b);
    scanf ("%I64d  %I64d", &c, &d);  
    
    tmp = a * b;	tmp2 = c * d;	
    while(tmp%2==0){	tmp/=2;	count2++;} //qweqwe
    
    while(tmp%3==0)
    {
        tmp/=3;
        count3++;
    } 
    while(tmp2%2==0)
    {
        tmp2/=2; 
        count2--;
    }
    while(tmp2%3==0)
    {
        tmp2/=3;
        count3--; 
    }
    
    
    //printf ("%I64d %I64d\n",count2, count3);
    //printf ("%lli %lli\n",count2, count3);
            
    if (tmp != tmp2)
    {
        printf("-1\n");
        return 0;
    }
           
    if (count3 > 0)
    {
        ans += count3;
        count2 += count3;
        while(a%3==0 && count3>0){	a=a/3*2;count3--;}
        while(b%3==0 && count3>0){	b=b/3*2;count3--;}
    }
    else
    {
        count3*=-1;
        ans += count3;
        count2 -= count3;
        while(c%3==0 && count3>0){	c=c/3*2;count3--;}
        while(d%3==0 && count3>0){	d=d/3*2;count3--;}
    }
    if (count2 > 0)
    {
        ans += count2;
        while(a%2==0 && count2>0){	a=a/2;count2--;}
        while(b%2==0 && count2>0){	b=b/2;count2--;}
    }
    else
    {
        count2*=-1;
        ans += count2;
        while(c%2==0 && count2>0){	c=c/2;count2--;}
        while(d%2==0 && count2>0){	d=d/2;count2--;}
    }
	
    printf("%I64d\n%I64d %I64d\n%I64d %I64d\n", ans,a,b,c,d);
//printf("%lli\n%lli %lli\n%lli %lli\n",ans,a,b,c,d);
}
