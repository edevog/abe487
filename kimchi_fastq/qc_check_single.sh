#!/bin/bash

if [[ $# -ne 1 ]]; then
  printf "Usage: %s FILE\n" $(basename $0)
  exit
fi

FILE=$1

if [[ ! -e $FILE ]]; then
  echo FILE \"$FILE\" does not exist.
  exit
fi

echo Processing \"$FILE\"

BASENAME=$(basename $FILE '.fastq')

#echo FILE \"$FILE\" BASENAME \"$BASENAME\"

#this file is to check the data to determine the necessary qc parameters
module load fastqc
module load fastx

fastx_clipper -v -i $FILE -o "$BASENAME.clipped.fastq"

fastqc $BASENAME.clipped.fastq

echo OK
