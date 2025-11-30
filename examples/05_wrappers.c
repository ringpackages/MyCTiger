#include "stdio.h"
#include "stdlib.h"

int main(int argc, char *argv[])
{
	printf("=== Standard Library Wrappers Demo ===\n");
	printf("");
	printf("\n");
	printf("");
	printf("Using stdio.print: ");
	printf("");
	printf("This is easier than raw C!\n");
	printf("");
	printf("\n");
	printf("");
	printf("=== System Call Demo ===\n");
	printf("");
	system("echo Running on Windows");
	printf("");
	printf("\n");
	printf("");
	printf("=== Mixed Approach ===\n");
	printf("");
	printf("");

	printf("Raw C printf still works!\n");

	printf("\n");
	printf("");
	printf("Demo completed successfully!\n");
	printf("");

	return 0;
}
