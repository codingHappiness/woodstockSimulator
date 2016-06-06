#!/bin/bash
#chromakey seems to be capturing the white too. Perhaps too thin?
rm output.mkv
ffmpeg -i $1 -filter_complex "split [main][edges];
[edges] edgedetect=low=0.3:high=0.4, 
split=3[red][blue]; 
[red] frei0r=distort0r:filter_params=0.05|0.01|0.5|1, 
frei0r=colorize:filter_params=1|1|0, 
colorkey=0x000000[red];
[blue] frei0r=distort0r:filter_params=0.06|0.01|0.5|1, 
frei0r=colorize:filter_params=0.55|1|0, 
colorkey=0x000000[blue];
[main][red] overlay [redmix];
[redmix][blue] overlay" output.mkv
#[edges] chromakey=0x000000:1 [out];
#[blue] frei0r=colorize:filter_params=0.55|1|0 [blue];
#split [main] [blue][green];
