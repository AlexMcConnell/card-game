require "./card"
require "./deck"

module DeckOfCards
  RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  SUITS = ["C", "D", "H", "S"]

  def self.create
    Deck.new.build.shuffle!
  end
end
