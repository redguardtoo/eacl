SHELL = /bin/sh
EMACS ?= emacs
PROFILER =
EMACS_BATCH_OPTS=--batch -Q -l eacl.el
RM = @rm -rf

.PHONY: test clean compile

clean:
	$(RM) *~
	$(RM) \#*\#
	$(RM) *.elc

compile: clean
	@$(EMACS) $(EMACS_BATCH_OPTS) -l tests/my-byte-compile.el 2>&1 | grep -E "([Ee]rror|[Ww]arning):" && exit 1 || exit 0

test: compile
	@$(EMACS) $(EMACS_BATCH_OPTS) -l tests/eacl-tests.el
