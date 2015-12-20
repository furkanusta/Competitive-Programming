/*
Given a sorted (increasing order) array with unique integer elements, write an
algorithm to create a binary search tree with minimal height
*/
#include <cstddef>
#include <iostream>
using namespace std;

struct Node{
    Node *left, *right;
    int val;

};

void traverse(Node *h) {
    if (h == NULL)
        return;
    traverse(h->left);
    cout << h->val << endl;
    traverse(h->right);
}

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
    traverse(h); // In-order traversal goes sorted in BST
}
