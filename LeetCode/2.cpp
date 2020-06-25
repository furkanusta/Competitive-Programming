#include "include/LinkedList.hpp"

class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode* head = new ListNode(0);
        ListNode* out = head;
        int carry = 0;
        while (l1 || l2) {
            int first = l1 ? l1->val : 0;
            int second = l2 ? l2->val : 0;
            int val = first + second + carry;
            out->next = new ListNode(val % 10);
            out = out->next;
            carry = val / 10;
            l1 = l1 ? l1->next : l1;
            l2 = l2 ? l2->next : l2;
        }
        if (carry) {
            out->next = new ListNode(carry);
        }
        return head->next;
    }
};

int main() {
    int N = 5;
    LinkedList ll1;
    LinkedList ll2;
    ll1.fill_random(N);
    ll2.fill_random(N);
    Solution s;
    auto head = s.addTwoNumbers(ll1.head, ll2.head);
    LinkedList::dump(head);
}
