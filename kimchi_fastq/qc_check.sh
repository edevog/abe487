#!/bin/bash

module load fastqc
module load fastx

if [[ $# -lt 1 ]]; then
  printf "Usage: %s FILE [FILE2...]\n" $(basename $0)
  exit
fi

i=0
for FILE in $*; do
    let i++

    if [[ ! -e $FILE ]]; then
      echo FILE \"$FILE\" does not exist.
      exit
    fi

    BASENAME=$(basename $FILE '.fastq')

    printf "%5d: %s\n" $i $FILE

    #echo FILE \"$FILE\" BASENAME \"$BASENAME\"

    #this file is to check the data to determine the necessary qc parameters
    fastx_clipper -v -i $FILE -o "$BASENAME.clipped.fastq"

    fastqc $BASENAME.clipped.fastq
done

echo Done.
