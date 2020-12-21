require "./spec_helper"

describe CardGame do
  context ".create" do
    it "returns a new Game" do
      game = CardGame.create
      typeof(game).should eq CardGame::Game
    end
  end
end
