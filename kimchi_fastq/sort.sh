#!/bin/bash

FILE=$1

head -500 $FILE.uproc/$FILE.out | sed 's/,.*//'| sort > $FILE.sort
