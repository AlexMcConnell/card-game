require "./*"

module CardGame
  def self.create
    Game.new
  end

  RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  SUITS = ["C", "D", "H", "S"]
end
