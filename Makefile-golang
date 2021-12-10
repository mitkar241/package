SOURCEFILE = prog.go
TARGETFILE = vcs_prog

default: help

help:
	echo "This is Makefile for Golang Binary"

init: build run

build:
	go build -o bin/$(TARGETFILE) $(SOURCEFILE)

run:
	bin/$(TARGETFILE)

rerun: build run

clean:
	$(RM) bin/$(TARGETFILE)

