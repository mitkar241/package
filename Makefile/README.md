## Makefile Tutorial
---
- `Makefile`s makes handling of package / binaries easier.
- Also these binaries / executables can be uploaded to `artifactory` which allows smoother CI/CD with automation servers, e.g. `Jenkins`
```
SOURCEFILE = prog.py
TARGETFILE = vcs_prog
```
- `SOURCEFILE` is the source code and `TARGETFILE` is the target binary.
- These variables will vary package to project to project, so need to be hardcoded once.
```
default: help

help:
	echo "This is Makefile for some Binary"
```
- The default entrypoint for the `Makefile` is set to `help`.
- In `help` a line is printed describing purpose of the `Makefile` and should be updated as needed.
```
setup:
	sudo apt install something -y
```
- For fresh setups, necessary dependencies are important.
- Those should be installed / set in this step.
```
build:
	build $(SOURCEFILE) --name $(TARGETFILE)
```
- This step build the binary / executable.
```
run:
	dist/$(TARGETFILE)
```
- This step executes the executable.
```
init: setup build run
```
- To initialize the whole project for the first time.
```
rerun: build run
```
- To run updated code for the first time.
```
clean:
	rm -rf some_folder some_file
```
- Cleaning up the binaries / additional files that can be recreated.
