class Board
  def initialize
    @winning_combination = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
    reset_board
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
    @tile[index - 1] = symbole
  end

  def won?(symbole)
    won = false
    @winning_combination.each do |combination|
      unless @tile[combination[0]] == symbole && @tile[combination[1]] == symbole && @tile[combination[2]] == symbole
        next
      end

      won = true
      break
    end
  end

  def reset_board
    @tile = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
end
