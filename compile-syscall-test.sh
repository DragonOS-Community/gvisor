#!/bin/bash

ROOT=$(pwd)
cd test/syscalls
bazel build --test_tag_filters=native //test/syscalls/...
cd $ROOT