/*
Given a binary tree, design an algorithm which creates a linked list of all the
nodes at each depth (e.g., if you have a tree with depth D, you'll have D linked
lists)
*/
#include <cstddef>
#include <vector>
#include <cassert>
#include <iostream>
using namespace std;

struct Node{
    Node *left, *right;
    int val;

};

void build(Node *h, vector<vector<int>> &v, size_t depth) {

    if (h == NULL)
        return;
    if (v.size() <= depth) {
        v.resize(depth + 1);
    }
    v[depth].push_back(h->val);
    build(h->left, v, depth + 1);
    build(h->right, v, depth + 1);
}

void create(Node *h, vector<vector<int>> &v) {
    build(h, v, 0);
}

// BST build method from Q4.3
Node* bst(int arr[], int start, int end) {
    if (start > end)
        return NULL;
    int mid = (start + end) / 2;
    Node *t = new Node;
    t->val = arr[mid];
    t->left = bst(arr, start, mid - 1);
    t->right = bst(arr, mid + 1, end);
    return t;
}

int main() {
// For easiness I will use vector and push_back instead of implementing a linked list
    vector<vector<int>> v;
    int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    Node *h = bst(arr, 0, 9);
    create(h, v);

    for (const auto &i : v) {
        for (const auto &j : i) {
            cout << j << " ";
        }
        cout << endl;
    }
}

