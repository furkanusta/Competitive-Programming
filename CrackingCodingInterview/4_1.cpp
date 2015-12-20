/*
  Implement a function to check if a binary tree is balanced. For the purposes of
  this question, a balanced tree is defined to be a tree such that the heights of the
  two subtrees of any node never differ by more than one
*/
#include <cstddef>
#include <cstdlib>
#include <algorithm>
using namespace std;

struct Node {
    Node *left, *right;        
};

int height(Node *p) {

    if (p == NULL)
        return -1;
    return max(height(p->left), height(p->right)) + 1;
}

// O(N^2)
bool balanced(Node *h) {

    if (h == NULL)
        return true;
    if (abs(height(h->left) - height(h->right)) > 1) {
        return false;
    }
    return balanced(h->left) && balanced(h->right);
}


// Another implementation
// which checks in O(N) time
int checkHeight(Node *root) {
    if (root == NULL) {
        return 0; 
    }

    int l = checkHeight(root->left);
    if (l == -1)
        return -1;

    int r = checkHeight(root->right);
    if (r == -1 || abs(l= - r) > 1)
        return -1;
    else
        return max(l , r) + 1;
}

bool isBalanced(Node *root) {
    return checkHeight(root) != -1;
}

// WRITE TESTS
int main() {

}
