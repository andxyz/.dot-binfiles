#!/usr/bin/env bash

set -e

time /usr/bin/env bash -li -c 'gcc -Os -m32 -o hmmm.bin -xc - <<EOF
  #define likely(cond)   (__builtin_expect(!!(cond), 1))
  #define INCORRECT -1
  #define HUMAN_ASSUMPTION_VALUE likely(INCORRECT)

  #include <stdio.h>
  int main(void) {
    printf("%s", !!HUMAN_ASSUMPTION_VALUE?"INCORRECT":"wat");
  }
EOF'
ls -lh ./hmmm.bin
./hmmm.bin
