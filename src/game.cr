module CardGame
  class Game
    getter :players

    def initialize
      @deal = Deal.new
      @players = GamePlayers.new
    end

    def add_player(name)
      @players << GamePlayer.new(name) unless full?
    end

    def current_trick
      @deal.current_trick
    end

    def hands
      @deal.hands
    end

    def new_deal
      raise MissingPlayerError.new unless full?
      @deal = Deal.create(@players)
    end

    def play(player, card_str)
      @deal.play(player, card_str)
    end

    private def full?
      @players.size == MAX_PLAYERS
    end
  end
end
