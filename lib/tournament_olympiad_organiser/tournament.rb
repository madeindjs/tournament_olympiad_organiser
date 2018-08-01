module TournamentOlympiadOrganiser
  class Tournament
    attr_reader :players, :games

    def initialize
      @players = @games = []
    end

    def add_players *players
      @players.push *players
    end

    def add_games *games
      @games.push *games
    end

    def get_organization
      # TODO
      return []
    end
  end

end
