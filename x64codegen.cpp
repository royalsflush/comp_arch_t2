//
// x64codegen.cpp
//
// Copyright © 2012 - 2013 jones@scss.tcd.ie
//
// 20/10/13 modified by royalsflush to compile with gcc
// 28/01/12 first version
//

#include "fib64.h"          //
#include "t2.h"             //
#include <iostream>         // cout

using namespace std;        // cout

//
// fib: C++
//
_int64 fib(_int64 n)
{
    _int64 fi, fj, t;

    if (n <= 1)
        return n;

    fi = 0;
    fj = 1;
    while (n > 1) {
        t = fj;
        fj = fi + fj;
        fi = t;
        n--;
    }
    return fj;
}

//
// check
//
void check(const char *s, _int64 v, _int64 val)
{
    cout << s << " = " << v;
    if (v == val) {
        cout << " OK";
    } else {
        cout << " ERROR: should be " << v;
    }
    cout << endl;
}

//
// main
//
int main(int argc, char** argv)
{
    //
    // tutorial 2
    //
    // check("g", g, 256);
    // check("p(1, 2)", p(1, 2), 11);
    // check("(q(2)", q(2), 1015);
    // check("xp5(1, 2, 3, 4, 5)", xp5(1, 2, 3, 4, 5), 15);
    // check("f(6)", f(6), 720);
    // cout << endl;

    //
    // fib: C++
    //
    for (int i = -1; i < 20; i++)
        cout << fib(i) << " ";
    cout << endl;
    
    //
    // fib: x64 assembly language
    //
    for (int i = -1; i < 20; i++)   
        cout << fib_x64(i) << " ";
    cout << endl;

    //
    // xp2
    //
    check("xp2(7, 11)", xp2(7, 11), 18);
    return 0;
}

// eof
