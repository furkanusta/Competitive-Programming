/*
URL: http://codeforces.com/contest/492/problem/D

Tags: Math
Difficulty: Easy
Complexity: O(X+Y)

Desctiption: Calculate for both of them when they will hit and add it to a vector.
***/

#include <cstdio>
#include <vector>
using namespace std;
vector<char*>ans;
int n;
long long int x, y, hp;

void init()
{
	long long int tx = 0, ty = 0;
	
	while(tx < x || ty < y)
	{
		if ((tx + 1) * y > (ty + 1) * x)
		{
			ans.push_back("Vova");
			ty++;
		} else if ((tx + 1) * y < (ty + 1) * x)
		{
			ans.push_back("Vanya");
			tx++;
		} else
		{
			ans.push_back("Both");
			ans.push_back("Both");
			tx++;
			ty++;
		}
	}
}

int main()
{
	scanf ("%d %I64d %I64d", &n, &x, &y);
	
	init();
	for (int i = 0; i < n; i++)
	{
		scanf ("%I64d",&hp);hp--;
		printf ("%s\n",ans[hp%(x+y)]);
	}
}
