require "./spec_helper"

describe Game do
  context ".new" do
    it "has no hands" do
      game = Game.new
  
      game.hands.should eq [] of Card
    end
  end

  context "#add_player" do
    it "adds a new player to the game" do
      game = Game.new
      p1_name = "Steve"

      game.add_player(p1_name)

      game.players.size.should eq 1
      game.players.first.name.should eq p1_name
    end

    context "when game is full" do
      it "should not add player" do
        game = Game.new

        MAX_PLAYERS.times { game.add_player("Steve")}

        game.players.size.should eq 4

        game.add_player("Tony")
        game.players.size.should eq 4
      end
    end
  end

  context "#new_deal" do
    context "when game not full" do
      it "raises MissingPlayerError" do
        game = Game.new

        expect_raises(MissingPlayerError) do
          game.new_deal
        end
      end
    end

    context "when game full" do
      it "deals all STARTING_HAND_SIZE card hands" do
        game = game_with_players

        game.hands.each { |hand| hand.size.should eq STARTING_HAND_SIZE }
      end

      it "deals all cards from deck to hands" do
        game = game_with_players

        all_cards = game.hands.flatten.map(&.to_s).sort

        all_cards.should eq sorted_deck
      end

      it "replaces the existing hands" do
        game = game_with_players

        original_hands = game.hands.flatten.map(&.to_s)

        game.new_deal

        new_hands = game.hands.flatten.map(&.to_s)
        original_hands.should_not eq new_hands
      end

      it "starts with an empty current_trick" do
        game = game_with_players

        game.current_trick.size.should eq 0
      end
    end
  end

  context "#to_json(player)" do
    player_number = 2

    it "returns the player's hand as json" do
      game = game_with_players
      player = game.players[player_number]

      json_data = game.to_json(player)

      parsed = JSON.parse(json_data)

      parsed["hands"][2].should eq game.player_hand(player).map(&.to_s)
    end

    it "returns other players' hands as empty strings" do
      game = game_with_players
      player = game.players[player_number]

      json_data = game.to_json(player)

      parsed = JSON.parse(json_data)

      parsed["hands"][0].should eq game.hands[0].map { "" }
      parsed["hands"][1].should eq game.hands[1].map { "" }
      parsed["hands"][3].should eq game.hands[3].map { "" }
    end

    it "returns the current player's player number" do
      game = game_with_players
      player = game.players[player_number]

      json_data = game.to_json(player)

      parsed = JSON.parse(json_data)

      parsed["player_number"].should eq player_number
    end

    it "returns the current deal's tricks" do
      game = game_with_players
      player = game.players[player_number]

      json_data = game.to_json(player)

      parsed = JSON.parse(json_data)

      parsed["tricks"].should eq game.tricks
    end
  end
end

def sorted_deck
  Deck.create.map { |card| card.to_s }.sort
end
