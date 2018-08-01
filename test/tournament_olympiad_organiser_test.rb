require "test_helper"

class TournamentOlympiadOrganiserTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TournamentOlympiadOrganiser::VERSION
  end


  def test_get_organization

    tournament = TournamentOlympiadOrganiser::Tournament.new

    tournament.add_players 'Alexandre', 'Lorène', 'Jean-Luc'
    tournament.add_games 'A', 'B'

    expected = [
      {
        players: ['Alexandre', 'Lorène', ],
        game: 'A'
      },
      {
        players: ['Alexandre', 'Jean-Luc'],
        game: 'B'
      },
      {
        players: ['Lorène', 'Jean-Luc', ],
        game: 'A'
      },
    ]

    assert_equal expected, tournament.get_organization
  end

end
