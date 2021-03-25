#!/bin/bash

# In order to succesfully execute this shell script the shell script should be run on a RUG computer through linux bash.
# Zless is the general command to use the tool on Twitter data.
# More explanation about the commands is available in the research paper in the github.


# 1. This function navigates to the map containing the 2021 februari tweets using the command cd.
function navigator {
	cd /net/corpora/twitter2/Tweets/2021/02
}
#2. This function calculates the amount of tweets mentioning a political left party in the Randstad in februari 2021.
#   In order to do so we use grep to include only the three major cities of the Randstad. 
#   Afterwards we pipe it into a grep command searching for the political left parties included in this research.
#   Then we pipe it into a grep -o command in order to be able to wc the amount of tweets.
#   Finally we use wc -l, to count the amount of tweets that mention a political left party inside the Randstad.

function randstad_left {
	echo This may take 30/60 minutes, depending on your processing power.
	echo The amount of mentionings of political left parties in the Randstad for the februari 2021 is:
	zless /net/corpora/twitter2/Tweets/2021/02 *.gz  | /net/corpora/twitter2/tools/tweet2tab -i text user.location hashtags | grep -w -e 'Amsterdam, Nederland' -e 'Rotterdam, Nederland' -e 'Den Haag, Nederland'| grep -iw -e  '#\?PvdD' -e '#\?GL' -e '#\?PvdA' -e '#\?SP' -e '#\?CU' -e '#\?D66' -e '#\?50-plus' -e '#\?PVV' |grep -o ', Nederland'| wc -l
	echo
}
#3. This function calculates the amount of tweets mentioning a political right party in the Randstad in februari 2021.
#   In order to do so we use grep to include only the three major cities of the Randstad. 
#   Afterwards we pipe it into a grep command searching for the political right parties included in this research.
#   Then we pipe it into a grep -o command in order to be able to wc the amount of tweets.
#   Finally we use wc -l, to count the amount of tweets that mention a political right party inside the Randstad.

function randstad_right {
	echo This may take 30/60 minutes, depending on your processing power.
	echo The amount of mentionings of political right parties in the Randstad for the februari 2021 is:
	zless /net/corpora/twitter2/Tweets/2021/02 *.gz  | /net/corpora/twitter2/tools/tweet2tab -i text user.location hashtags | grep -w -e 'Amsterdam, Nederland' -e 'Rotterdam, Nederland' -e 'Den Haag, Nederland'| grep -iw -e  '#\?CDA' -e '#\?SGP' -e '#\?VVD' -e '#\?JA21' -e '#\?FvD' | grep -o ', Nederland' | wc -l
	echo
}
#4. This function calculates the amount of tweets mentioning a political left party outside the Randstad in februari 2021.
#   In order to do so we use grep to include all tweets that come from The Netherlands.
#   Then we pipe that into a grep -v to exclude the cities Amsterdam, Rotterdam and Den Haag.
#   Afterwards we pipe it into a grep command searching for the political left parties included in this research.
#   Then we pipe it into a grep -o command in order to be able to wc the amount of tweets.
#   Finally we use wc to count the amount of tweets that mention a political left party outside the Randstad.

function non_randstad_left {
	echo This may take 30/60 minutes, depending on your processing power.
	echo The amount of mentionings of political left parties outside the Randstad for the februari 2021 is:
	zless /net/corpora/twitter2/Tweets/2021/02 *.gz  | /net/corpora/twitter2/tools/tweet2tab -i text user.location hashtags | grep ', Nederland'| grep -v -e 'Amsterdam, Nederland' -e 'Rotterdam, Nederland' -e 'Den Haag, Nederland' |grep -iw -e  '#\?PvdD' -e '#\?GL' -e '#\?PvdA' -e '#\?SP' -e '#\?CU' -e '#\?D66' -e '#\?50-plus' -e '#\?PVV' | grep -o ', Nederland' | wc -l
	echo
}
#5. This function calculates the amount of tweets mentioning a political right party outside the Randstad in februari 2021.
#   In order to do so we use grep to include all tweets that come from The Netherlands.
#   Then we pipe that into a grep -v to exclude the cities Amsterdam, Rotterdam and Den Haag.
#   Afterwards we pipe it into a grep command searching for the political right parties included in this research.
#   Then we pipe it into a grep -o command in order to be able to wc the amount of tweets.
#   Finally we use wc to count the amount of tweets that mention a political right party outside the Randstad.

function non_randstad_right {
	echo This may take 30/60 minutes, depending on your processing power.
	echo The amount of mentionings of political right parties outside the Randstad for the februari 2021 is:
	zless /net/corpora/twitter2/Tweets/2021/02 *.gz  | /net/corpora/twitter2/tools/tweet2tab -i text user.location hashtags | grep ', Nederland'| grep -v -e 'Amsterdam, Nederland' -e 'Rotterdam, Nederland' -e 'Den Haag, Nederland' |grep -iw -e  '#\?CDA' -e '#\?SGP' -e '#\?VVD' -e '#\?JA21' -e '#\?FvD' | grep -o ', Nederland' | wc -l
	echo
}
navigator
randstad_left
randstad_right
non_randstad_left
non_randstad_right
