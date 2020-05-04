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
    @used_symbole = {}
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

  def add_players
    print 'First player name: '.blue
    first_player_name = gets.chomp
    print ' Symbole: '.blue
    symbole = read_symbole
    @players << Player.new(first_player_name, symbole)
    print 'Second player name: '.blue
    second_player_name = gets.chomp
    print ' Symbole: '.blue
    symbole = read_symbole
    @players << Player.new(second_player_name, symbole)
  end

  private

  def read_symbole
    symbole = ''
    loop do
      begin
        symbole = gets.chomp

        Validatable.valid_symbole?(symbole)
        if @used_symbole[":#{symbole}"]
          puts 'symbole already used, try different'
          next
        end
        @used_symbole[":#{symbole}"] = true
        break
      rescue CustomException => e
        puts e.display_error
      rescue StandardError => e
        puts e.message
      end
    end
    symbole
  end

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
