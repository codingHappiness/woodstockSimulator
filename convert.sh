#!/bin/bash
rm output.mkv
ffmpeg -i $1 -filter_complex "split [main][edges];
[edges] edgedetect=low=0.3:high=0.4, 
frei0r=distort0r:filter_params=0.001|0.01|0.5|1, 
frei0r=colorize:filter_params=1|1|0, 
colorkey=0x000000[red];
[main][red] overlay " redbase.mkv
ffmpeg -i $1 -vf "
edgedetect=low=0.3:high=0.4, 
frei0r=distort0r:filter_params=0.003|0.01|0.5|1, 
frei0r=colorize:filter_params=0.55|1|0" blueEdges.mkv
ffmpeg -i $1 -vf "
edgedetect=low=0.3:high=0.4, 
frei0r=distort0r:filter_params=0.006|0.01|0.5|1, 
frei0r=colorize:filter_params=0.4|1|0" greenEdges.mkv
ffmpeg -i redbase.mkv -i blueEdges.mkv -filter_complex "
[1:v] colorkey=0x000000:0.4 [output];
[0:v][output] overlay [out]" -map "[out]" blueRedBase.mkv
ffmpeg -i blueRedBase.mkv -i greenEdges.mkv -filter_complex "
[1:v] colorkey=0x000000:0.4 [output];
[0:v][output] overlay [out]" -map "[out]" output.mkv
rm redbase.mkv
rm blueEdges.mkv
rm greenEdges.mkv
rm blueRedBase.mkv
#colorkey=0x000000[blue];
