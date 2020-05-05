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
    @draw = false
  end

  def play
    @total_match += 1
    @draw = false
    @board.reset_board
  end

  def draw?
    @draw
  end

  def display_board
    @board.draw_board
  end

  def add_players(player_name, symbol)
    raise CustomException, 'Can not add more that 2 players' if @players.size > 1
    raise CustomException, 'Symbol already used try using another symbol' unless symbol_available?(symbol)

    @players << Player.new(player_name, symbol)
    @used_symbol[":#{symbol}"] = true
  end

  def change_turn
    @turn = @turn == 2 ? 1 : 2
    get_player(@turn).name + '\'s Turn'
  end

  def ended?()
    @draw = @board.total_moves > 8
  end

  def make_move(tile)
    raise CustomException, 'Invalid Input, Valid Move should be digit between 1-9' unless validate_move(tile)

    tile = tile.to_i
    @board.mark_tile(tile, get_player(@turn).symbol)
  end

  def player_won?
    if @board.won?(get_player(@turn).symbol)
      get_player(@turn).increase_win
      return true
    end
    false
  end

  def display_winner_message
    puts <<-HEARDOC

    ************************************************************
    *                    Congradulation                        *
                      #{get_player(@turn).name}  has won

    HEARDOC
    display_statstics
  end

  def display_statstics
    <<-HEARDOC


    ************************************************************
                        GAME STATISTICS

                        Total Matches #{@total_match}

              #{@players[0].name}    #{@players[1].name}
      Wins    #{@players[0].wins}           #{@players[1].wins}

    HEARDOC
  end

  private

  def symbol_available?(symbol)
    return false if @used_symbol[":#{symbol}"]

    true
  end

  def get_player(index)
    @players[index - 1]
  end

  def validate_move(choice)
    choice.match(/^[1-9]{1}$/)
  end
end
