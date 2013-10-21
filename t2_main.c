#include <stdio.h>

#include "gcc_int64.h"
#include "t2.h"

void check(const char* check_name, _int64 expected, _int64 actual) {
	printf("Check %s: ", check_name);

	if (expected != actual) {
		printf("ERROR: expected %" PRId64 ", got %" PRId64 "\n", expected, actual); 		
	} else {
		printf("OK\n");
	}
}

int main(int argc, char** argv) {
	check("15 == 15", 15, 15);
	check("5 != 10", 5, 10);
	return 0;
}
