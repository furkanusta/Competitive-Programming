/*
URL: http://codeforces.com/contest/492/problem/C

Tagsy: Greedy, Sortings
Difficulty: Easy
Complexity: O(Nlog(N))

Description: Sort the array pick the smallest one until reaching the average
*/

#include <cstdio>
#include <vector>
#include <algorithm>
using namespace std;

struct note{
	
	long long int x,y;
	note(long long int a,long long  int b)
	{
		x = a;
		y = b;
	}
};

long long int n, r, avg, total;
long long int x, y, curr, ans;
vector<note> vec; 

bool operator<(const note &a, const note &b)
{
	return a.y < b.y;
}

int main()
{
	scanf("%I64d %I64d %I64d", &n, &r, &avg);
	avg*=n;
	
	for (int i = 0; i < n; i++)
	{
		scanf ("%I64d %I64d", &x, &y);
		total += x;
		vec.push_back(note(x,y));
	}
	if (total >= avg)
	{
		printf("0\n");
		return 0;
	}
	
	sort(vec.begin(),vec.end());
	
	while(total < avg)
	{
		if ( (avg - total) < (r - vec[curr].x))
		{
			ans += (avg - total) * vec[curr].y;
			total = avg;
		}
		else
		{
			ans += (r - vec[curr].x) * vec[curr].y;
			total += r - vec[curr].x;
		}
		curr++;
	}	
	printf("%I64d\n",ans);
}
