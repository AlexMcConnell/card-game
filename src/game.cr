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
      Play.new(self, hand_num, card_str).do
    end
  end
end
