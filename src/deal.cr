module CardGame
  class Deal
    @deck : Deck
    @hands : Hands
    getter :hands, :tricks
  
    def initialize
      @tricks = Tricks.new
      @deck = Deck.create
      @hands = Hands.create(@deck)

      new_trick
    end

    private def new_trick
      @tricks << Trick.new
    end
  end
end
