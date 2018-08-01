module TournamentOlympiadOrganiser
  class Tournament
    attr_reader :players, :games

    def initialize
      @players = @games = []
    end

    def add_players *players
      @players.push(*players)
      @players.uniq!
    end

    def add_games *games
      @games.push(*games)
      @games.uniq!
    end

    def get_organization





      # TODO
      return []
    end

    def get_all_fights
      fights = []

      @players.each do |player|
        fights.push *self.get_fights_for(player)
      end

      return fights.uniq!
    end


    def get_fights_for player
      return [] unless @players.include?(player)

      return @players.select{|other_player| other_player != player}.map {|other_player|  [player, other_player].sort }
    end



  end

end
