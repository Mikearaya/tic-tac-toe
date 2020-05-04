require_relative './player.rb'
require_relative './board.rb'
class Game
  attr_reader :total_match
  def initialize
    @total_match = 0
    @players = []
    @current_round = 0
    @board = Board.new
    display_header
  end

  def start
    add_players
    continue = true
    while continue
      turn = 1
      while round < 9
        @board.draw_board
        turn = turn == 2 ? 1 : 2
        puts get_player(turn).name + '\'s Turn'
        choice = user_move
        @board.mark_tile(choice, get_player(turn).symbole)
        update_round

        next unless @board.won?(get_player(turn).symbole)

        display_winner_message(turn)
        break
      end
      puts 'Do you want to play another round (y/n)'
      play = gets.chomp
      continue = play.downcase != 'n'
      @board.reset_board
    end
  end

  private

  def add_players
    print 'First player name: '
    first_player_name = gets.chomp
    print ' Symbole: '
    first_player_symbole = gets.chomp

    @players << Player.new(first_player_name, first_player_symbole)
    print 'Second player name: '
    second_player_name = gets.chomp
    print ' Symbole: '
    second_player_symbole = gets.chomp
    @players << Player.new(second_player_name, second_player_symbole)
  end

  def update_round
    @current_round += 1
  end

  def get_player(index)
    @players[index - 1]
  end

  def validate_move(choice)
    choice.match(/[1-9]/)
  end

  def user_move
    choice = false
    unless choice
      choice = gets.chomp
      choice = validate_move(choice) ? choice.to_i : false
      puts 'invalid input \n valid input is a number between 1 and 9' unless choice
    end
    choice
  end

  def display_header
    <<~HEARDOC
      ***************************************
      *                                     *
      *           TIC TAC TOE               *
      *                                     *
      ***************************************
    HEARDOC
  end

  def display_winner_message(winner)
    <<-HEARDOC
    ************************************************************
    *                    Congradulation                        *
    *          #{get_player(winner).name}  has won             *
    ************************************************************
    HEARDOC
  end
end
