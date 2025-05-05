#!/bin/bash

set -e

for method in OPENMP OPENMPSINGLECOLUMN OPENACCSINGLECOLUMN
do
  cp lparallelmethod.txt.$method lparallelmethod.txt
  ./main.x < input.txt > output.txt.$method
  diff output.txt.$method ref/output.txt.$method
done

