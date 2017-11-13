#!/bin/sh
for tests in \
  ./formulas/test.sh \
  ./dimacs/test.sh
do
  echo "$0: running '$tests'"
  $tests || exit 1
done
