#!/bin/bash
# show 256 color
#
esc="\033["
fore="38;5;"
back="48;5;"

# title
echo	 ""
echo -n  "    "
echo -e  "${esc}4;${fore}11m256 color table${esc}m"

# usage
echo -n  "    "
echo -ne "${esc}${fore}196mUsage${esc}m"
echo -n  " - "
echo -ne "${esc}${fore}10mForeground${esc}m"
echo -n  ": \\033[38;5;"
echo -ne "${esc}${fore}12m<num>${esc}m"
echo -n  "m, "
echo -ne "${esc}${fore}10mBackground${esc}m"
echo -n  ": \\033[48;5;"
echo -ne "${esc}${fore}12m<num>${esc}m"
echo     "m"

# color table
echo -n  "    "
for j in 1 2 3 4; do
	if [ "$j" != "4" ]; then
		echo -n " _ _ _Fore_ _ _Back _"
	else
		echo " _ _ _Fore_ _ _Back _"
	fi
done
for ((i=0; i<64; i=i+1))
do
	lineout=""
	for j in 0 1 2 3; do
		k=$(($i+$j*64))
		line="${k}  ${esc}${fore}${k}m Color  ${esc}m${esc}${back}${k}m Color  ${esc}m"
		if [ "$k" -lt "10" ]; then
			lineout=" ${lineout}  ${line}"
		elif [ "$k" -lt "100" ]; then
			lineout=" ${lineout} ${line}"
		else
			lineout=" ${lineout}${line}"
		fi
	done
	echo -e "${lineout}"
done

echo	 ""
