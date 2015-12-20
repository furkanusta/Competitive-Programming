#include "List.h"

// It works as it is now because val is public, otherwise this needs to be a member class
//    or requires getters/setters
// As a side note, this cannot decrease the length in the remove method.
//    That will most probably broke the add method in the List header
//    since it is poorly implemented
void remove(List::Node *p) {
    if (p->next == NULL) {
        delete p;
        p = NULL;
        return;
    }
    List::Node *temp = p->next;
    p->val = p->next->val;
    p->next = p->next->next;
    delete temp;
}

int main() {

    List l;
    for(int i = 0; i < 10; i++)
        l.add(i);
    remove(l.head->next);
    l.print();
}
