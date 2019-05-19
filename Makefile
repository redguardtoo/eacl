SHELL = /bin/sh
EMACS ?= emacs
PROFILER =

.PHONY: test

# Delete byte-compiled files etc.
clean:
	rm -f *~
	rm -f \#*\#
	rm -f *.elc

# Run tests.
test: clean
	$(EMACS) -batch -Q -l eacl.el -l test/eacl-tests.el
