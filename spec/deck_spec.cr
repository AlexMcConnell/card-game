require "./spec_helper"

describe Deck do
  deck_size = (RANKS.size * SUITS.size)

  context ".create" do
    it "returns a deck with 1 card for each rank and suit combination" do
      deck = Deck.create

      possible_cards = RANKS.map do |r|
        SUITS.map { |s| r + s }
      end.flatten

      cards_from_deck = Array(String).new(52) { deck.deal.to_s }

      cards_from_deck.sort.should eq possible_cards.sort
    end

    it "should start shuffled" do
      deck_1 = Deck.create
      cards_from_deck_1 = Array(String).new(52) { deck_1.deal.to_s }

      deck_2 = Deck.create
      cards_from_deck_2 = Array(String).new(52) { deck_2.deal.to_s }

      cards_from_deck_1.should_not eq cards_from_deck_2
    end
  end

  context "#deal" do
    it "returns 1 card" do
      deck = Deck.create
      card = deck.deal

      SUITS.should contain(card.suit)
      RANKS.should contain(card.rank)
    end

    it "reduces the size of the deck by 1" do
      deck = Deck.create
      deck.deal

      deck.size.should eq deck_size - 1
    end
  end
end
