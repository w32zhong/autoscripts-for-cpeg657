#include <stdio.h>
#include <stdlib.h>
int
main()
{
	float i=0;
	for (i = 0; i <= 3000.f; i+=300) {
		printf("%g ", i);
	}
	return 0;
}
