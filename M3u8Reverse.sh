#!/bin/bash
#use $1 to end number in version4
#This is a script write by FineFan to download all Uplooking online video m3u8 ts files
#with wget command help.
#You may need to Analysis the name rule of m3u8 ts file first 
#and then how the M3u8 file name changed , to make do some fix in this script to download your video tss
#######################################
#below is some value
#like help us do a loop like:
#wget http://$URL000.ts
#wget http://$URL002.ts
#wget http://$URL003.ts
#wget http://$URLxxx.ts
#wget http://$URLend.ts
############################################
#Some defualt values,you may want to change them.
#
#tmpnumbers is a tmp file to list the numbers which used in the full URL
#this file will be removed after downloaded
tmpnumbers=/tmp/numbers
#
#m3u8dowdir is a directory to save all the ts files of the video.
m3u8dowdir=/tmp/m3u8downloaded
#
#This is the finially directory to save the merged file
Merged=/var/www/html/Merged
############################################
#Let's fuck this website
############################################
clear
echo -e "Please Enter the URL like below:"
#add some screen tip in version 2
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca000.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca001.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca002.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16caXXX.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16caXXX.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca998.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca999.ts"
echo -e "       |Pleae input this part                                              |"
echo -e "       ====================================================================="
echo -e "                   ||"
echo -e "                   \/"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca"
read -p "Please Input Your URL:" URL
clear
echo -e "Please Enter the end number of the M3u8 files like below:"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca000.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca001.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca002.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16caXXX.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16caXXX.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca998.ts"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca999.ts"
echo -e "                                                                            | |"
echo -e "                                                                            ==="
echo -e "                                                                             ||"
echo -e "                                                                             \/"
echo -e "                                                                            999"
read -p "Please input a then end number of the video's M3u8 pices:" end
clear
echo -e "Please Enter the finally name of file you want to save."
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca000.ts \ "
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca001.ts |"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca002.ts |"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16caXXX.ts |=====>  Into one file"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16caXXX.ts |      (The finally name"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca998.ts |          saved in your"
echo -e "http://www.domainname.com/firstdir/ts/d2/d3/d2d3f9fe6fbd64cfe9c0ec324c6e16ca999.ts /             disk)"
echo -e "                                                                                             |    |"
echo -e "                                                                                              |  |"
echo -e "                                                                                               ||"
echo -e "                                                                                               \/"
echo -e "                                                                                          And it need a name.   "
read -p "Please input a name to the finially you want to get:" LastName
#create an empty file named "numbsers"to save the numbers
#like :
#1
#2
#....
#999
end=$1
echo > $tmpnumbers
i=0
while [ $i -le $end ]
do
	echo $i >> $tmpnumbers
	i=`expr $i + 1`
done
#create an empty directory to save the ts files that we would download
mkdir $m3u8dowdir
#use the vlue create before to download the ts files.
#Thanks God Sole to help me to write down below structre
#Sole is the auther of cactifans which is very powerful cacti derivative version
#His own web site is http://www.cactifans.org
#This is my suck web site is http://www.fine1329.com -_-\\\
while read line
do
#the one below line will help us to read the numbers from the $tmpnumbers file,
#and made them from 1,2,3,...999 to 001,002,003,....,999, all number worked as three-digit numbers
	line=$(printf "%03d" $line)
	wget http://$URL$line.ts -P $m3u8dowdir
done < $tmpnumbers
#remove the numbers file in /tmp/numbers
rm -f $tmpnumbers
#create an empty directory to merge all these ts files to one file
#add an if structure in version 2
if [ -d $Merged  ] ;
then
	echo "The $Merged dir is already exist."
else
	mkdir $Merged
fi
#mergeing all ts files to one file that named what you wantedn $LastName
echo "Please View $Merged/$LastName.ts to check"
cat $m3u8dowdir/*.ts > $Merged/$LastName.ts
#remove the m3u8downdir
rm -rf $m3u8dowdir
#My email :fine.fan@hotmail.com
#Yeah my name is Fine.Fan
#20140508
