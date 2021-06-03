#!/bin/bash #

now="$(date +"%Y%m%d%H%M%S")"
echo "the current time is: $now"
untrackf=$(git ls-files --others --exclude-standard)
declare -a fileslist
#fileslist=$(git diff --name-only --cached)
fileslist=$(git ls-files --modified)
if [[ $fileslist  || $untrackf ]]
then
  #cd c:
  foldername="backup_$now"
  echo "the foldername is: $foldername"
  mkdir $foldername
  for i in "${fileslist[@]}"
  do
    pwd
    cp $i  $foldername/
    cp $untrackf  $foldername/
done
fi
