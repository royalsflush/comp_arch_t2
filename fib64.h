#ifndef COMP_ARCH_FIB_64_H_
#define COMP_ARCH_FIB_64_H_

//
// fib64.h
//
// Copyright © 2012 - 2013 jones@scss.tcd.ie
//
// example of mixing C++ and x64 assembly language
// Modified by royalsflush to compile in gcc

//
// NB: "extern C" to avoid procedure name mangling by C++ compiler
//

#include "gcc_int64.h"

_int64 fib_x64(_int64);          // fib_x64
_int64 xp2(_int64, _int64);      // xp2

#endif /* COMP_ARCH_FIB_64_H_ */

// eof
