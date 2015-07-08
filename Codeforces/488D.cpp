/****
URL: http://codeforces.com/contest/488/problem/D

Tag: dp
Difficulty: Medium
Complexity: O(Nlog(N))

Decription: Let f[i] denote the minimal number of pieces that the 
first i numbers can be split into. g[i] denote the maximal length of substrip 
whose right border is i(included) and it satisfy the condition.
Then f[i] = min(f[k]) + 1, where i - g[i] ≤ k ≤ i - l.
****/

#include <cstdio>
#include <utility>
#include <set>
#include <algorithm>
using namespace std;

set<pair<int,int> > a,b;

int f[100005], g[100005];
int n, s, l, i, x=0;
int main ( ) 
{
	
    scanf("%d %d %d",&n, &s, &l);
    for (i = 1; i <= n; i++) 
		scanf("%d", &g[i]);
    a.clear();
    b.clear();
    f[0] = 0;
    for (i = 1; i <= n; i++) 
    {
        a.insert (make_pair (g[i], i));
        while (a.rbegin()->first - a.begin()->first > s) 
        {
            b.erase (make_pair (f[x], x));
            x++;
            a.erase (make_pair (g[x], x));
        }
        if (i >= l && (int)a.size() >= l) 
        {
            if (f[i - l] >= 0) 
				b.insert (make_pair (f[i - l], i - l));
        }
        if (b.size() == 0) 
			f[i] = -1; 
		else 
			f[i] = b.begin()->first + 1;
    }
	printf("%d\n", f[n]);
    return 0;
}
