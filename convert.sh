#!/bin/sh

IFS=$'\n'
# list all mp3 files in the current directory.
# (the -1 character in this line is a "one", not an "el")
for INFILE in $(ls -1 *.mp3)
do
  # get the base filename by stripping off the ".mp3" part
  baseFilename=`basename "${INFILE}" .mp3`

  # determine the preliminary output filename
  outfile="${baseFilename}.caf"

  # convert all spaces to hyphens
  outfile=`echo $outfile | tr -s " " "-"`
  echo "Converting \"$INFILE\" to \"$outfile\" ..."

  # now convert the mp3 file to an caf file
  afconvert "$INFILE" "$outfile" -d ima4 -f caff -v

done
