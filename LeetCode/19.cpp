#include "include/LinkedList.hpp"

class Solution {
private:
    int getSize(ListNode* head) {
        int i = 0;
        while (head) {
            i++;
            head = head->next;
        }
        return i;
    }

public:
    ListNode* removeNthFromEnd_multiPass(ListNode* head, int n) {
        int size = getSize(head);
        int pos = size - n;
        if (pos == 0)
            return head->next;
        ListNode* temp = head;
        for (int i = 1; i < pos; i++) {
            head = head->next;
        }
        head->next = head->next->next;
        return temp;
    }

    ListNode* removeNthFromEnd_singlePass(ListNode* head, int n) {
        auto temp = head;
        auto orig = head;
        for (int i = 0; i < n; i++) {
            temp = temp->next;
        }
        if (!temp) {
            return head->next;
        }
        while (temp->next) {
            head = head->next;
            temp = temp->next;
        }
        head->next = head->next->next;
        return orig;
    }

    ListNode* removeNthFromEnd(ListNode* head, int n) {
        return removeNthFromEnd_singlePass(head, n);
    }
};

int main() {
    int N = 5;
    LinkedList ll({1, 2, 3, 4, 5});
    ll.dump();
    Solution s;
    auto head = s.removeNthFromEnd(ll.head, 4);
    LinkedList::dump(head);
}
