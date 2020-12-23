require "./spec_helper"

describe "Game#play" do
  context "when the first play of a trick" do
    it "removes the card from the given hand" do
      game = Game.new
      hand = game.hands[0]
      card = hand[0].to_s

      game.play(0, card)

      hand.map(&.to_s).should_not contain card
    end

    it "adds the card to the current trick" do
      game = Game.new
      card = game.hands[0][0].to_s

      game.play(0, card)

      game.current_trick.last.to_s.should eq card
    end
  end
end
