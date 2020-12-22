require "./spec_helper"

describe Game do
  context ".new" do
    it "has 4 13 card hands" do
      game = Game.new
  
      game.hands.size.should eq 4
      game.hands.each { |hand| hand.size.should eq 13 }
    end
  
    it "deals all cards from 52 card deck to hands" do
      game = Game.new
  
      dealt_cards = game.hands.flatten.map(&.to_s).sort
  
      dealt_cards.should eq sorted_52_cards
    end
  end

  context "#new_deal" do
    it "deals all 13 card hands" do
      game = Game.new
      game.new_deal

      game.hands.each { |hand| hand.size.should eq 13 }
    end

    it "deals all cards from 52 card deck to hands" do
      game = Game.new
      game.new_deal

      all_cards = game.hands.flatten.map(&.to_s).sort

      all_cards.should eq sorted_52_cards
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

def sorted_52_cards
  Deck.create.map { |card| card.to_s }.sort
end
