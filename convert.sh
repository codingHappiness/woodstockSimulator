#!/bin/bash

ffmpeg -i $1 -vf "split [main][edges]; [edges] edgedetect=low=0.1:high=0.4[out]; [main][out] blend=all_mode=lighten:all_opacity=0.9" output.mkv
