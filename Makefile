TARGETS=lib \
	pngview

$(shell printf "\e[1;33m%s\e[0m: %s \n" "ATTENTION" "Skipping unused sub-programs" 1>&2)

# life \
# mandelbrot \
# offscreen
# radar_sweep \
# radar_sweep_alpha \
# rgb_triangle \
# game \
# spriteview \
# test_pattern \
# worms

default :all

all:
	for target in $(TARGETS); do ($(MAKE) -C $$target); done

clean:
	for target in $(TARGETS); do ($(MAKE) -C $$target clean); done

