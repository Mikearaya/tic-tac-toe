require_relative './player.rb'
require_relative './board.rb'
require_relative './custom_exception.rb'
require_relative './validatable.rb'
require 'colorize'
class TicTacToe
  attr_reader :total_match
  def initialize
    @total_match = 0
    @players = []
    @board = Board.new
    @turn = 1
    @used_symbol = {}
  end

  def play
    @total_match += 1
    @board.reset_board
    while @board.total_moves < 10
      @board.draw_board
      change_turn
      loop do
        choice = user_move
        begin
          @board.mark_tile(choice, get_player(@turn).symbole)
          break
        rescue CustomException => e
          puts e.display_error
        end
      end
      next unless @board.won?(get_player(@turn).symbole)

      get_player(@turn).increase_win
      display_winner_message(@turn)
      break
    end
  end

  def add_players(player_name, symbol)
    raise CustomException, 'Can not add more that 2 players' if @players.size > 1

    puts symbol_available?(symbol)
    puts @used_symbol[":#{symbol}"]
    raise CustomException, 'Symbol already used try using another symbol' unless symbol_available?(symbol)

    @used_symbol[":#{symbol}"] = true
    @players << Player.new(player_name, symbol)
  end

  def change_turn
    @turn = @turn == 2 ? 1 : 2
    puts get_player(@turn).name + '\'s Turn'
  end

  private

  def symbol_available?(symbol)
    false if @used_symbol[":#{symbol}"]
    true
  end

  def get_player(index)
    @players[index - 1]
  end

  def validate_move(choice)
    choice.match(/^[1-9]{1}$/)
  end

  def user_move
    choice = 0
    loop do
      begin
        choice = gets.chomp
        raise CustomException, 'Invalid Input, Valid Move should be digit between 1-9' unless validate_move(choice.to_s)

        choice = choice.to_i
        break
      rescue CustomException => e
        puts "#{e.display_error}  \n Try Again"
      rescue StandardError => e
        puts "#{e.message}  \n Try Again"
      end
    end
    choice
  end

  def display_winner_message(winner)
    puts <<-HEARDOC
        ************************************************************
        *                    Congradulation                        *
                      #{get_player(winner).name}  has won
        ************************************************************
    HEARDOC
    display_statstics
  end

  public

  def display_statstics
    puts <<-HEARDOC


    ************************************************************
                        GAME STATISTICS

                        Total Matches #{@total_match}

              #{@players[0].name}    #{@players[1].name}
      Wins    #{@players[0].wins}           #{@players[1].wins}

    ************************************************************
    HEARDOC
  end
end
