// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "vector_max.h"

int vector_max(int *v, int len) {
  int max = -1;
  unsigned int i = 0;

iterate:
  if (i >= len) {
    goto end;
  }
  if (v[i] > max) {
    goto update;
  }
  goto skip;

update:
  max = v[i];
  goto skip;

skip:
  i++;
  goto iterate;

end:
  return max;
}
