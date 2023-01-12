#!/bin/bash

rm -rf ./build ./package
for f in ./src/*.ts; do
    echo "Compiling $f..."
    npx esbuild --bundle src/my-lambda.ts --target=node16 --format=cjs --external:aws-sdk --outfile="build/index".js
    mkdir -p "./package/src"
    (zip "./package/$f.zip" "./build/index.js")
done
