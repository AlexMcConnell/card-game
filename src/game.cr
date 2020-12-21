module CardGame
  class Game
    def initialize
      @deal = Deal.new
    end

    def new_deal
      @deal = Deal.new
    end

    def hands
      @deal.hands
    end
  end
end
