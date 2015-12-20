/*
 * Write a partition method takes a Linked List and a value x, then
 * rearranges the linked list in a way that values less than x comes first
 * and values greater or equal to x comes after that
 *
 * At first, it seems that after the partition Linked list needs to look like
  <x | x | >=x
  However, it only needs to do <x | >=x . Thus, std::partition can be used.
 */
#include <iostream>
#include <vector>
#include <algorithm>
#include <cstdlib>
#include <ctime>
#include "List.h"
using namespace std;

void partition(List &a, int x) {
    vector<int> v;
    List::Node *p = a.head;

    while(p) {
        v.push_back(p->val);
        p = p->next;
    }
    partition(v.begin(), v.end(), [&x] (int i) {return i < x;});
    p = a.head;
    int i = 0;
    while(p) {
        p->val = v[i];
        p = p->next;
        i++;
    }
}

void partition2(List &a, int x) {
    List::Node *p = a.head;
    List small;
    List big;
    while(p) {
        if (p->val < x)
            small.add(p->val);
        else
            big.add(p->val);
        p = p->next;
    }
    p = a.head;
    List::Node *s = small.head;
    List::Node *b = big.head;
    // small.print();
    // big.print();
    while(s) {
        p->val = s->val;
        s = s->next;
        p = p->next;
    }
    while(b) {
        p->val = b->val;
        b = b->next;
        p = p->next;
    }
}

int main() {
    srand(time(NULL));
    List a;
    for (int i = 0; i < 20; i++) {
        a.add(rand() % 100);
    }
    cout << a.head->val << endl;
    // a.print();
    List b(a);
    partition(a, 50);
    partition2(b, 50);
    a.print();
    b.print();
}
