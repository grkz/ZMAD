set grid
set key box
set xrange [-5:5]
set xtics 0.5
description = system("cat param.txt")

set style fill transparent solid 0.6 border lc rgb "black"
set label description at graph 0.07, 0.94
plot 'dist.dat' with filledcu x1 lc rgb "black" title "Distribution", 'hist.dat' using (($1+$2)/2):3 with boxes lc rgb "red" title "Histogram" # srodki binow
