/*
 * Write code to remove duplicates in a singly linked-list
 * FOLLOW UP
 * Write code without using temporary buffer
 */
#include <iostream>
#include <map>
#include "List.h"

// O(N^2) time, no extra space
void duplicate(List &l) {
    
    for (List::Node *p = l.head; p->next; p = p->next) {
        for (List::Node *k = p; k->next;) {
            if (p->val == k->next->val) {
                List::Node *temp = k->next;
                k->next  = k->next->next;
                l.length--;
                delete temp;
            }
            else {
                k = k->next;
            }
        }
    }
}

// Takes O(N) time, O(N) space
void duplicate2(List &l) {
    std::map<int, bool> m;
    List::Node *p = l.head;
    m[p->val] = 1;
    while(p->next) {
        if (m.find(p->next->val) != m.end()) {
            List::Node *temp = p->next;
            p->next = p->next->next;
            l.length--;
            delete temp;
        }
        else {
            m[p->next->val] = 1;
            p = p->next;
        }
    }
}

int main() {
    List l;
    l.add(3);
    l.add(4);
    l.add(5);
    l.add(3);
    l.add(4);
    l.add(5);
    l.add(5);
    l.add(1);
    l.add(2);
    duplicate(l);
    l.print();
    l.add(3);
    l.add(4);
    l.add(5);
    l.add(3);
    l.add(4);
    l.add(5);
    l.add(5);
    l.add(1);
    l.add(2);
    duplicate2(l);
    l.print();
}
