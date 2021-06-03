#!/bin/bash #

now="$(date +"%Y%m%d%H%M%S")"
echo "the current time is: $now"
untrackf=$(git ls-files --others --exclude-standard)
declare -a fileslist
#fileslist=$(git diff --name-only --cached)
fileslist=$(git ls-files --modified)
if [[ $fileslist  || $untrackf ]]
then
  cd c:
  mkdir "backup_$now"/
  for i in "${fileslist[@]}"
  do
    cp ~/"$i"  "backup_$now"/
    #cp $untrackf  backup_$now/
done
fi
