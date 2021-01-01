module CardGame
  class GamePlayers < Array(GamePlayer)
    def index(player)
      super(player) || raise MissingPlayerError.new
    end
  end
end
