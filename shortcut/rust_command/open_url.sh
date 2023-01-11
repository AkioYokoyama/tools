#!/bin/bash
option=$1

cd $HOME/Public/workspace/Rust/open_browser

if [ $option == "-l" ]; then
    cargo run --release -q -- list
elif [ $option == "-a"  ]; then
    cargo run --release -q -- add ${@:2}
elif [ $option == "-d"  ]; then
    cargo run --release -q -- delete ${@:2}
elif [ $option == "-b"  ]; then
    cargo run --release -q -- brow ${@:2}
elif [ $option == "-f"  ]; then
    cargo run --release -q -- freq
else
    cargo run --release -q -- brow ${@:1}
fi

cd - 1> /dev/null
