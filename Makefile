CFLAGS=-Wall -Wextra -ggdb -Os

all : testme

testme : testme.o passwd.o

###
# To learn about the correct architecture and file formats,
# run objdump -x on a file compiled for your architecture of choice!
###

ifeq ($(shell uname -m),x86_64)
OBJCOPY_ARCH=-O elf64-x86-64 -B i386:x86-64
else ifeq ($(shell uname -m),armv6l)
OBJCOPY_ARCH=-O elf32-littlearm -B arm
else
OBJCOPY_ARCH=UNKNOWN_ARCHITECTURE_EDIT_MAKEFILE_TO_FIX_THIS
endif

passwd.o : /etc/passwd
	objcopy -I binary $(OBJCOPY_ARCH) \
		$< $@ || (rm -f $@ ; exit 1)

.PHONY : clean
clean :
	rm -f *.o passwd.* testme *.d *~

