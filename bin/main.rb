#!/usr/bin/env ruby
require_relative '../lib/game.rb'
require_relative '../lib/validatable.rb'
game = Game.new

game.add_players

continue = true
while continue
  game.play
  puts 'Do you want to play another round (y/n)'
  valid = false
  until valid
    begin
    play = gets.chomp
    valid = Validator.exit_choice_valid(play)
    continue = play.downcase != 'n'
    rescue CustomException => e
      puts e.display_error
  end
  end
end
