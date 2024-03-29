/***
URL: http://codeforces.com/contest/490/problem/F

Tag: dfs, dp
Difficulty: <Medium
Complexity: O(Nlog(N))

Description: It is like increasing subsequence with edges,
traverse and keep it in dynamic array.
***/

#include <cstdio>
#include <algorithm>
#include <vector>

using namespace std;

vector<int>edge[6005];
int x, y, ans, n;
int population[6005], dn[6005];

void dfs(int now, int pre)
{
    int k = lower_bound(dn, dn+n, population[now]) - dn;
    ans = max(ans, k);
    int t = dn[k];
    dn[k] = population[now];
    for(int i = 0; i < (int)edge[now].size(); i++)
        if(edge[now][i] != pre)
            dfs(edge[now][i], now);
    dn[k] = t;
}

int main()
{
    scanf ("%d" ,&n);
    for(int i = 1; i <= n; i++)
		scanf("%d", &population[i]);
    for(int i = 1; i < n; i++)
    {
        scanf("%d %d", &x, &y);
        edge[x].push_back(y);
        edge[y].push_back(x);
    }
    for(int i =0; i <= n; i++)
		dn[i] = 2147483647;
    for(int i = 1; i <= n; i++)
        dfs(i, 0);
    printf("%d\n", ans+1);
}
