/*
Implement a data structure SetOf Stacks that mimics this. SetOf Stacks should be
composed of several stacks and should create a new stack once the previous one
exceeds capacity. SetOf Stacks. push() and SetOf Stacks. pop() should behave
identically to a single stack (that is, pop should return the same values as it
would if there were just a single stack).

FOLLOW UP
Implement a function popAt(int index) which performs a pop operation on
a specific sub-stack
 */
#include <stack>
#include <iostream>
#include <vector>
using namespace std;

class SetOfStacks{
public:
    SetOfStacks(size_t c = 50) {
        set.emplace_back(stack<int>());
        last = 0;
        capacity = c;
    }
    void push(int val) {
        if (set[last].size() == capacity) {
            last++;
            set.emplace_back(stack<int>());
        }
        set[last].push(val);
    }
    void pop() {
        if (set[last].empty()) {
            if (last == 0) {
                return;
            }
            last--;
            set.pop_back();
        }
        set[last].pop();
    }
    void popAt(int i) {
        if (i == last) {
            pop();
            return;
        }
        else {
            set[i].pop();
            if (set[i].empty()) {
                for (int j = i ; j < last; j++)
                    set[j] = set[j + 1];
                set.pop_back();
                last--;
            }
        }
    }
    int getL() {return last;}
private:
    vector<stack<int>> set;
    int last;
    size_t capacity;
};

int main() {
    SetOfStacks s(2);
    s.push(1);
    s.push(2);
    s.push(3);
    s.push(4);
    s.push(5);
    s.push(6);
    cout << s.getL() << endl;
    s.push(7);
    cout << s.getL() << endl;
    s.pop();
    cout << s.getL() << endl;
    s.pop();
    cout << s.getL() << endl;
    s.popAt(0);
    s.popAt(0);
    s.popAt(0);
    cout << s.getL() << endl;
    s.popAt(0);
    cout << s.getL() << endl;
}
