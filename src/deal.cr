module CardGame
  class Deal
    @deck : Deck
    @hands : Hands
    @tricks : Tricks

    getter :hands, :tricks
  
    def initialize
      @deck = Deck.create
      @hands = Hands.create(@deck)
      @tricks = Tricks.create
    end
  end
end
