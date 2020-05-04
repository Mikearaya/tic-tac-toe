class Board
  WINING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze

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

  def mark_tile(index, symbole)
    @total_moves += 1
    @tile[index - 1] = symbole
  end

  def won?(symbole)
    return false if @total_moves < 4

    won = false
    WINING_COMBINATIONS.each do |combination|
      unless @tile[combination[0]] == symbole && @tile[combination[1]] == symbole && @tile[combination[2]] == symbole
        next
      end

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
