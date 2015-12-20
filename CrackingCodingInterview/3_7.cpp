/*
An animal shelter holds only dogs and cats, and operates on a strictly "first in,
first out" basis. People must adopt either the "oldest" (based on arrival time) of
all animals at the shelter, or they can select whether they would prefer a dog or
a cat (and will receive the oldest animal of that type). They cannot select which
specific animal they would like. Create the data structures to maintain this system
and implement operations such as enqueue, dequeueAny, dequeueDog and
dequeueCat.You may use the built-in LinkedList data structure.
*/
#include <queue>
#include <iostream>
using namespace std;

class Shelter{

public:
    Shelter() : count(0){}
    void enqueue(bool type) {
        if (type) 
            dog.push(count);
        else
            cat.push(count);
        count++;
    }

    int dequeueDog() {
        int t = dog.front();
        dog.pop();
        return t;
    }

    int dequeueCat() {
        int t = cat.front();
        cat.pop();
        return t;
    }

    int dequeueAny() {
        int x = dog.front(), y = cat.front();
        if (x < y) {
            dog.pop();
        }
        else {
            cat.pop();
            x = y;
        }
        return x;
    }

private:
    queue<int> dog;
    queue<int> cat;
    int count;
};

int main() {

    Shelter s;

    // 0 for cat, 1 for dog
    s.enqueue(0);
    s.enqueue(1);
    s.enqueue(1);
    s.enqueue(1);
    s.enqueue(1);
    s.enqueue(0);
    s.enqueue(0);
    s.enqueue(1);
    s.enqueue(0);

    cout << s.dequeueAny() << endl;
    cout << s.dequeueAny() << endl;
    cout << s.dequeueCat() << endl;
    cout << s.dequeueDog() << endl;
    cout << s.dequeueCat() << endl;
    cout << s.dequeueDog() << endl;
    cout << s.dequeueCat() << endl;
    cout << s.dequeueDog() << endl;
}
