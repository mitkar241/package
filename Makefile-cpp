SOURCEFILE = prog.cpp
TARGETFILE = vcs_prog

# the compiler: g++ for C++ program
CC = g++
CFLAGS = -g -Wall

default: help

help:
	echo "This is Makefile for C++ Binary"

init: build run

build: $(TARGETFILE)

$(TARGETFILE): $(SOURCEFILE)
	$(CC) $(CFLAGS) -o $(TARGETFILE) $(SOURCEFILE)

run:
	./$(TARGETFILE)

rerun: build run

clean:
	$(RM) $(TARGETFILE)

