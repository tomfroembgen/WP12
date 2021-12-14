#!/bin/bash
for n in $( find . -maxdepth 3 -mindepth 3 -type d -name "cdf"); 
do 
	cd $n; 
	rm -f XXX.txt YYY.txt ZZZ.txt cdf.gp; 
	sed '24d' *.gp > XXX.txt; 
	sed -i '24is_xtitle = "r_{O-O} / pm"' XXX.txt; 
	sed '26d' XXX.txt > YYY.txt; 
	sed -i '26is_ytitle = "{/Symbol a}_{O-H-O} / deg"' YYY.txt;
        sed '94d' YYY.txt > ZZZ.txt;
	sed -i '94iset output "cdf.png"' ZZZ.txt;	
	sed '146d' ZZZ.txt > cdf.gp;
	sed -i '146iset output "cdf_box.png"' cdf.gp;	
	sed -i 's@s_labelfontscale = 1.0@s_labelfontscale = 1.3@' cdf.gp;
	sed -i 's@s_ticsfontscale = 1.0@s_ticsfontscale = 1.3@' cdf.gp;
	gnuplot cdf.gp;
	cd ../../../ ; 
done   
