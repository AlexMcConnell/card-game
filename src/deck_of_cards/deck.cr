require "./card"

module DeckOfCards
  class Deck < Array(Card)
    RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    SUITS = ["C", "D", "H", "S"]

    def self.create
      Deck.new.build.shuffle!
    end

    def build
      RANKS.product(SUITS).each { |r, s| push Card.new(r, s) }
      self
    end

    def deal
      pop
    end
  end
end
