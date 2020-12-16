module DeckOfCards
  class Card
    getter :rank, :suit

    def initialize(rank : String, suit : String)
      @rank = rank
      @suit = suit
    end

    def to_s
      @rank + @suit
    end
  end
end
