require 'CSV'
require_relative './game_data'
require_relative './team_data'
require_relative './game_stats_data'
require 'pry'

class StatTracker # < MethodsClass?

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def initialize(locations)
    @game_data = GameData.new(locations[:games])
    # @team_data = TeamData.new(locations[:teams], self)
    # @game_stats = GameStatsData.new(locations[:game_stats], self)
  end

  def highest_total_score
    @game_data.game_with_highest_total_score.total_goals
  end

  def lowest_total_score
    @game_data.game_with_lowest_total_score.total_goals
  end

  # def percentage_home_wins
  #   @game.percentage_home_wins
  # end
end
