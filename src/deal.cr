module CardGame
  class Deal
    @deck : Deck
    @hands : Hands
    @tricks : Tricks

    getter :hands, :tricks
  
    def initialize
      @deck = Deck.new
      @hands = Hands.new
      @tricks = Tricks.create
    end

    def self.create
      Deal.new.deal
    end

    def current_trick
      @tricks.last
    end

    def deal
      @deck = Deck.create
      @hands = Hands.create(@deck)
      @tricks = Tricks.create
      self
    end

    def play(hand_num, card_str)
      response = Play.new(self, hand_num, card_str).do
      tricks << Trick.new if current_trick.size == 4
      response
    end
  end
end
