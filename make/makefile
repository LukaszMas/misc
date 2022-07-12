# makefile for 'my_program'
#
# --- Build Root --------------------------------------------------------------
#
# Everything this makefile creates goes in the BUILD_ROOT directory
# When the `make clean` is run, this directory will be removed
BUILD_ROOT = build

# --- Build Variant -----------------------------------------------------------
#
# Build release version:
#  > make VARIANT=release -j <nproc>
# Build debug version:
#  > make VARIANT=debug -j <nproc>
# NOTE: Its safe to specify <nproc> - (1-2 cores) not to overload the CPU
#
# If VARIANT is not specified, the Makefile defaults to release
VARIANT := $(or ${VARIANT},${VARIANT},release)

$(info Variant is [${VARIANT}])

# Variants have different build directories so they won't overwrite each other.
ifeq ($(VARIANT),debug)
BUILD_DIR = ${BUILD_ROOT}/debug
else
BUILD_DIR = ${BUILD_ROOT}/release
endif

# --- Sanitizers --------------------------------------------------------------
#
# Specify sanitizer to use (works best with clang compiler)
# Sanitizer - "address", "undefined", "thread", "memory"
#
# NOTE: Uncomment the following line adding sanitizer of your choice:
# SANITIZER=

SANITIZERS := address undefined thread memory

ifdef SANITIZER
    ifneq ($(filter $(SANITIZER),$(SANITIZERS)),)
        CXXFLAGS += -fsanitize=$(SANITIZER)
    else
        $(error Unknown Sanitizer: ${SANITIZER})
    endif
    $(info Sanitizer enabled: ${SANITIZER})
endif

# --- Build vars --------------------------------------------------------------

PROGRAM = my_program
SRC_DIR = src
INC_DIR = include
EXT_LIB_DIR = <folder_path>
INC_FLAGS = -I$(INC_DIR) -I$(EXT_LIB_DIR)

# --- Build artifacts ---------------------------------------------------------

OBJ_DIR = $(BUILD_DIR)/obj
GEN_DIR = $(BUILD_DIR)/gen
BIN_DIR = $(BUILD_DIR)/bin
LIB_DIR = $(BUILD_ROOT)/lib

# --- Build libs & flags ------------------------------------------------------

LIBS = `pkg-config opencv4 --cflags --libs` `curl-config --libs --cflags`

CXXFLAGS = -std=c++17 -Wall \
           -Wlogical-op \
           -Wpointer-arith \
           -Wwrite-strings \
           -Wmaybe-uninitialized \
           -Wstrict-overflow \
           -Wunreachable-code \
           -Wunused-result \
           -Wunused-variable \
           -Wunused-but-set-variable \
           -Wno-free-nonheap-object \
           $(INC_FLAGS) -I$(GEN_DIR) -lpthread

LDFLAGS = -L$(LIB_DIR)

ifeq ($(VARIANT),debug)
CXXFLAGS += -O0 -g3 -DVL_DEBUG
LDFLAGS += -ggdb
else
CXXFLAGS += -O2 -fomit-frame-pointer -finline-functions
endif

# --- Build files -------------------------------------------------------------

DEPS = $(wildcard $(INC_DIR)/*.h)
SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRCS))

.DEFAULT_GOAL := $(BIN_DIR)/<my_program>

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp $(DEPS) ;@mkdir -p $(@D)
	$(CXX) -c -o $@ $< $(CXXFLAGS) $(LIBS)

$(BIN_DIR)/my_program: $(OBJS) $(LIB_DIR)/%.so
	mkdir -p $(BIN_DIR)
	$(CXX) -o $@ $(OBJS) $(CXXFLAGS) $(LDFLAGS) $(LIBS)
	echo "<my_program> built successfully"

# --- Run ---------------------------------------------------------------------

# (opt) add running command

# --- Install -----------------------------------------------------------------

# --- install ---
.PHONY: install
install:
	$(MAKE)

# --- bear --------------------------------------------------------------------
# Generate compile_commands.json file.

.PHONY: bear
bear: clean
	bear make

# --- clean -------------------------------------------------------------------
# Clean up build artifacts.
.PHONY: clean
clean:
	rm -rf ${BUILD_ROOT}

# --- rebuild -----------------------------------------------------------------
# Clean and build.
.PHONY: rebuild
rebuild: clean install

# --- fixmes ------------------------------------------------------------------
# Return all "FIXME" lines that aren't in this Makefile.
.PHONY: fixmes
fixmes:
	@grep -Irn FIXME --exclude=Makefile
