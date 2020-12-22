module CardGame
  class Deal
    @deck : DeckOfCards::Deck
    getter :hands
  
    def initialize
      @hands = Array(Array(DeckOfCards::Card)).new
      @deck = DeckOfCards::Deck.create
      deal_hands
    end

    private def deal_hands
      4.times { @hands << Array(DeckOfCards::Card).new }
      @hands.each { |hand| 13.times { hand << @deck.deal } }
    end
  end
end
