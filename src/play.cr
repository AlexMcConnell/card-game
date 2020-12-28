module CardGame
  class Play
    @game : Game
    @hand_num : Int32
    @card_str : String

    def initialize(game, hand_num, card_str)
      @game = game
      @hand_num = hand_num
      @card_str = card_str
    end

    def do
      card = Card.from_s(@card_str)
      hand = @game.hands[@hand_num]
      if @game.current_trick.size > 0
        led_suit = @game.current_trick.first.suit
        return "Must follow suit." if led_suit != card.suit && hand.has_suit?(led_suit)
      end

      hand.transfer(card, @game.current_trick)
    end
  end
end
