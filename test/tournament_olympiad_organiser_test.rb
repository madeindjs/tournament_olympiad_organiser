require "test_helper"

class TournamentOlympiadOrganiserTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TournamentOlympiadOrganiser::VERSION
  end


  def test_unique_player
    tournament = TournamentOlympiadOrganiser::Tournament.new

    tournament.add_players 'Alexandre', 'Alexandre'
    assert_equal 1, tournament.players.count
  end


  def test_unique_game
    tournament = TournamentOlympiadOrganiser::Tournament.new

    tournament.add_games 'A', 'A'
    assert_equal 1, tournament.games.count
  end


  def test_get_organization

    tournament = TournamentOlympiadOrganiser::Tournament.new
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

    assert_equal expected, tournament.get_organization
  end


  def test_get_all_fights
    tournament = TournamentOlympiadOrganiser::Tournament.new
    tournament.add_players 'Alexandre', 'Lorène', 'Jean-Luc'

    expected = [
      ['Alexandre', 'Lorène', ],
      ['Alexandre', 'Jean-Luc'],
      ['Jean-Luc', 'Lorène', ],
    ]

    assert_equal expected, tournament.get_all_fights

  end


  def test_get_fight_for
    tournament = TournamentOlympiadOrganiser::Tournament.new
    tournament.add_players 'Alexandre', 'Lorène', 'Jean-Luc'

    expected = [
      ['Alexandre', 'Lorène', ],
      ['Alexandre', 'Jean-Luc'],
    ]

    assert_equal [], tournament.get_fights_for("Michel")
    assert_equal expected, tournament.get_fights_for("Alexandre")
  end

end
