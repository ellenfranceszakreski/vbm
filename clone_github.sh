#!/bin/sh
# ./clone_github.sh clone vbm respository github files to CIC directory Github (on analysis path)
# get code from github repository
# e.g. ./clone_github.sh

AnalysisDir=/data/scratch/zakell/vbm # make sure this is correct (name should not have any spaces)

# make Scripts directory if one does not already exist
test ! -d $AnalysisDir/Scripts && mkdir $AnalysisDir/Scripts
GithubDir=$AnalysisDir/Github

# remake Github directory
test -d $GithubDir && rm -r $GithubDir
mkdir $GithubDir

# clone github files
git clone https://github.com/ellenfranceszakreski/vbm --depth 1 --branch=master $GithubDir

# make scripts executable and easy to delete (github sets access of files clones to read only)
chmod -R 777 "$GithubDir"

# show new files
echo "New files:"
ls -l $GithubDir

# print instructions for moving to Scripts directory
printf "\n\nTransfer done. When ready, enter commands below:\n"
printf "cd %s\n" "$AnalysisDir"
printf "mv -v %s/* Scripts\n\n" $GithubDir
unset GithubDir AnalysisDir
exit 0
### DONE
