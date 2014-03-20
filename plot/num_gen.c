#include <stdio.h>
#include <stdlib.h>
int
main()
{
	float i=0;
	for (i = 0.f; i <= 3001.f; i+=100.f) {
		printf("%g ", i);
	}
	return 0;
}
