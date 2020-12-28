module CardGame
  class Game
    def initialize
      @deal = Deal.new
    end

    def current_trick
      @deal.tricks.last
    end

    def hands
      @deal.hands
    end

    def new_deal
      @deal = Deal.new
    end

    def play(hand_num, card_str)
      response = Play.new(self, hand_num, card_str).do
      @deal.tricks << Trick.new if current_trick.size == 4
      response
    end
  end
end
