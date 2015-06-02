#!/bin/sh
# `build ... -f` requires docker >= 1.5.x

image_base_name="quay.io/getpantheon/fedora-test-kitchen"

for i in 19 20 22; do
    full_image_name="${image_base_name}:${i}"

    echo "==> Building $dockerfile ($full_image_name)"
    docker build -t "$full_image_name" "./$i"
    docker push "$full_image_name"
done
