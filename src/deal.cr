module CardGame
  class Deal
    @deck : Deck
    getter :hands, :tricks
  
    def initialize
      @hands = Hands.new
      @tricks = Tricks.new
      @deck = Deck.create

      deal_hands
      new_trick
    end

    private def deal_hands
      NUMBER_OF_HANDS.times { @hands << Hand.new }
      @hands.each { |hand| STARTING_HAND_SIZE.times { hand << @deck.deal } }
    end

    private def new_trick
      @tricks << Trick.new
    end
  end
end
