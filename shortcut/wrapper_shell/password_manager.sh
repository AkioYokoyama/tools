#!/bin/bash
option=$1

cd $HOME/tools/shortcut/rust_command/command_password_manager/

if [ $option == "-l" ]; then
    ./target/release/command_password_manager list
elif [ $option == "-a"  ]; then
    ./target/release/command_password_manager add ${@:2}
elif [ $option == "-c"  ]; then
    ./target/release/command_password_manager ${@:2}
elif [ $option == "-d"  ]; then
    ./target/release/command_password_manager ${@:2}
elif [ $option == "-f"  ]; then
    ./target/release/command_password_manager flush
else
    ./target/release/command_password_manager brow ${@:1}
fi

cd - 1> /dev/null
