/***
URL: http://codeforces.com/contest/486/problem/C

Tag: implementation, greedy
Difficulty: Easy
Complexity: O(N)

Desctiption: Make sure that p is in the first half; find largest index smaller than p,
find smallest index larger than p; then calculate the diff

***/

#include <cstdio>
#include <cstring>
#include <algorithm>
using namespace std;

int n, p, len, d, first=-1, last=-1;
long long int ans;
char str[100005];
int main()
{
	scanf ("%d %d %s", &n, &p, str);
	if(p > n / 2)
		p = n - p + 1;

	for(int l = 0 , r = n - 1; l <= r; l++, r--)
	{
		if(str[l] != str[r])
		{
			last = l + 1;
			if(first == -1)
				first = l + 1;
			
			d = abs (str[r] - str[l]);
			ans += min (d, 26 - d);
		}
	}
	if(first != -1)
		ans += min (abs (p - last), abs (p - first)) + last - first;
	printf ("%I64d\n", ans);
	return 0;
}
