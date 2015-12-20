/*
 * Implement an algortihm to find kth to last element in a singly linked list
 */

#include "List.h"
#include <cassert>

// Although length of the List is known (since it is public), I will assume it is not known
// Otherwise questions become trivial.
// O(N) time
int find_kth(List &l, int index) {
    List::Node *p = l.head;
    List::Node *k = l.head;

    for (int i = 0; i < index; i++)
        k = k->next;
    while(k->next) {
        k = k->next;
        p = p->next;
    }
    return p->val;
}

int main() {

    List l;

    for (int i = 0; i < 10; i++)
        l.add(i);
    assert(find_kth(l, 0) == 9);
    assert(find_kth(l, 1) == 8);
    assert(find_kth(l, 9) == 0);
}
