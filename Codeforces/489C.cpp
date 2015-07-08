/***
URL: http://codeforces.com/contest/489/problem/C

Tag: Greedy
Difficulty: Very-Easy
Complexity: O(N)

Description: Not needed.
****/

#include <cstdio>

int n, s, m, ansMin, ansMax;
int min[105];
int max[105];
int main()
{
	scanf ("%d %d", &n, &m);
	if (n != 1 && m == 0) ansMin = ansMax = -1;
	s = m;
	for (int i = n - 1; i >= 0; i--)
	{
		if (s > 9)
		{
			s-=9;
			min[i] = 9;
		}
		else
		{
			if (!i)	min[i] = s;
			else
			{
				min[i] = s - 1;
				min[0] = 1;
			}
			s = 0;
			break;
		}
	}
	
	if (s > 0)
	{
		ansMin = -1;
	}
	
	for (int i = 0; i < n; i++)
	{
		if (m > 9)
		{
			m-=9;
			max[i] = 9;
		}
		else
		{
			max[i] = m;
			m = 0;
			break;
		}
	}
	
	if (m > 0)
	{
		ansMax = -1;
	}
	
	if (ansMin == -1)
		printf ("-1 ");
	else
	{
		for (int i = 0; i < n; i++)
			printf ("%d", min[i]);
	}
	printf(" ");	
			
	if (ansMax == -1)
		printf ("-1");
	else
	{
		for (int i = 0; i < n; i++)
			printf ("%d", max[i]);
	}
	
}
