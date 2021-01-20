#include "mylib.h"

#include <iostream>


int foo(int a, int b) {
    return a + b;
}


std::vector<int> bar(int a, int b) {
    std::vector<int> v;
    v.push_back(a);
    v.push_back(b);
    return v;
}

void print_stuff(std::string a, const std::string& b, int c, double d) {
    std::cout << a << std::endl;
    std::cout << b << std::endl;
    std::cout << c << std::endl;
    std::cout << d << std::endl;
}

