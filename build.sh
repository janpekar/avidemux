#!/bin/bash
#nocache="--no-cache"
#params=$nocache
docker build . ${params:-} -t avidemux:latest
