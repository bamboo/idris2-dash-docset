source := ./packages

.PHONY: all
all: idris.docset

idris.docset: $(source)/prelude
	dashing build --source $(source)

$(source)/prelude: | $(source)
	@for p in prelude base contrib network; \
		do cp -r ../Idris2/libs/$$p/build/docs packages/$$p; \
	done;

$(source):
	mkdir $(source)
