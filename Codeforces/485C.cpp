/***
URL: http://codeforces.com/contest/485/problem/C

Tag: implementation, bits
Difficulty: Easy
Complexity: O(log(N))

Description: http://codeforces.com/blog/entry/14592
***/

#include <cstdio>

int N;
bool flag;
long long int a, b, x, p = 1;
long long int MAX = 1000000000000000000;
long long int arr[60][60];
int main()
{
    scanf("%d", &N);
    
    for (int i = 0; i < N; i++)
    {
        scanf ("%I64d %I64d", &a, &b);
        x = a;
        
        for (long long int i = 1; i <= MAX; i<<=1)
        {
            if ((x|i) <= b)
                x|= i;
            else
                break;
        }
        printf("%I64d\n",x);
    }
}
