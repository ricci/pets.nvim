#!/bin/bash

for color_dir in bak/*
do
    dirname="${color_dir##*/}"
    cp $color_dir/*12* cat/$dirname/
done
