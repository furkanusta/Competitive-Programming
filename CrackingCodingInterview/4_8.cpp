/*
You have two very large binary trees: T1, with millions of nodes, and T2, with
hundreds of nodes. Create an algorithm to decide if T2 is a subtree of T1.
A tree T2 is a subtree of T1 if there exists a node n in T1 such that the subtree of
n is identical to T2. That is, if you cut off the tree at node n, the two trees would
be identical.
*/
#include <cassert>

struct Node {
    int val;
    Node *left, *right;
};

bool match(Node *p, Node *q) {

    if (p == nullptr && q == nullptr)
        return true;
    if (p == nullptr || q == nullptr)
        return false;
    if (p->val != q->val)
        return false;
    return match(p->left, q->left) && match(p->right, q->right);
}

bool sub(Node *p, Node *q) {

    if (p == nullptr)
        return false;
    if (q == nullptr)
        return true;
    if (p->val == q->val) {
        if (match(p, q))
            return true;
    }
    return sub(p->left, q->left) || sub(p->right, q->right);
}

bool contains(Node *p, Node *q) {
    if (q == nullptr) {
        return true;
    }
    return sub(p, q);
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

    assert(contains(head, head));
    assert(contains(head, head->left));
    assert(contains(head, head->right));
    assert(!contains(head->left, head->right));
}
