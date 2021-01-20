// Refs:
//  - http://www.swig.org/tutorial.html
//  - http://www.swig.org/Doc3.0/Library.html#Library_stl_cpp_library

%module mylib
%{
    #include "mylib.h"
%}

%include "std_string.i"
%include "std_vector.i"

namespace std {
    %template(IntVector) vector<int>;
}

%include "mylib.h"

