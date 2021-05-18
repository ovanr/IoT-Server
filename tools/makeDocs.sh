#!/bin/zsh

cd `stack path --project-root`

mkdir -p docs/dist

stack exec haddock -- `find src -name '*.hs'` -o docs/dist --html --pretty-html --package-name iot-server --hyperlinked-source

echo "Haddocs HTML docs created at `pwd`/docs/dist"
