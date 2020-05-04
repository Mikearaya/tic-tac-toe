require_relative './player.rb'
require_relative './board.rb'
require_relative './custom_exception.rb'
class Game
  attr_reader :total_match
  def initialize
    @total_match = 0
    @players = []
    @board = Board.new
    @turn = 1
    display_header
  end

  def start
    @board.reset_board
    while @board.total_moves < 9
      @board.draw_board
      change_turn
      valid = false
      choice = user_move
      until valid
        begin
          @board.mark_tile(choice, get_player(@turn).symbole)
          valid = true
        rescue CustomException => e
          puts "#{e.message} \n Try again"
        end
      end
      next unless @board.won?(get_player(@turn).symbole)

      get_player(@turn).increase_win
      display_winner_message(@turn)
      break
    end
  end

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

  private

  def change_turn
    @turn = @turn == 2 ? 1 : 2
    puts get_player(@turn).name + '\'s Turn'
  end

  def get_player(index)
    @players[index - 1]
  end

  def validate_move(choice)
    choice.match(/^[1-9]{1}$/)
  end

  def user_move
    valid = false
    choice = 0
    until valid
      begin
        choice = gets.chomp
        raise CustomException, 'Invalid Input, Valid Move should be digit between 1-9' unless validate_move(choice.to_s)

        valid = true
        choice = choice.to_i
      rescue CustomException => e
        puts "#{e.message}  \n Try Again"
      rescue StandardError => e
        puts "#{e.message}  \n Try Again"
      end
    end
    choice
  end

  def display_header
    puts <<~HEARDOC
      \e[31m***************************************
      *                                     *
      *           TIC TAC TOE               *
      *                                     *
      *************************************** \e[0m
    HEARDOC
  end

  def display_winner_message(winner)
    puts <<-HEARDOC
    ************************************************************
    *                    Congradulation                        *
    *          #{get_player(winner).name}  has won             *
    ************************************************************
    HEARDOC
  end
end
