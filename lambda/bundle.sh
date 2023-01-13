#!/bin/bash

clean() {
    rm -rf ./build
}

bundle() {
    name=${1/\.\/src\/handlers\//}
    name=${name/\.ts/}
    build_dir="./build/$name"
    bundle_file="$build_dir/index.mjs"
    package_file="$build_dir/package.zip"
    mkdir -p "$build_dir"
    echo "Compiling $name:  $1 -> $bundle_file -> $package_file..."
    # esbuild is the recommended way to bundle JS now and is fast/awesome
    yarn esbuild \
        --bundle "$f" \
        --target=node18 \
        --format=esm \
        --external:"@aws-sdk/*" \
        --outfile="$bundle_file"
    # We set the date to a fixed date so that the zip file is always the same if contents are same
    find "$build_dir" -exec touch -t 198909022153 {} +
    (zip -jX "$package_file" "$bundle_file")
}

bundle_all() {
    for f in ./src/handlers/**/*.ts; do
        bundle "$f"
    done
}
clean
bundle_all
