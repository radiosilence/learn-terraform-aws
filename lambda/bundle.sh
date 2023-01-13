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
    yarn esbuild \
        --bundle "$f" \
        --target=node18 \
        --format=esm \
        --external:"@aws-sdk/*" \
        --outfile="$bundle_file"
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
