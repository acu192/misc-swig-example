#include "mylib.h"


int foo(int a, int b) {
    return a + b;
}


std::vector<int> bar(int a, int b) {
    std::vector<int> v;
    v.push_back(a);
    v.push_back(b);
    return v;
}

