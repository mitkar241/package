CLASS = Prog
TARGETFILE = vcs_prog.jar

.SUFFIXES:
.SUFFIXES: .class .jar

default: help

help:
	echo "This is Makefile for Java jar"

init: setup build run

setup:
	echo "Main-Class:  $(CLASS)" > MANIFEST.MF

build:
	javac -d . $(CLASS).java
	jar cvmf MANIFEST.MF $(TARGETFILE) $(CLASS).class

run:
	java -jar $(TARGETFILE)

rerun: build run

clean:
	$(RM) *.class *.jar

