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
player_name = ''
player_symbole = ''
loop do
  begin
    print 'First player name: '.white
    player_name = gets.chomp
    print ' Symbole: '.white
    player_symbole = gets.chomp

    game.add_players(player_name, player_symbole)
    break
  rescue CustomException => e
    puts e.display_error
  end
end
loop do
  begin
    print 'Second player name: '
    player_name = gets.chomp
    print ' Symbole: '
    player_symbole = gets.chomp

    game.add_players(player_name, player_symbole)
    break
  rescue CustomException => e
    puts e.display_error
  end
end

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
