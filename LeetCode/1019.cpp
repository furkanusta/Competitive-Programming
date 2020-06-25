// O(N) time, O(N) memory
//
// There are solutions that reverse the original array and start building from there (at the end
// reverse back). It gets rid of the need for storing the indices in the stack but modifies the original list.
//
#include <stack>
#include <vector>
#include <utility>

#include <iostream>

#include "include/LinkedList.hpp"

class Solution {
private:
    int getSize(ListNode* head) {
        int size = 0;
        while (head) {
            size++;
            head = head->next;
        }
        return size;
    }
public:
    std::vector<int> nextLargerNodes(ListNode* head) {
        std::vector<int> vec(getSize(head));
        std::stack<std::pair<int,int>> ss;
        for (int i = 0; head; head = head->next, i++) {
            int val = head->val;
            while (!ss.empty() && val > ss.top().first) {
                auto top = ss.top();
                ss.pop();
                vec[top.second] = val;
            }
            ss.push(std::make_pair(val, i));
        }
        auto top = ss.top();
        int val = top.first;
        vec[top.second] = 0;
        ss.pop();
        while (!ss.empty()) {
            auto top = ss.top();
            ss.pop();
            if (top.first >= val)
                val = 0;
            vec[top.second] = val;

        }
        return vec;
    }
};

int main() {
    int N = 5;
    LinkedList ll({2, 7, 4, 3, 5});
    // ll.fill_random(N);
    ll.dump();
    Solution s;
    auto vec = s.nextLargerNodes(ll.head);
    for (auto&& i : vec) {
        std::cout << i << " " ;
    } std::cout << "\n";
}
