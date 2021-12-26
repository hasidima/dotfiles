#!/bin/bash
d="$(date +"%Y%m%d%H%M%S")"
mkdir "$d"
cd "$d"
vim readme.md
