#!/bin/sh
LANG=C
export LANG
VERSION="`cat VERSION`"
GITID="`git show|awk '{print $2;exit}'`"
CC="`sed -e '/^CC=/!d' -e 's,^CC=,,' makefile`"
CFLAGS="`sed -e '/^CFLAGS=/!d' -e 's,^CFLAGS=,,' makefile`"
cat <<EOF
// generated by 'mkversion.sh'
#include "headers.h"
void print_version () {
  msg (1, "Version $VERSION $GITID");
  msg (1, "Compiled with '$CC $CFLAGS' on");
  msg (1, "`date`");
}
EOF
