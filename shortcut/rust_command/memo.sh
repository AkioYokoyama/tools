#!/bin/bash
option=$1

cd $HOME/Public/workspace/Rust/note

cargo run --release -q -- memo ${@:1}

cd - 1> /dev/null
