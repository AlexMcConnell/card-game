module CardGame
  class Trick < CardArray
    def follows_suit?(card)
      empty? || suit == card.suit
    end

    def suit
      first.suit
    end
  end
end