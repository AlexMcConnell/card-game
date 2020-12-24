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
      card = Card.from_s(card_str)
      found_card = hands[hand_num].delete(card)
      raise MissingCardError.new unless found_card
      current_trick << found_card
    end
  end
end
