/*
You are given a binary tree in which each node contains a value. Design an algo-
rithm to print all paths which sum to a given value. The path does not need to
start or end at the root or a leaf.
*/
#include <algorithm>
#include <iostream>
#include <vector>
#include <cassert>
using namespace std;

struct Node{
    int val;
    Node *left, *right;
};

int depth(Node *p) {
    if (p == nullptr)
        return 0;
    return max(depth(p->left), depth(p->right)) + 1;
}

void find_sum(Node *p, int val, vector<int> &mark, int level) {
    if (p == nullptr)
        return;
    
    mark[level] = p->val;
    int s = 0;
    
    for (int i = level; i >= 0; i--) {
        s += mark[i];
        if (s == val) {
            for (int j = i; j <= level; j++)
                cout << mark[j] << " ";
            cout << endl;
        }
    }

    find_sum(p->left, val, mark, level + 1);
    find_sum(p->right, val, mark, level + 1);
}

void sum(Node *p, int val) {
    vector<int> mark(depth(p));
    find_sum(p, val, mark, 0);
}

// BST-create method from Q4.3
Node* bst(int arr[], int start, int end) {
    if (start > end)
        return nullptr;
    int mid = (start + end) / 2;
    Node *t = new Node;
    t->val = arr[mid];
    t->left = bst(arr, start, mid - 1);
    t->right = bst(arr, mid + 1, end);
    return t;
}

int main() {
    int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    Node *head = bst(arr, 0, 10);

    cout << 10 << endl;
    sum(head, 10);
    cout << endl << 14 << endl;
    sum(head, 14);
    cout << endl << 5 << endl;
    sum(head, 5);
    cout << endl << 1 << endl;
    sum(head, 1);
}
