require './test/test_helper'

class TeamDataTest < Minitest::Test
  def setup

    @stat_tracker = mock
    @team_data = TeamData.new(locations[:teams], @stat_tracker)
  end

  def test_it_exists
    assert_instance_of TeamData, @team_data
    require "pry";binding.pry
  end

end
