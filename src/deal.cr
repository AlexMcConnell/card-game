module CardGame
  class Deal
    @deck : Deck
    getter :hands, :tricks
  
    def initialize
      @hands = Array(Array(Card)).new
      @tricks = Array(Array(Card)).new
      @deck = Deck.create

      deal_hands
      new_trick
    end

    private def deal_hands
      NUMBER_OF_HANDS.times { @hands << Array(Card).new }
      @hands.each { |hand| STARTING_HAND_SIZE.times { hand << @deck.deal } }
    end

    private def new_trick
      @tricks << Array(Card).new
    end
  end
end
