class Player
  attr_reader :name
  attr_reader :symbole
  attr_reader :wins

  def initialize(name, symbole)
    @name = name
    @symbole = symbole
  end

  def increase_win
    @wins += 1
  end
end
