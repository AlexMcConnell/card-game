module CardGame
  class Deal
    @deck : CardGame::Deck
    getter :hands
  
    def initialize
      @hands = Array(Array(CardGame::Card)).new
      @deck = CardGame::Deck.create
      deal_hands
    end

    private def deal_hands
      4.times { @hands << Array(CardGame::Card).new }
      @hands.each { |hand| 13.times { hand << @deck.deal } }
    end
  end
end
