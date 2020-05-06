require_relative './validatable.rb'
class Player
  attr_reader :name
  attr_reader :symbol
  attr_reader :wins

  def initialize(name, symbol)
    Validatable.valid_name?(name)
    Validatable.valid_symbol?(symbol)
    @name = name
    @symbol = symbol
    @wins = 0
  end

  def increase_win
    @wins += 1
  end
end
