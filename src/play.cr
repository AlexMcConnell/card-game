module CardGame
  class Play
    @card : Card
    @hand : Hand
    @trick : Trick

    def initialize(game, hand_num, card_str)
      @card = Card.from_s(card_str)
      @hand = game.hands[hand_num]
      @trick = game.current_trick
    end

    def do
      return "Must follow suit." unless suit_valid?

      @hand.transfer(@card, @trick)
    end

    private def suit_valid?
      return true if @trick.size == 0
      suit = @trick.first.suit
      suit == @card.suit || !@hand.has_suit?(suit)
    end
  end
end
