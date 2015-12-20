/*
Given a directed graph, design an algorithm to find out whether there is a route
between two nodes
*/
#include <iostream>
#include <cassert>
#include <vector>
using namespace std;

vector<vector<int>> adj;

bool dfs(int x, int y) {

    if (x == y)
        return true;
    for(const auto &i : adj[x]) {
        if (dfs(i, y))
            return true;
    }
    return false;
}

int main() {

    adj.resize(5);
    adj[0].push_back(1);
    adj[0].push_back(2);
    adj[0].push_back(3);
    adj[1].push_back(4);
    adj[2].push_back(0);
    adj[3].push_back(0);
    adj[3].push_back(2);
    assert(dfs(3, 4) != dfs(1, 2));
}

/*
  - : Represents bidirectional road
  
  0 ->1->4
  |\
  | \
  2<-3
  
*/
