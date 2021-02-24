require 'CSV'

class Team

  attr_reader :team_id,
              :franchise_id,
              :team_name,
              :abbreviation,
              :stadium,
              :link

  def initialize(data)
    @team_id = data[:team_id]
    @franchise_id = data[:franchise_id]
    @teamName = data[:team_name]
    @abbreviation = data[:abbreviation]
    @stadium = data[:stadium]
    @link = data[:link]
    binding.pry
  end
end