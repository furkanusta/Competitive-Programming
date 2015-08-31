/*
 * Codeforces
 * Title: Worms
 * URL  : http://codeforces.com/problemset/problem/474/B
 */

#include <cstdio>

int N, M, x, sum[100005],ans;
int binary(int min, int max, int seek)
{
    int mid = 0;
    
    while (min <= max)
    {
        mid = (min + max) / 2;

        if (sum[mid] > seek)
            max = mid - 1;
        else
            min = mid + 1;
    }
    mid = (min + max) / 2;
    if (sum[mid] == seek)
        return mid;
    return mid+1 ;
}

int main()
{
    scanf("%d",&N);
    
    scanf("%d",&sum[1]);
    
    for (int i = 2; i <= N; i++)
    {
        scanf("%d", &x);
        sum[i] = sum[i - 1] + x;
    }
    
    scanf("%d",&M);
    
    for (int i = 0; i < M; i++)
    {
        scanf("%d", &x);
        ans = binary(1,N,x);
        printf("%d\n", ans);
    }
}
