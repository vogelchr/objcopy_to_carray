#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

extern void    _binary__etc_passwd_size;
extern char    _binary__etc_passwd_start;
extern char    _binary__etc_passwd_end;

int
main(int argc, char **argv)
{
	(void)argc;
	(void)argv;

	/* try one of the following two lines */
	// size_t size = &_binary__etc_passwd_size;
	size_t size = &_binary__etc_passwd_end - &_binary__etc_passwd_start;

	printf("Dumping /etc/passwd, in memory @%p, size is %zu.\n",
		&_binary__etc_passwd_start, size);
	write(1,&_binary__etc_passwd_start,size);
	exit(0);
}
