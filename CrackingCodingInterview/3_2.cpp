/*
 * Add min() function to the stack, guarantee that it works in O(1) time
 */
#include <stack>
using namespace std;

class Stack {
public:
    void push(int val) {
        s.push(val);
        if (val < min_val) {
            min_val = val;
        }
        if (mn.empty() || val <= mn.top()) {
            mn.push(val);
        }
    }
    int top() {
        return s.top();
    }
    void pop() {
        if (!mn.empty() && s.top() == mn.top()) {
            mn.pop();
        }
        if (s.top() == min_val) {
            stack<int> temp;
            s.pop();
            min_val = 0x7ffffff; // INT_MAX could have done in a better way
            while(!s.empty()) {
                temp.push(s.top());
                if(min_val < s.top()) {
                    min_val = s.top();
                }
                s.pop();
            }
            while(!temp.empty()) {
                s.push(temp.top());
                temp.pop();
            }
            return;
        }
        s.pop();
    }
    // Constructs an another stack just to hold minimum values
    // It guarantees O(1) time, but might take up to O(N) memory
    int min() {
        return mn.top();
    }
    // It does not guarantee O(1) time [even so, it is given in the book].
    // It requires traversal when the minimum element is popped which is done in pop
    int min2() {
        return min_val;
    }
private:
    stack<int> s;
    stack<int> mn;
    int min_val;
};

int main() {

    
}
