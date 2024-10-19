#!/bin/bash

echo -e "\e[1m****************************************************************************"
echo -e "                          eNum3r4t0r"
echo -e "                          ______________________by 4n0nybug"
echo -e "                          ______________________edited by ruben"
echo -e
echo -e "                          Subdomain enumeration tool!"
echo -e
echo -e "*****************************************************************************"

echo -e "Enter target domain:"
read target

echo -e "[*]Finding sub-domains for $target..."
echo -e
echo -e "[*]Initiating asset finder..."
assetfinder $target > assetfinder.txt
echo -e "[*]Completed asset finder..."
echo -e
echo -e "[*]Initiating sublist3r..."
echo -e
python3 ~/Tools/Sublist3r/sublist3r.py -d $target -o sublist3r.txt > null.txt
rm null.txt
echo -e "[*]Completed sublist3r..."
echo -e
#echo  -e "[*]Initiating amass..."
#amass enum --brute -d $target -w ~/jhaddix/all.txt -o amass.txt > null.txt
#rm null.txt
#echo  -e "[*]Completed amass..."
echo -e
echo -e "[*]Total compliled list of sub-domains of $target:"
cat assetfinder.txt >>final.txt
cat sublist3r.txt >>final.txt
#cat amass.txt >>final.txt
echo  -e "[*]Total available sub-domains of $target:"
cat final.txt | sort -u | uniq > unique.txt
cat unique.txt
count=$(cat unique.txt | wc -l)
echo -e "[*]Total sub-domains: $count"
echo -e
echo -e "Would you like to save this output to a file?[Y/n]"
echo -e
read ans
if [[ $ans = 'y' || $ans = 'Y' ]]; then
	echo  -e "Specify a file name:"
	read name
	echo  -e "Specify a save location:"
	read location
	cat unique.txt > $name
	mv $name $location
fi
echo -e "[*]Execution Completed Successfully!"
rm final.txt
rm assetfinder.txt
rm sublist3r.txt
rm unique.txt

