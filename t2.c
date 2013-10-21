#include <stdio.h>

#include "gcc_int64.h"
#include "t2.h"

_int64 g = 256;

_int64 p(_int64 i, _int64 j) 
{ 
	_int64 k; 
	k= i + j; 
	return (k << 2) - 1; 
} 

_int64 q(_int64 i) 
{ 
	return p(g, -i); 
} 

_int64 f(_int64 n) 
{ 
	if (n > 0) { 
		return n*f(n-1); 
	} else { 
		return 1; 
	} 
} 

_int64 xp5(_int64 a, _int64 b, _int64 c, _int64 d, _int64 e) 
{ 
	_int64 sum = a + b + c + d + e; 
	printf("a = %" PRId64 " b = %" PRId64 " c = %" PRId64 " d = %" PRId64 " e = %" PRId64 " sum = %" PRId64 "\n", a, b, c, d, e, sum); 
	return sum; 
}
