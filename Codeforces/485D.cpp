/***
URL: http://codeforces.com/contest/485/problem/D

Tag: Binary Search
Difficulty: Medium
Complexity: O(N*log(N) + M*log(M))

Desctiption: Code is different from the editorial, but it is easier to write
and works faster. Complexity and Tags are written according to the editorial.
***/

#include <cstdio>
#include <algorithm>

int n,mx,s,b[2000005];
int main() 
{
	int i,j,t;
	scanf ("%d", &n);
	for (i = 0; i < n; i++) 
	{
		scanf("%d", &t);
		b[t] = t;
		if (t > mx) mx = t;
	}
	for (i = 1; i < 2 * mx; i++)
		if (!b[i]) b[i] = b[i - 1];
	for (i = mx - 1; i > s; i--)
		if (b[i] == i)
			for (j = 2 * i - 1; j < 2 * mx; j+=i)
				s = std::max(s, b[j] % i);
	printf ("%d\n", s);
}
