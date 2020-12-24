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
      hand = hands[hand_num]
      if current_trick.size > 0
        led_suit = current_trick.first.suit
        return "Must follow suit." if led_suit != card.suit && hand.has_suit?(led_suit)
      end

      found_card = hand.delete(card)
      raise MissingCardError.new unless found_card
      current_trick << found_card
    end
  end
end
