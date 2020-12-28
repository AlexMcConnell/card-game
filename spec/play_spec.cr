require "./spec_helper"

describe "Game#play" do
  context "when card not in hand" do
    it "raises MissingCardError" do
      game = Game.new
      expect_raises(MissingCardError) do
        game.play(0, "King of Queens")
      end
    end
  end

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

  context "when not first play of a trick" do
    context "when spades are led and has a spade" do
      it "cannot play a club" do
        game = Game.new
        led_card = Card.new("Two", "Spades")
        game.current_trick << led_card
        game.hands[0] = hand_of_aces

        played_card = Card.new("Ace", "Clubs")
        result = game.play(0, played_card.to_s)

        game.current_trick.should_not contain  played_card
        result.should eq "Must follow suit."
      end

      it "cannot play a diamond" do
        game = Game.new
        led_card = Card.new("Two", "Spades")
        game.current_trick << led_card
        game.hands[0] = hand_of_aces

        played_card = Card.new("Ace", "Diamond")
        result = game.play(0, played_card.to_s)

        game.current_trick.should_not contain  played_card
        result.should eq "Must follow suit."
      end

      it "cannot play a heart" do
        game = Game.new
        led_card = Card.new("Two", "Spades")
        game.current_trick << led_card
        game.hands[0] = hand_of_aces

        played_card = Card.new("Ace", "Heart")
        result = game.play(0, played_card.to_s)

        game.current_trick.should_not contain  played_card
        result.should eq "Must follow suit."
      end

      it "can play a spade" do
        game = Game.new
        led_card = Card.new("Two", "Spades")
        game.current_trick << led_card
        game.hands[0] = hand_of_aces

        played_card = Card.new("Ace", "Spades")
        result = game.play(0, played_card.to_s)

        game.current_trick.should contain  played_card
      end
    end
  end
end

context "when last play of a trick" do
  it "starts the next trick" do
    game = Game.new
    game.current_trick << Card.new("Two", "Spades")
    game.current_trick << Card.new("Three", "Spades")
    game.current_trick << Card.new("Four", "Spades")
    game.hands[0] = hand_of_aces

    played_card = Card.new("Ace", "Spades")
    result = game.play(0, played_card.to_s)

    game.current_trick.size.should eq 0
  end
end

def hand_of_aces
  hand = Hand.new
  hand << Card.new("Ace", "Clubs")
  hand << Card.new("Ace", "Diamonds")
  hand << Card.new("Ace", "Hearts")
  hand << Card.new("Ace", "Spades")
  hand
end
