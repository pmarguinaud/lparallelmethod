#!/bin/bash

set -e
set -x

for method in OPENACCSINGLECOLUMN OPENMP OPENMPSINGLECOLUMN
do
  cp lparallelmethod.txt.$method lparallelmethod.txt
  \rm -f output.txt
  ./main.x 
  \mv output.txt output.txt.$method
  diff output.txt.$method ref/output.txt.$method
  \rm -f output.txt.$method lparallelmethod.txt
done

