module CardGame
  class Deal
    @deck : Deck
    getter :hands
  
    def initialize
      @hands = Array(Array(Card)).new
      @deck = Deck.create
      deal_hands
    end

    private def deal_hands
      4.times { @hands << Array(Card).new }
      @hands.each { |hand| 13.times { hand << @deck.deal } }
    end
  end
end
