#include "include/LinkedList.hpp"

class Solution {
public:
    ListNode* swapPairs(ListNode* head) {
        if (!head || !head->next)
            return head;
        auto retval = head->next;
        auto next = retval->next;
        retval->next = head;
        head->next = next;

        auto prev = head;
        head = head->next;
        while (head && head->next) {
            auto next = head->next;
            head->next = next->next;
            next->next = head;
            prev->next = next;
            prev = head;
            head = head->next;
        }
        return retval;
    }

    ListNode* swapPairs_dummy(ListNode* head) {
        ListNode* dummy = new ListNode(0, head);
        auto prev = dummy;
        while (head && head->next) {
            auto temp = head->next;
            prev->next = temp;
            head->next = temp->next;
            temp->next = head;
            prev = head;
            head = head->next;
        }
        head = dummy->next;
        delete dummy;
        return head;
    }
};

int main() {
    int N = 5;
    LinkedList ll({2, 7, 4, 3, 5});
    // ll.fill_random(N);
    ll.dump();
    Solution s;
    auto head = s.swapPairs_dummy(ll.head);
    LinkedList::dump(head);
}
