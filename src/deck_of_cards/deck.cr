module DeckOfCards
  class Deck < Array(Card)
    def build
      RANKS.product(SUITS).each { |r, s| push Card.new(r, s) }
      self
    end

    def deal
      pop
    end
  end
end
