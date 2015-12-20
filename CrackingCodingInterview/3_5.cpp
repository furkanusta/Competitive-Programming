/*
Implement a MyQueue class which implements a queue using two stacks
*/

#include <iostream>
#include <stack>
using namespace std;

class Queue {
public:
    void push(int a) {
        s1.push(a);
    }

    bool empty() {
        return s1.empty();
    }

    int top() {
        while(!s1.empty()) {
            s2.push(s1.top());
            s1.pop();
        }
        int t = s2.top();
        
        while(!s2.empty()) {
            s1.push(s2.top());
            s2.pop();
        }
        
        return t;
    }

    void pop() {
        while(!s1.empty()) {
            s2.push(s1.top());
            s1.pop();
        }

        s2.pop();
        
        while(!s2.empty()) {
            s1.push(s2.top());
            s2.pop();
        }                
    }

private:
    stack<int> s1;
    stack<int> s2;
};

int main () {

    Queue q;
    q.push(0);
    q.push(1);
    q.push(2);
    while (!q.empty()) {
        cout << q.top() << endl;
        q.pop();
    }
}
