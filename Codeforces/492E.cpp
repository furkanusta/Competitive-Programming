/*
URL: http://codeforces.com/contest/492/problem/E

Tags: math
Difficulty: Not easy, requires some thinking
Complexity: O(n)

Description: Since gcd(dx, n) = gcd(dy, n) = 1, all paths will be cycle in n moves.
Just calculate for each cycle that which cell belongs to which cycle then check which cycle gets more.
*/
#include <cstdio>
using namespace std;

int d[1000010];
int c[1000010];
int n, m, dx, dy, x, y, ans, tmp;
int main()
{
	
    scanf("%d %d %d %d", &n, &m, &dx, &dy);
	
	for (int i = 0; i < n; i++)
	{
      d[x] = y;
      x = (x + dx) % n;
      y = (y + dy) % n;
	}
	for (int i = 0; i < m; i++)
	{
		scanf("%d %d", &x, &y);
		tmp = (n + y - d[x]) % n;
		if (++c[tmp] > c[ans])
			ans = tmp;
	}
	printf("0 %d\n", ans);
}
