CFLAGS = -g -target riscv64 -march=rv64i -I$(MUSL_INSTALL_PATH)/include

all: interrupt_handling

interrupt_handling: interrupt_handling.o
	ld.lld-$(CLANG_VERSION) -o interrupt_handling \
		$(MUSL_INSTALL_PATH)/lib/crt1.o \
		$(MUSL_INSTALL_PATH)/lib/libc.a \
		$(COMPILER_RT_PATH) \
		*.o

interrupt_handling.o: interrupt_handling.s
	clang-$(CLANG_VERSION) $(CFLAGS) -c interrupt_handling.s

clean:
	rm -f interrupt_handling *.o
