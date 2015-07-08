/***
    URL: http://codeforces.com/contest/490/problem/C

    Tags: implementation, brute-force
    Difficulty: Easy
    Complexity: O(N)

    Description: Just brute force
***/

#include <stdio.h>
#include <string.h>

using namespace std;

char str[1000006];
int a, b, modA[1000006], modB[1000006], len;
bool mark[1000006];

int main()
{
    scanf ("%s",str);
    scanf ("%d %d", &a, &b);
    len = strlen(str);    
    modB[len] = 0;
    for (int i = 1; i < len; i++)
	modA[i] = (modA[i - 1] * 10 + (str[i] -'0')) % a;
    for (int i = len - 1, L = 1 % b; i > 0; i--, L = (L * 10) % b)
	modB[i] = (L * (str[i] -'0') + modB[i + 1]) % b;		

    for (int i = 0; i < len - 1; i++) 
        if (modA[i] == 0 && modB[i + 1] == 0 && str[i + 1] != '0')
        {
            printf("YES\n");
            for (int j = 0; j <= i; j++)
            {		
                printf("%c",str[j]);
            }
            printf("\n");
            for (int j = i + 1; j < len; j++)
                printf("%c",str[j]);
            printf("\n");
            return 0;
        }
    printf("NO\n");
}










