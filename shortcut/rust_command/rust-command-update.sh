#!/bin/bash
cd $HOME/tools/shortcut/rust_command/note
git pull origin master
cargo build --release

cd $HOME/tools/shortcut/rust_command/open_browser
git pull origin master
cargo build --release

cd $HOME/tools/shortcut/rust_command/command_password_manager
git pull origin master
cargo build --release

