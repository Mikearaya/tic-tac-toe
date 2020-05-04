class Player
  attr_reader :name
  attr_reader :symbole
  attr_reader :wins

  def initialize(name, symbole)
    @name = name
    @symbole = symbole
    @wins = 0
  end

  def increase_win
    @wins += 1
  end
end
