/***
URL: 

Tag: dfs
Difficulty: Easy
Complexity: O(NM) ??

Description: Iterate and find all candidates, then choose between them.
***/

#include <vector>
#include <algorithm>
#include <cstdio>
#define pb(x) push_back(x)
using namespace std;

const int MAXN = 3005;
int n, m, x, y;
int ans;
int arr[MAXN];
vector<int> adj[MAXN];


int main()
{
	scanf ("%d %d", &n ,&m);
	
	for (int i = 0; i < m; i++)
	{
		scanf ("%d %d", &x, &y);
		adj[x].pb(y);
	}
	
	for (int i = 1; i <= n; i++)
	{
		for (int j = 0; j < (int)adj[i].size(); j++)
		{
			for (int k = 0; k < (int)adj[adj[i][j]].size(); k++)
				arr[adj[adj[i][j]][k]]++;
		}
		for (int j=1; j<=n; j++) 
		{
			if (i != j)
				ans += arr[j]*(arr[j]-1)/2;	// C(n,2)
			arr[j] = 0;
		}
	}
	printf ("%d\n", ans);
}
