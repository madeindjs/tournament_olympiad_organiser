module TournamentOlympiadOrganiser
  class Tournament
    attr_reader :players, :games

    def initialize
      @players = []
      @games = []
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
      organization = []
      fights = self.get_all_fights

      while not fights.empty?
        round = []


        player_on_round = []

        # loop on all games
        @games.map do |game|
          # quit loop if we use all fights
          break if fights.empty?

          # ensure than current fighters not already fight on this rouns
          current_fights = fights.select{|f| !player_on_round.include?(f.first) and !player_on_round.include?(f.last)}
          break if current_fights.empty?

          current_fight = current_fights.first

          round << {players: current_fight, game: game}
          player_on_round.push(*current_fight)

          fights.delete current_fight
        end

        organization << round
      end

      return organization
    end

    def get_all_fights
      fights = []

      @players.each do |player|
        fights.push(*self.get_fights_for(player))
      end

      return fights.uniq!
    end


    def get_fights_for player
      return [] unless @players.include?(player)

      return @players.select{|other_player| other_player != player}.map {|other_player|  [player, other_player].sort }
    end



  end

end
