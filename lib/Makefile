#
# Build static and shared libraries for raspidmx
#

LIB=raspidmx
LIBPNG=raspidmxPng

RPI_VC_INC_DIR ?= /opt/vc/include
RPI_VC_LIB_DIR ?= /opt/vc/lib

ifeq ("$(wildcard $(RPI_VC_INC_DIR))", "")
RPI_VC_INC_DIR=/usr/include
RPI_VC_LIB_DIR=/usr/lib/arm-linux-gnueabihf
$(shell printf "\e[1;35m%s\e[0m: %s \e[1;36m%s\e[0m\n" "NOTE" "libpng12 pkg-config required. Run like:" "PATH=<path to libpng12>/bin:\$${PATH} make" 1>&2)
endif

OBJS=../common/backgroundLayer.o ../common/imageGraphics.o ../common/key.o \
 ../common/font.o ../common/imageKey.o ../common/hsv2rgb.o \
 ../common/imageLayer.o ../common/image.o ../common/imagePalette.o

OBJSPNG=../common/spriteLayer.o ../common/loadpng.o ../common/savepng.o ../common/scrollingLayer.o

CFLAGS+=-Wall -g -O3 -I../common $(shell libpng-config --cflags)
LDFLAGS+=-L$(RPI_VC_LIB_DIR)/ -lbcm_host -lm
LDFLAGSPNG=${LDFLAGS} $(shell libpng-config --ldflags)

INCLUDES+=-I$(RPI_VC_INC_DIR)/ -I$(RPI_VC_INC_DIR)/interface/vcos/pthreads -I$(RPI_VC_INC_DIR)/interface/vmcs_host/linux

all: $(LIB) $(LIBPNG)

%.o: %.c
	@rm -f $@ 
	$(CC) $(CFLAGS) $(INCLUDES) -g -c $< -o $@ -Wno-deprecated-declarations

$(LIB): $(OBJS)
	$(AR) rcs lib$(LIB).a $(OBJS)

$(LIBPNG): $(OBJSPNG)
	$(AR) rcs lib$(LIBPNG).a $(OBJSPNG)


clean:
	@rm -f $(OBJS)
	@rm -f lib$(LIB).a
