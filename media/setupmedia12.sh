#!/bin/bash

for color_dir in cat/*
do
    cd $color_dir
    # remove the cat and fps specifications
    perl-rename 's/cat\d+_//' *
    perl-rename 's/_\d*fps//' *
    for file in *.gif
    do
        dirname="${file%.*}"
        dirname="${dirname##*/}"
        dirname="${dirname}12"
        mkdir $dirname
        mv $file $dirname
        cd $dirname
        gifsicle --explode *.gif
        rm *.gif
        convert -coalesce -filter Point -resize 400% *00* %d.png
        rm *gif*
        cd ..
    done
    cd ../..
done
