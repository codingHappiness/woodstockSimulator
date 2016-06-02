#!/bin/bash

ffmpeg -i $1 -vf "split [main][edges]; 
[edges] edgedetect=low=0.3:high=0.4, 
frei0r=distort0r:filter_params=0.05:0.01:0.5:1,
chromakey=0x000000 [out];
[main][out] overlay" output.mkv
