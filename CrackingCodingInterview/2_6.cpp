#include <iostream>
#include <map>
using namespace std;

struct Node{
    int val;
    Node *next;
    Node(int v = 0, Node *n = nullptr) {
        val = v;
        next = n;
    }
};
Node *head;

// This is a bit different than the algorithm given in the book
// Algorithm uses Slow-Runner/Fast-Runner approach which is descripbed in the book
// I didn't do any performance tests but mine guarantees to find in O(N+K) where K is the size of the loop
Node* find(Node *p) {
    map<Node*, bool> m;
    while(p) {
        // std::cout << p->val << std::endl;
        if(m.find(p) == m.end()) {
            m[p] = 1;
        }
        else {
            return p;
        }
        p = p->next;
    }
    return nullptr;
}

int main() {
    // A->B->C->D->E->C . Same example from the book
    head = new Node(0);
    head->next = new Node(1);
    head->next->next = new Node(2);
    head->next->next->next = new Node(3);
    head->next->next->next->next = new Node(4, head->next->next);

    std::cout << find(head)->val << std::endl;
    // find(head);
}
