#!/usr/bin/env ruby
# !/usr/bin/env ruby
puts 'Welcome To Tic Tac Toe Game'

def draw_board(tile)
  "\n-----------------------------------------\n\n" \
  "#{tile[0]} | #{tile[1]} | #{tile[2]}\n" \
  "#{tile[3]} | #{tile[4]} | #{tile[5]}\n" \
  "#{tile[6]} | #{tile[7]} | #{tile[8]}\n" \
  "\n-----------------------------------------\n\n"
end

def won?(symbole, tile)
  winning_combination = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]
  won = false
  winning_combination.each do |row|
    won = true if tile[row[0]] == symbole && tile[row[1]] == symbole && tile[row[2]] == symbole
  end

  won
end

player = {
  '1': nil,
  '2': nil
}

symboleee = {
  '1': 'x',
  '2': 'O'
}

symboleee[':1'] = 'x'
symboleee[':2'] = 'O'
puts 'Player 1 Name'

player[':1'] = gets.chomp
puts 'Player 2 Name'
player[':2'] = gets.chomp

continue = true
turn = 1
# rubocop: disable Metrics/BlockNesting
while continue
  round = 0
  tile = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  current_symbole = ''
  while round < 9
    puts 'Round ' + round.to_s
    puts draw_board(tile)
    turn = turn == 1 ? 2 : 1
    puts player[":#{turn}"] + '\'s Turn'

    choice = false
    until choice
      choice = gets.chomp
      valid = choice.match(/[1-9]/)
      choice = valid ? choice.to_i : false
      puts 'invalid input \n valid input is a number between 1 and 9' unless choice
    end
    current_symbole = turn == 1 ? symboleee[':1'] : symboleee[':2']
    tile[choice - 1] = current_symbole
    round += 1

    next unless round > 4 && won?(current_symbole, tile)

    winner = player[":#{turn}"]
    puts '************************************************************'
    puts '* Congradulation *'
    puts " #{winner}  has won"
    puts '************************************************************'
    break

    # validate input,
    # check if move acceptable
    # check if game is complete

  end
  # rubocop: enable Metrics/BlockNesting

  puts 'Do you want to play another round (y/n)'
  play = gets.chomp
  continue = play.downcase != 'n'
end
