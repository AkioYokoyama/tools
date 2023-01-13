#!/bin/bash
option=$1

cd $HOME/Public/workspace/Rust/open_browser

if [ $option == "-l" ]; then
    ./target/release/open_browser list
elif [ $option == "-a"  ]; then
    ./target/release/open_browser add ${@:2}
elif [ $option == "-d"  ]; then
    ./target/release/open_browser delete ${@:2}
elif [ $option == "-b"  ]; then
    ./target/release/open_browser brow ${@:2}
elif [ $option == "-f"  ]; then
    ./target/release/open_browser freq
else
    ./target/release/open_browser brow ${@:1}
fi

cd - 1> /dev/null
