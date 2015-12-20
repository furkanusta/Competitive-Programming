/*
Design an algorithm and write code to find the first common ancestor of two
nodes in a binary tree. Avoid storing additional nodes in a data structure. NOTE:
This is not necessarily a binary search tree
*/
#include <iostream>
#include <utility>
#include <cassert>
using namespace std;

struct Node{
    int val;
    Node *left, *right;
};

// BST-create method from Q4.3
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

pair<Node*, bool> find_ancestor(Node *root, Node *p, Node *q) {

    if (root == nullptr) {
        return {root, false};
    }
    if (root == p && root == q) {
        return {root, true};
    }
    auto rl = find_ancestor(root->left, p, q);
    if (rl.second)
        return rl;
    
    auto rr = find_ancestor(root->right, p, q);
    if (rr.second)
        return rr;

    if (rr.first && rl.first)
        return {root, 1};
    else if (root == p || root == q)
        return {root, rr.first || rl.first}; // If p or q is the common ancestor of the other one
    else
        return {rr.first ? rr.first : rl.first, 0};
}

Node* ancestor(Node *root, Node *p, Node *q) {
    auto res = find_ancestor(root, p, q);
    if (res.second)
        return res.first;
    return nullptr;
}

int main() {
    int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};
    Node *head = bst(arr, 0, 11);
    
    assert(ancestor(head, head->left, head->right) == head);
    assert(ancestor(head, head->left, head) == head);
    assert(ancestor(head, head->left, NULL) == nullptr);
    assert(ancestor(head, head->left->right, head->right->left) == head);
}
