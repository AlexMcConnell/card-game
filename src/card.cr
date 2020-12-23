module CardGame
  class Card
    getter :rank, :suit

    def initialize(rank : String, suit : String)
      @rank = rank
      @suit = suit
    end

    def to_s
      @rank + " of " + @suit
    end
  end
end
