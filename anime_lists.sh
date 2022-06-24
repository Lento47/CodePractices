#!/bin/bash 

url2="https://www.listchallenges.com/anime-list-1000/"
url="https://www.listchallenges.com/anime-pat-need-to-watch/"

for ((i=1; i<=24; i++))
do
    # Unix command 
    curl -s --request GET $(echo "$url/list/$i" $1) | grep "item-name" -A 3 | tr -d "<>=/" | sed 's/div//g' | sed 's/class"item-name"//g' | sed 's/-//g' | sed 's/class"itemcheckbox"//g' | sed '/^[[:space:]]*$/d' | awk -F\t "NF > 1" OSF="\t" | awk -v start=0 -v end=3 '{ for (i=start; i<=end;i++) printf("%s%s", $i,(i==end) ? "\n" : OFS) }' | cut -f5- | awk '{$1=""}1'

done > anime_list.txt


# picks 1 anime randomly 

cat anime_list | sort --randon-sort | head -n 1

#----------------Tests----------------------------------#
#list_ext=$url

#curl --request GET $webpages | grep "item-name" -A 3 | tr -d "<>=/" | sed 's/div//g' | sed 's/class"item-name"//g' | sed 's/-//g' | sed 's/class"itemcheckbox"//g' | sed '/^[[:space:]]*$/d' | awk -F\t "NF > 1" OSF="\t" | awk -v start=0 -v end=3 '{ for (i=start; i<=end;i++) printf("%s%s",
 #$i,(i==end) ? "\n" : OFS) }' | cut -f5- | awk '{$1=""}1'
#---------------END--------------------------------------#

