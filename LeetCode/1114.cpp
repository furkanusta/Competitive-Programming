#include <thread>
#include <mutex>
#include <functional>
using std::function;

class Foo {
private:
    std::condition_variable cv;
    std::mutex m;
    int counter = 0;
public:
    Foo() {

    }

    void first(function<void()> printFirst) {

        // printFirst() outputs "first". Do not change or remove this line.
        printFirst();
        counter = 1;
        cv.notify_all();
    }

    void second(function<void()> printSecond) {
        std::unique_lock lock(m);
        cv.wait(lock, [&]() { return counter == 1; });
        // printSecond() outputs "second". Do not change or remove this line.
        printSecond();
        counter = 2;
        cv.notify_all();
    }

    void third(function<void()> printThird) {
        std::unique_lock lock(m);
        cv.wait(lock, [&]() { return counter == 2; });
        // printThird() outputs "third". Do not change or remove this line.
        printThird();
    }
};
