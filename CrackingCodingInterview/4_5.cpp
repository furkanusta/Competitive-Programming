/*
Implement a function to check if a binary tree is a binary search tree.
*/
#include <cstddef>
#include <cassert>
#include <iostream>
using namespace std;

struct Node{
    Node *left, *right;
    int val;

};

bool check(Node *p, int min, int max) {

    if (p == NULL)
        return true;
    if (p->val < min || p->val > max)
        return false;
    return check(p->left, min, p->val) && check(p->right, p->val, max);
}

bool BST(Node *p) {
    return check(p, 0xffffffff, 0x7fffffff); // INT_MIN, INT_MAX
}

// BST Construction method from Q4.3
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
    int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    Node *h = bst(arr, 0, 9);
    assert(BST(h));
    h->val = 6;
    assert(!BST(h));
}
