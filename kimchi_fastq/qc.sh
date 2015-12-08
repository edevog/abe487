#!/bin/bash

if [[ $# -ne 3 ]]; then
  printf "Usage: %s FILE TRIM_LEN CLIP_LEN\n" $(basename $0)
  exit
fi

FILE=$1

TRIM_LEN=$2

CLIP_LEN=$3

if [[ ! -e $FILE ]]; then
  echo FILE \"$FILE\" does not exist.
  exit
fi

echo Processing \"$FILE\"

BASENAME=${FILE%%.*}
    echo BASENAME \"$BASENAME\"

module load fastqc
module load fastx

fastq_quality_filter -q 15 -p 80 -i $FILE -o $BASENAME.clipped.qfil.fastq -Q33

fastx_trimmer -v -l $TRIM_LEN -i $BASENAME.clipped.qfil.fastq -o $BASENAME.clipped.qfil.trim.fastq -Q33

fastx_clipper -v -l $CLIP_LEN -i $BASENAME.clipped.qfil.trim.fastq -o $BASENAME.clipped.qfil.trim.len.fastq -Q33 

fastqc $BASENAME.clipped.qfil.trim.len.fastq
