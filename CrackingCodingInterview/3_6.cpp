/*
Write a program to sort a stack in ascending order (with biggest items on top).
You may use at most one additional stack to hold items, but you may not copy
the elements into any other data structure (such as an array). The stack supports
the following operations: push, pop, peek, and isEmpty
*/
#include <stack>
#include <iostream>
using namespace std;

stack<int> sort(stack<int> &s) {
    stack<int> temp;
    int x,  count;
    while(!s.empty()) {
        x = s.top();
        s.pop();
        count = 0;
        while(!temp.empty() && temp.top() > x) {
            s.push(temp.top());
            temp.pop();
            count++;
        }
        temp.push(x);
        while(count) {
            temp.push(s.top());
            s.pop();
            count--;
        }
    }

    return temp;
}

int main() {

    stack<int> s;
    s.push(5);
    s.push(8);
    s.push(3);
    s.push(1);
    s.push(12);
    s.push(10);
    stack<int> t = sort(s);

    while (!t.empty()) {
        cout << t.top() << " ";
        t.pop();
    }
    cout << endl;
}
