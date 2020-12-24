require "./spec_helper"

describe Game do
  context ".new" do
    it "has NUMBER_OF_HANDS hands with STARTING_HAND_SIZE cards each" do
      game = Game.new
  
      game.hands.size.should eq NUMBER_OF_HANDS
      game.hands.each { |hand| hand.size.should eq STARTING_HAND_SIZE }
    end
  
    it "deals all cards from deck to hands" do
      game = Game.new
  
      dealt_cards = game.hands.flatten.map(&.to_s).sort
  
      dealt_cards.should eq sorted_deck
    end

    it "starts with an empty current_trick" do
      game = Game.new

      game.current_trick.size.should eq 0
    end
  end

  context "#new_deal" do
    it "deals all STARTING_HAND_SIZE card hands" do
      game = Game.new
      game.new_deal

      game.hands.each { |hand| hand.size.should eq STARTING_HAND_SIZE }
    end

    it "deals all cards from deck to hands" do
      game = Game.new
      game.new_deal

      all_cards = game.hands.flatten.map(&.to_s).sort

      all_cards.should eq sorted_deck
    end

    it "replaces the existing hands" do
      game = Game.new
      original_hands = game.hands.flatten.map(&.to_s)

      game.new_deal

      new_hands = game.hands.flatten.map(&.to_s)
      original_hands.should_not eq new_hands
    end
  end
end

def sorted_deck
  Deck.create.map { |card| card.to_s }.sort
end
