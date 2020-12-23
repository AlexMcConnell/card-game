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
      4.times { @hands << Array(Card).new }
      @hands.each { |hand| 13.times { hand << @deck.deal } }
    end

    private def new_trick
      @tricks << Array(Card).new
    end
  end
end
