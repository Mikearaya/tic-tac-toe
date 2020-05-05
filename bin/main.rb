#!/usr/bin/env ruby
require_relative '../lib/tic_tac_toe.rb'
require_relative '../lib/validatable.rb'
require 'colorize'

puts <<~HEARDOC
  ***************************************
  *                                     *
  *           TIC TAC TOE               *
  *                                     *
  ***************************************
HEARDOC

game = TicTacToe.new
player_name = ''
player_symbol = ''
loop do
  begin
    print 'First player name: '.white
    player_name = gets.chomp
    print ' Symbol: '.white
    player_symbol = gets.chomp

    game.add_players(player_name, player_symbol)
    break
  rescue CustomException => e
    puts e.display_error
  end
end
loop do
  begin
    print 'Second player name: '
    player_name = gets.chomp
    print ' Symbol: '
    player_symbol = gets.chomp

    game.add_players(player_name, player_symbol)
    break
  rescue CustomException => e
    puts e.display_error
  end
end

continue = true
while continue
  game.play
  until game.ended?
    puts game.display_board
    puts game.change_turn.yellow

    loop do
      begin
        choice = gets.chomp
        game.make_move(choice)
        break
      rescue CustomException => e
        puts e.display_error
      end
    end
    next unless game.player_won?

    puts game.display_board.green
    puts game.display_winner_message.green
    break
  end

  if game.draw?
    puts <<-HEARDOC
    ******************************************************
    *            IT SEEMS TO BE A DRAW :-)               *
    ******************************************************
    HEARDOC
  end

  puts "Game Over \n Do you want to play another round (y/n)".yellow

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
