require_relative './player.rb'
class Game
  attr_reader :total_match
  def initialize
    @total_match = 0
    @players = []
    @current_round = 0

    display_header
  end

  def start
    add_players
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

  def get_player(index)
    @players[index]
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
end
