DEBUG_BUILD = -g
INDIGO_ROOT = ..
BUILD_ROOT = $(INDIGO_ROOT)/build
BUILD_LIB = $(BUILD_ROOT)/lib

ifeq ($(OS),Windows_NT)
	OS_DETECTED = Windows
else
	OS_DETECTED = $(shell uname -s)
	ifeq ($(OS_DETECTED),Darwin)
		CFLAGS = $(DEBUG_BUILD) -O3 -I$(INDIGO_ROOT)/indigo_libs -I$(INDIGO_ROOT)/indigo_libs -std=gnu11 -DINDIGO_MACOS
		LDFLAGS = -L$(BUILD_LIB) -lindigo
	endif
	ifeq ($(OS_DETECTED),Linux)
		CFLAGS = $(DEBUG_BUILD) -O3 -I$(INDIGO_ROOT)/indigo_libs -I$(INDIGO_ROOT)/indigo_libs -std=gnu11 -DINDIGO_LINUX
		LDFLAGS = -L$(BUILD_LIB) -lindigo
	endif
endif

all: cliente

cliente: cliente.c
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

.PHONY: clean

clean:
	rm cliente
