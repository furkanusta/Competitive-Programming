/****
URL: http://codeforces.com/problemset/problem/490/E

Tag: implementation, strings
Diffuclty: Easy
Complexity: O(N)

Desciprtion: Just iterate and brute-force
****/

#include <cstdio>
#include <cstring>

int n, len, s[10], ans[100005], num;
char t[10];

int foo() 
{
	num = 0;
	for (int i = 0; i < len; i++) 
		num = num * 10 + s[i];
	return num;
}

int main() {
	int i, j, k;
	scanf("%d", &n);
	
	for (i = 1; i <= n; i++) 
	{
		scanf("%s", t);
		len = strlen(t);
		for (j = 0; j < len; j++) 
			if (t[j] == '?') s[j] = 9;
			else s[j] = t[j] - '0';

		if (foo() <= ans[i - 1]) 
		{
			printf("NO\n");
			return 0;
		}
		for (j = 0; j < len; j++) 
			if (t[j] == '?') 
				for (k = 8; k >= 0; k--) 
				{
					if (j == 0 && k == 0) 
						break;
					s[j] = k;
					if (foo() <= ans[i - 1]) 
					{
						s[j]++;
						break;
					}
				}
		ans[i] = foo();
	}
	printf("YES\n");
	for (i = 1; i <= n; i++)
		printf("%d\n", ans[i]);
}
