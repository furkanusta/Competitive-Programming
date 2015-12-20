/*
Write an algorithm to find the'next'node (i.e., in-order successor) of a given node
in a binary search tree. You may assume that each node has a link to its parent
*/
#include <iostream>
using namespace std;

struct Node {
    int val;
    Node *left, *right, *parent;
};


// BST Construction method from Q4.3 (altered for parent node)
Node* bst(int arr[], int start, int end) {
    if (start > end)
        return NULL;
    int mid = (start + end) / 2;
    Node *t = new Node;
    t->val = arr[mid];
    t->left = bst(arr, start, mid - 1);
    if (t->left)
        t->left->parent = t;
    t->right = bst(arr, mid + 1, end);
    if (t->right)
        t->right->parent = t;
    return t;
}

Node* succ(Node *p) {
    if (p == NULL)
        return p;
    while(p->left)
        p = p->left;
    return p;
}

Node* next(Node *p) {
    if (p == NULL) {
        return p;
    }
    if (p->right != NULL)
        return succ(p->right);
    else {
        // Go up as long as node is the right child
        while(p && p->parent->right == p) {
            p = p->parent;
        }
        return p;
    }
}

int main() {

    int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
    Node *h = bst(arr, 0, 12);
    Node *p = next(h);
    cout << h->val << " " << p->val << endl;
    p = next(h->left);
    cout << h->left->val << " " << p->val << endl;
    p = next(h->right);
    cout << h->right->val << " " << p->val << endl;
}
