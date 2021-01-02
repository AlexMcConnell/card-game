module CardGame
  class Hand < CardArray
    def has_suit?(suit)
      any? { |card| card.suit == suit }
    end
  end
end
