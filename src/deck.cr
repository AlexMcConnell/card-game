module CardGame
  class Deck < CardArray
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
