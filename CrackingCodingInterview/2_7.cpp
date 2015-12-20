/*
 * Check if a linked list is palindrome
 */
#include <iostream>
#include <cassert>
#include <stack>
#include "List.h"
using namespace std;

// O(N) time, O(N) memory
// Uses Slow-Runner/Fast-Runner
bool palindrome(List &a) {

    List::Node *p = a.head;
    List::Node *k = a.head;
    stack<int> s;
    
    while(k && k->next) {
        s.push(p->val);
        p = p->next;
        k = k->next->next;
    }
    if (k) {
        p = p->next;
    }
    while(!s.empty()) {
        int v = s.top();
        s.pop();
        if (p->val != v)
            return false;
        p = p->next;
    }
    return true;
}

int main() {
    List a;
    a.add(0);
    a.add(1);
    a.add(2);
    a.add(2);
    a.add(1);
    a.add(0);
    List b;
    b.add(0);
    b.add(1);
    b.add(2);
    b.add(1);
    b.add(0);

    List c;
    c.add(0);

    List d;
    d.add(0);
    d.add(1);
    d.add(2);
    
    assert(palindrome(a));
    assert(palindrome(b));
    assert(palindrome(c));
    assert(!palindrome(d));
}
