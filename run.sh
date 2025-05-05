#!/bin/bash

for method in OPENMP OPENMPSINGLECOLUMN OPENACCSINGLECOLUMN
do
  cp lparallelmethod.txt.$method lparallelmethod.txt
  ./main.x < input.txt > output.txt.$method
done

