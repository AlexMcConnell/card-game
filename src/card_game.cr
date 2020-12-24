require "./*"
require "./exceptions/*"

module CardGame
  def self.create
    Game.new
  end

  RANKS = ["Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King", "Ace"]
  SUITS = ["Clubs", "Diamonds", "Hearts", "Spades"]
  NUMBER_OF_HANDS = 4
  STARTING_HAND_SIZE = 13
end
