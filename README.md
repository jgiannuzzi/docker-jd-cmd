# Docker image for [jd-cmd](https://github.com/kwart/jd-cmd)

Based on [Alpine Linux](http://alpinelinux.org/).

## Description

jd-cmd is a command line Java Decompiler which uses [JD Core from Java Decompiler](http://jd.benow.ca/) project. 

## Usage

	docker run --rm -ti -v $PWD:/data -w /data jgiannuzzi/jd-cmd [options] [Files to decompile]
