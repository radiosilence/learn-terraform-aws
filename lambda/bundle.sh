#!/bin/bash

rm -rf ./build
for f in ./src/**/*.ts; do
    name=${f/\.\/src\//}
    name=${name/\.ts/}
    build_dir="./build/$name"
    bundle_file="$build_dir/index.js"
    package_file="$build_dir/package.zip"
    mkdir -p "$build_dir"
    echo "Compiling $name:  $f -> $bundle_file -> $package_file..."
    npx esbuild --bundle "$f" --target=node16 --format=cjs --external:aws-sdk --outfile="$bundle_file"
    (zip "$package_file" "$bundle_file")
done
