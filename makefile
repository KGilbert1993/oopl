clean:
	cd examples; make clean
	@echo
	cd exercises; make clean

config:
	git config -l

init:
	touch README
	git init
	git add README
	git commit -m 'first commit'
	git remote add origin git@github.com:gpdowning/ooplni.git
	git push -u origin master

pull:
	@rsync -r -t -u -v --delete             \
    --include "Hello.c++"                   \
    --include "Assertions.c++"              \
    --include "UnitTests1.c++"              \
    --include "UnitTests2.c++"              \
    --include "UnitTests3.c++"              \
    --include "Coverage1.c++"               \
    --include "Coverage2.c++"               \
    --include "Coverage3.c++"               \
    --include "Exceptions.c++"              \
    --include "Exceptions2.c++"             \
    --include "Exceptions3.c++"             \
    --include "Variables.c++"               \
    --include "Arguments.c++"               \
    --include "Returns.c++"                 \
    --include "Cache.c++"                   \
    --include "Types.c++"                   \
    --include "Representations.c++"         \
    --include "Operators.c++"               \
    --include "Selection.c++"               \
    --include "Iteration.c++"               \
    --include "StackVsHeap.c++"             \
    --include "Valgrind.c++"                \
    --include "Lambdas.c++"                 \
    --include "Iterators.c++"               \
    --include "Consts.c++"                  \
    --include "Consts2.c++"                 \
    --include "Arrays.c++"                  \
    --exclude "*"                           \
    ../../../examples/c++/ examples
	@rsync -r -t -u -v --delete             \
    --include "IsPrime1.c++"                \
    --include "IsPrime1.h"                  \
    --include "IsPrime2.c++"                \
    --include "IsPrime2.h"                  \
    --include "StrCmp.c++"                  \
    --include "StrCmp.h"                    \
    --include "Equal.h"                     \
    --include "Equal.c++"                   \
    --include "Incr.c++"                    \
    --include "Incr.h"                      \
    --include "Copy.h"                      \
    --include "Copy.c++"                    \
    --include "Fill.h"                      \
    --include "Fill.c++"                    \
    --include "AllOf.h"                     \
    --include "AllOf.c++"                   \
    --include "Accumulate.h"                \
    --include "Transform.h"                 \
    --include "RangeIterator.c++"           \
    --include "Range.c++"                   \
    --exclude "*"                           \
    ../../../exercises/c++/ exercises

#    --include "RangeIterator.h"             \
#    --include "Range.h"                     \

push:
	make clean
	@echo
	git add .travis.yml
	git add examples
	git add exercises
	git add makefile
	git commit -m "another commit"
	git push
	git status

status:
	make clean
	@echo
	git branch
	git remote -v
	git status

testx:
	cd examples; make testx
	@echo
	cd exercises; make testx

testy:
	cd examples; make testy
	@echo
	cd exercises; make testy

testz:
	cd examples; make testz
	@echo
	cd exercises; make testz
