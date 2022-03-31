OBJS=pngview.o
BIN=pngview

RPI_VC_INC_DIR ?= /opt/vc/include
RPI_VC_LIB_DIR ?= /opt/vc/lib

ifeq ("$(wildcard $(RPI_VC_INC_DIR))", "")
RPI_VC_INC_DIR=/usr/include
RPI_VC_LIB_DIR=/usr/lib/arm-linux-gnueabihf
endif

CFLAGS+=-Wall -g -O3 -I../common $(shell libpng-config --cflags)
LDFLAGS+=-L../lib -lraspidmx -lraspidmxPng -L$(RPI_VC_LIB_DIR)/ -lbcm_host -lm $(shell libpng-config --ldflags)

INCLUDES+=-I$(RPI_VC_INC_DIR)/ -I$(RPI_VC_INC_DIR)/interface/vcos/pthreads -I$(RPI_VC_INC_DIR)/interface/vmcs_host/linux

all: $(BIN)

%.o: %.c
	@rm -f $@ 
	$(CC) $(CFLAGS) $(INCLUDES) -g -c $< -o $@ -Wno-deprecated-declarations

$(BIN): $(OBJS)
	$(CC) -o $@ -Wl,--whole-archive $(OBJS) $(LDFLAGS) -Wl,--no-whole-archive -rdynamic

clean:
	@rm -f $(OBJS)
	@rm -f $(BIN)
