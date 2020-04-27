#!/bin/bash
cd $PWD/bin
chmod 755 main.rb
cp main.rb tic-tac-toe
ln -s $PWD/tic-tac-toe /usr/local/bin/
cd -
