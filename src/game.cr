module CardGame
  class Game
    @deal : Deal

    getter :players

    forward_missing_to @deal

    def initialize
      @deal = Deal.new
      @players = GamePlayers.new
    end

    def add_player(name)
      @players << GamePlayer.new(name) unless full?
    end

    def new_deal
      raise MissingPlayerError.new unless full?
      @deal = Deal.create(@players)
    end

    def to_json(player)
      p_hand = player_hand(player)
      json_hands = hands.map do |hand|
        hand == p_hand ? hand : hand.map { "" }
      end
      {
        hands: json_hands,
        player_number: hands.index(p_hand),
        tricks: tricks
      }.to_json
    end

    def full?
      @players.size == MAX_PLAYERS
    end
  end
end
