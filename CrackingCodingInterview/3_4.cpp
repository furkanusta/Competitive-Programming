/*
  Tower of Hanoi
  Write a program to move the disks from the first tower to the last using stacks.
*/
#include <vector>
#include <stack>
#include <iostream>
#include <cassert>
using namespace std;

void hanoi(int n, stack<int> &origin, stack<int> &destination, stack<int> &buffer) {
    if (n <= 0)
        return;
    hanoi(n - 1, origin, buffer, destination);
    destination.push(origin.top());
    origin.pop();
    hanoi(n - 1, buffer, destination, origin);
}

int main() {

    stack<int> origin;
    stack<int> destination;
    stack<int> buffer;
    origin.push(1);
    origin.push(2);
    origin.push(3);
    hanoi(3, origin, destination, buffer);

    while(!destination.empty()) {
        cout << destination.top();
        destination.pop();
    }
}
