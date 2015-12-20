/*
 * You have two numbers represented by a linked list, where each node contains a
 * single digit. The digits are stored in reverse order.Write a function that adds
 *  the two numbers and returns the sum as a linked list
Input: (7-> 1 -> 6) + (5 -> 9 -> 2).That is, 617 + 295.
Output: 2 -> 1 -> 9.That is, 912

 * FOLLOWUP
 * Suppose the digits are stored in forward order. Repeat the above problem.
Input: (6 -> 1 -> 7) + (2 -> 9 -> 5).That is, 617 + 295.
Output: 9 -> 1 -> 2.That is, 912
 */
#include "List.h"
#include <vector>
int add3(List::Node*, List::Node*, List::Node*);

List add(List a, List b) {
// O(N) time

    List::Node *p = a.head;
    List::Node *k = b.head;
    List ret;
    int extra = 0;
    while (p && k) {
        int add = p->val + k->val + extra;
        extra = add / 10;
        ret.add(add % 10);

        p = p->next;
        k = k->next;
    }
    while (p) {
        int add = p->val + extra;
        extra = add / 10;
        ret.add(add % 10);
        p = p->next;
    }
    while (k) {
        int add = k->val + extra;
        extra = add / 10;
        ret.add(add % 10);
        k = k->next;
    }
    if (extra) {
        ret.add(1);
    }
    return ret;
}

// O(N) time, it pads the shorter List, if exists, with 0s. Thus, if we want to
// pass the lists by reference that would be undesirable
List add2(List a, List b) {
    // std::cout << a.length << " " << b.length << std::endl;
    if (a.length < b.length) {

        // This uses the add(val, index); function exists in the header file
        // If it wasn't exist we need to create a new List, pad with 0s, then copy
        // the a to the rest
        for (int i = 0; i < b.length - a.length; i++)
            a.add(0, 0);
    }
    if (b.length < a.length) {
        for (int i = 0; i < a.length - b.length; i++)
            b.add(0, 0);
    }
    List c;
    for (int i = 0; i < a.length; i++)
        c.add(0);
    int e = add3(a.head, b.head, c.head);
    if (e) {
        c.add(1, 0);
    }
    return c;
}

int add3(List::Node *a, List::Node *b, List::Node *c) {
    if (a != nullptr &&  b != nullptr && c != nullptr) {
        int extra = add3(a->next, b->next, c->next);
        int val = a->val + b->val + extra;
        extra = val / 10;
        c->val = val % 10;
        return extra;
    }
    
    return 0;
}

int main() {
    List a;
    List b;
    a.add(7);
    a.add(1);
    a.add(6);
    b.add(5);
    b.add(9);
    b.add(2);
    List res = add2(a, b);
    res.print();
    List c;
    List d;
    c.add(9);
    c.add(1);
    d.add(2);
    List res2 = add2(c, d);
    res2.print();

    List e;
    List f;
    e.add(9);
    f.add(8);
    List g = add2(e, f);
    g.print();
}
