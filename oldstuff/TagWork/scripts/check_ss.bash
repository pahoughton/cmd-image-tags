for fn in PC??????.JPG; do echo $fn | sed 's/PC\(..\)\(....\).JPG/2007-12-\1-\2.jpg/'; done 

for fn in P???????.JPG; do echo $fn | sed 's/P\(.\)\(..\)\(....\).JPG/2007-0\1-\2-\3.jpg/'; done 

PC300127
