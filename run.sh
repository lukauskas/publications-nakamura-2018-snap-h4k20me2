#!/bin/bash
# Uncomment the line below and comment out the one after if you want to build the image locally
# docker build . -t lukauskas/publications-nakamura-2018-snap-h4k20me2
docker pull lukauskas/publications-nakamura-2018-snap-h4k20me2
docker run --rm -it -p 8888:8888 -v $(pwd)/notebooks:/notebooks -v $(pwd)/data:/data -v $(pwd)/output:/output lukauskas/publications-nakamura-2018-snap-h4k20me2
