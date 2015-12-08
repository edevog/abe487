#!/bin/bash

comm -23 beginning.sort end.sort > beginning.unique

comm -23 end.sort beginning.sort > end.unique
