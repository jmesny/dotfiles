#!/bin/bash

sudo rsync -aEL --delete-after /Users/jo/Dropbox /Volumes/Data/jo/

/Library/Backblaze.bzpkg/bztransmit -completesync
