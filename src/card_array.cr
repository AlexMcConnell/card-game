module CardGame
  class CardArray < Array(Card)
    def to_json(json : JSON::Builder)
      json.array do
        each { |card| json.string card.to_s }
      end
    end

    def transfer(card_to_match : Card, target : CardArray)
      if card = delete(card_to_match)
        target << card
      else
        raise MissingCardError.new
      end
    end
  end
end
