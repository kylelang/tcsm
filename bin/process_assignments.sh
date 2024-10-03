#!/bin/bash

### Title:    Process TCSM Assignment Submissions
### Author:   Kyle M. Lang
### Created:  2024-10-03
### Modified: 2024-10-03

### Description:
# This script should automagically process the assignment downloads from BB
# 1. Unzip the download archive and move the download archive to ./tmp/
# 2. Replace all spaces in filenames with underscores
# 3. Remove all BB boilerplate from filenames and start each filename with gNN
# 4. Parse the file names to extract the group numbers and create a directory for each group
# 5. Move all a group's files to their directory

### Usage:
# ./process_assignments.sh BB_DOWNLOAD_FILE.zip

function lss () {
  ls --ignore=*.sh -p | grep -v /$
}

unzip "$1"

mkdir tmp
mv "$1" tmp/

rename.ul --all " " "_" ./*

for x in `lss`; do
  f=`echo $x | sed 's/^.*Group_/g/'`
  # mv $x $f
  d=`echo $f | sed 's/[[:punct:]].*$//'`
  mkdir $d
  mv $x $d/$f
done;
