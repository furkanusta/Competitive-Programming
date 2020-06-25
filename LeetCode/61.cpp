#include "include/LinkedList.hpp"
#include <iostream>

class Solution {
public:

    ListNode* rotateRight(ListNode* head, int k) {
        if (!head || !head->next || !k)
            return head;
        auto first = head;
        auto second = head;
        for (int i = 0; i < k; i++) {
            second = second->next;
            if (!second) {
                second = head;
                k = k % (i + 1) + (i + 1);
            }
        }
        if (second == head)
            return head;
        while (second->next) {
            first = first->next;
            second = second->next;
        }
        auto retval = first->next;
        first->next = nullptr;
        second->next = head;
        return retval;
    }
};

int main() {
    int N = 5;
    LinkedList ll({1, 2, 3});
    ll.dump();
    Solution s;
    auto head = s.rotateRight(ll.head, 6);
    LinkedList::dump(head);
}
