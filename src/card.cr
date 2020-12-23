module CardGame
  class Card
    getter :rank, :suit

    def initialize(rank : String, suit : String)
      @rank = rank
      @suit = suit
    end

    def self.from_s(card_str)
      rank, suit = card_str.split(" of ")
      Card.new(rank, suit)
    end

    def ==(other)
      other.to_s == to_s
    end

    def to_s
      @rank + " of " + @suit
    end
  end
end
