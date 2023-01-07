#!/bin/bash
option=$1

cd $HOME/Public/workspace/Rust/command_password_manager

if [ $option == "-l" ]; then
    cargo run --release -q -- list
elif [ $option == "-a"  ]; then
    cargo run --release -q -- add ${@:2}
elif [ $option == "-c"  ]; then
    cargo run --release -q -- copy ${@:2}
elif [ $option == "-d"  ]; then
    cargo run --release -q -- delete ${@:2}
elif [ $option == "-f"  ]; then
    cargo run --release -q -- flush
else
    cargo run --release -q -- brow ${@:1}
fi

cd - 1> /dev/null
