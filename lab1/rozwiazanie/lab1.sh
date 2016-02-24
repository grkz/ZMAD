#!/bin/bash

echo Enter number of random generated numbers:
read N
echo Enter scale parameter:
read s
echo Enter number of bins:
read bins

 
./prog $N $s $bins
gnuplot ./plot.gp -persist
