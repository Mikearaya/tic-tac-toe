class Board
  WINING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze
  attr_reader :total_moves
  def initialize
    reset_board
    @total_moves = 0
  end

  def draw_board()
    puts <<-HEREDOC

      #{@tile[0]} | #{@tile[1]} | #{@tile[2]}
      -   -   -
      #{@tile[3]} | #{@tile[4]} | #{@tile[5]}
      -   -   -
      #{@tile[6]} | #{@tile[7]} | #{@tile[8]}

    HEREDOC
  end

  def mark_tile(index, symbol)
    @total_moves += 1
    raise CustomException, 'Tile already marked pick another tile and try again' if @tile[index - 1].is_a?(String)

    @tile[index - 1] = symbol
  end

  def won?(symbol)
    return false if @total_moves < 4

    won = false
    WINING_COMBINATIONS.each do |combination|
      next unless @tile[combination[0]] == symbol && @tile[combination[1]] == symbol && @tile[combination[2]] == symbol

      won = true
      break
    end
    won
  end

  def reset_board
    @total_moves = 0
    @tile = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
