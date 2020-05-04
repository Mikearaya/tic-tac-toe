#!/usr/bin/env ruby
require_relative '../lib/tic_tac_toe.rb'
require_relative '../lib/validatable.rb'

puts <<~HEARDOC
  ***************************************
  *                                     *
  *           TIC TAC TOE               *
  *                                     *
  ***************************************
HEARDOC

game = TicTacToe.new

game.add_players

continue = true
while continue
  game.play
  puts 'Game Over \n Do you want to play another round (y/n)'

  loop do
    begin
    play = gets.chomp
    Validatable.exit_choice_valid?(play)
    continue = play.downcase != 'n'
    break
    rescue CustomException => e
      puts e.display_error
  end
  end
end

game.display_statstics
