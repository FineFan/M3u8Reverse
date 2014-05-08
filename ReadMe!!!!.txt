=============================================================
1.Something you should know before you use this shell script
=============================================================
You could use my shell scripte runing on a CentOS6 to download online videos which play on a M3u8 web site but there are some specific env in my case:
1.1This web site use url to recognize where the M3u8 ts files is.
1.2All M3u8 ts files's(which are from one whole video file) URL only have the last three digit is different and they are three cumulative number like:
001
002
003
...
009
010
011
...
099
100
1.3 Need wget tool
==============================================================
2.About the M3u8 ts files
==============================================================
For example there is a 10minutes video files named Myhappytime.mp4
they use a software to cut this file in to a lot of pices each pice have about 10 seconds of this video file and rename those pices.like:
abc000.ts
abc001.ts
abc002.ts
...
abc060.ts
And save them into a web server in a URL like:
http://www.domain.com/myhappytime/ts/dir1/dir2/dir3/abc0xx.ts
So when you click a hypelink on a web page
the server will paly them one by one and each of them show you about 10 seconds view of Myhappytime.mp4
===============================================================
3.Two variable you should get 
===============================================================
3.1.The URL without the last three crmulative number like:
http://www.domain.com/myhappytime/ts/dir1/dir2/dir3/abc0xx.ts
|                                                     |
http://www.domian.com/myhappytime/ts/dir1/dir2/dir3/abc   <===we need this part first

3.2.The last three-digit number
in this case:
abc000.ts
abc001.ts
abc002.ts
...
abc060.ts
the last three-digit number is 060.but we only need the 60 cause my script will convert them into three digit.
Tip:You could press the F12 key when you browser your web page and click NETWORK then media and play the last few seconds of the online video to get the last number.
===============================================================
4.How to use
===============================================================
4.1.download this shell script
4.2.chmod a+x M3u8Reverse.sh
4.3.sh M3u8Reverse.sh 
4.4.input the url:www.domian.com/myhappytime/ts/dir1/dir2/dir3/abc 
4.5.input the last number:60
4.6.give a finally name which will give the file that all ts file combine to 
================================================================
5.How does it works
================================================================
5.1.Read your URL
5.2.Read your last number
5.3.Read the last name
5.4.Do a loop to input 0 to your last number into a temp file(tmpnumbers)
5.5.Create a temp dir to down all ts file with wget(m3u8dowdir)
5.6.Download ts files to m3u8dowdir
5.7.Remove the tmpnumbers file
5.8.Create a Merged dir to save the finally file if it doesn't exist
5.9.Combine all ts files into one file renamed as you wanted.
5.10.Remove m3u8dowdir
