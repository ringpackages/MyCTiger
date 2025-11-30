#include "stdio.h"
#include "stdlib.h"

	void greet(char* name) {
	printf("Hello, %s!\n", name);
	}

	int add(int a, int b) {
	return a + b;
	}

	int factorial(int n) {
	if (n <= 1) return 1;
	return n * factorial(n - 1);
	}


int main(int argc, char *argv[])
{
	printf("");
	printf("");
	printf("");

	greet("MyCTiger User");

	int sum = add(10, 20);
	printf("10 + 20 = %d\n", sum);

	int fact = factorial(5);
	printf("5! = %d\n", fact);


	return 0;
}
