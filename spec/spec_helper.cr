require "spec"
require "../src/*"
require "../src/exceptions/*"

include CardGame

def game_with_players
  game = Game.new
  game.add_player("Steve")
  game.add_player("Tony")
  game.add_player("Bruce")
  game.add_player("Clint")
  game.new_deal
  game
end
