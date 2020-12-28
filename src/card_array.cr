module CardGame
  class CardArray < Array(Card)
    def transfer(card_to_match : Card, target : CardArray)
      if card = delete(card_to_match)
        target << card
      else
        raise MissingCardError.new
      end
    end
  end
end
