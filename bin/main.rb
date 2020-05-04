#!/usr/bin/env ruby
require_relative '../lib/game.rb'

game = Game.new

game.add_players

continue = true
while continue
  game.start

  puts 'Do you want to play another round (y/n)'
  play = gets.chomp
  continue = play.downcase != 'n'
end
