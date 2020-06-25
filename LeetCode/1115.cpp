#include <thread>
#include <mutex>
#include <functional>
using std::function;


class FooBar {
private:
    int n;
    std::condition_variable cv;
    std::mutex m;
    bool turn = false;

public:
    FooBar(int n) {
        this->n = n;
    }

    void foo(function<void()> printFoo) {
        std::unique_lock lock(m);
        for (int i = 0; i < n; i++) {
            cv.wait(lock, [&] () {return !turn; });
        	// printFoo() outputs "foo". Do not change or remove this line.
        	printFoo();
            turn = !turn;
            cv.notify_all();
        }
    }

    void bar(function<void()> printBar) {
        std::unique_lock lock(m);
        for (int i = 0; i < n; i++) {
            cv.wait(lock, [&] () {return turn; });
        	// printBar() outputs "bar". Do not change or remove this line.
        	printBar();
            turn = !turn;
            cv.notify_all();
        }
    }
};
