# the "invention" Makefile for `objconv' compilation with gcc
BIN	 = bin
SRCS = src/*.cpp
OBJS = $(shell ls ${SRCS} | sed -e 's/\.cpp/.o/')

DEBUG =
WARNS = -Wall -Wextra
# compiler
CXX = g++
# compiler flags
CXXFLAGS = -O2 -w $(DEBUG) $(WARNS)
# linker flags
LFLAGS =
# target name
TARGET = $(BIN)/objconv
MAKEFLAGS := --jobs=$(shell nproc)

.PHONY: all clean

all: $(OBJS)
	mkdir -p $(BIN)
	$(CXX) $(LFLAGS) -o $(TARGET) $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJS) $(TARGET)
	rm -rf $(BIN)	
