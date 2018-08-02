require "test_helper"

class TournamentOrganizerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TournamentOrganizer::VERSION
  end


  def test_unique_player
    tournament = TournamentOrganizer::Tournament.new

    tournament.add_players 'Alexandre', 'Alexandre'
    assert_equal 1, tournament.players.count
  end


  def test_unique_game
    tournament = TournamentOrganizer::Tournament.new

    tournament.add_games 'A', 'A'
    assert_equal 1, tournament.games.count
  end


  def test_get_organization
    tournament = TournamentOrganizer::Tournament.new
    tournament.add_players 'Alexandre', 'Lorène', 'Jean-Luc'
    tournament.add_games 'A', 'B'

    expected = [
      [
        {players:["Alexandre", "Lorène"], game:"A"}
      ],
      [
        {players:["Alexandre", "Jean-Luc"], game:"A"}
      ],
      [
        {players:["Jean-Luc", "Lorène"], game:"A"}
      ]
    ]

    tournament.get_organization.each_with_index do |round, round_number|
      assert_equal expected[round_number].count, round.count
    end
  end



  def test_get_organization_for_bigger_tournament
    tournament = TournamentOrganizer::Tournament.new
    tournament.add_players 'Alexandre', 'Lorène', 'Jean-Luc', 'Sylvain'
    tournament.add_games 'A', 'B', 'C'

    expected = [
      [
        {players:["Alexandre", "Lorène"], game:"A"},
        {players:["Jean-Luc", "Sylvain"], game:"B"}
      ],
      [
        {players:["Alexandre", "Jean-Luc"], game:"A"},
        {players:["Lorène", "Sylvain"], game:"B"}
      ],
      [
        {players:["Alexandre", "Sylvain"], game:"A"},
        {players:["Jean-Luc", "Lorène"], game:"B"}
      ]
    ]

    tournament.get_organization.each_with_index do |round, round_number|
      assert_equal expected[round_number].count, round.count
    end
  end


  def test_get_all_fights
    tournament = TournamentOrganizer::Tournament.new
    tournament.add_players 'Alexandre', 'Lorène', 'Jean-Luc'

    expected = [
      ['Alexandre', 'Lorène', ],
      ['Alexandre', 'Jean-Luc'],
      ['Jean-Luc', 'Lorène', ],
    ]

    assert_equal expected, tournament.get_all_fights

  end


  def test_get_fight_for
    tournament = TournamentOrganizer::Tournament.new
    tournament.add_players 'Alexandre', 'Lorène', 'Jean-Luc'

    expected = [
      ['Alexandre', 'Lorène', ],
      ['Alexandre', 'Jean-Luc'],
    ]

    assert_equal [], tournament.get_fights_for("Michel")
    assert_equal expected, tournament.get_fights_for("Alexandre")
  end

end
