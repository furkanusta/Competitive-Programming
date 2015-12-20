/*
  Helper linked list class for questions in chapter 2
  Everything is written public because I didn't want to write getters/setters etc.
    to access this class.
  Functions asked in the questions are meant to be written in the header file.
*/

#ifndef _LIST_H_
#define _LIST_H_

#include <iostream>
#include <map>

class List{
public:
    struct Node {
        int val;
        Node* next;
        Node(int v = 0, Node* n = nullptr) :val(v), next(n){}
    };
    
    List() {
        head = nullptr;
        length = 0;
    }
    List(const List &a) {
        // std::cout << "Copy" << std::endl;
        length = a.length;
        head = new Node(a.head->val);
        Node *p = head;
        Node *k = a.head->next;
        while(k) {
            p->next = new Node(k->val);
            p = p->next;
            k = k->next;
        }
    }
    ~List() {
        Node *p;
        while (head) {
            p = head->next;
            delete head;
            head = p;
        }
    } 

    void add(int a, int index = -1) {
        if (head == nullptr) {
            head = new Node(a);
        }
        else {
            Node *p = head;
            if (index == 0) {
                head = new Node(a, head);
                length++;
                return;
            }
            if (index == -1)
                index = length - 1;
            
            for(int i = 0; i < index; i++)
                p = p->next;
            p->next = new Node(a);
        }
        length++;
    }

    void print() {
        for(Node *p = head; p; p = p->next) {
            std::cout << p->val << " ";
        }
        std::cout << std::endl;
    }
    Node *head;
    int length;
};
#endif
