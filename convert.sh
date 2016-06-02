#!/bin/bash

ffmpeg -i $1 -vf "split [main][edges]; [edges] edgedetect=low=0.1:high=0.4, chromakey=black, frei0r=distort0r:filter_params=0.05:0.01 [out]; [out][main] blend=all_opacity=0.5" output.mkv
