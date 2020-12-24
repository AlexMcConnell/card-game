module CardGame
  class Hand < Array(Card)
    def has_suit?(suit)
      any? { |card| card.suit == suit }
    end
  end
end