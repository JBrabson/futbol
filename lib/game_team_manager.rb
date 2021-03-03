require 'CSV'
require 'pry'
require_relative './game_team'
require_relative './csv_parser'

class GameTeamManager
  include CsvParser

  def initialize(file)
    @all_game_teams = load_it_up(file, GameTeam)
  end

  def make_goals_by_team_hash
    goals_by_team = {}
    @all_game_teams.each do |gameteam|
      goals_by_team[gameteam.team_id] = []
    end
    @all_game_teams.each do |gameteam|
      goals_by_team[gameteam.team_id] << gameteam.goals.to_i
    end
    goals_by_team
  end

  def average_goals_by_team_hash
    average_goals_by_team = make_goals_by_team_hash
    average_goals_by_team.keys.each do |team|
      average_goals_by_team[team] = (average_goals_by_team[team].sum.to_f/(average_goals_by_team[team].size)).round(2)
    end
    average_goals_by_team
  end

  def teams_max_average_goals
    average_goals_by_team_hash.max_by do |key, value|
      value
    end.first

  end

  def teams_least_average_goals
    average_goals_by_team_hash.min_by do |key, value|
      value
    end.first

  end

  def average_team_goals_per_game(id)
    all_scores = []
    @all_game_teams.each do |game|
      if game.team_id == id
        all_scores << game.goals
      end
    end
    count = all_scores.count
    final = (all_scores.sum)/count.to_f
    final.round(2)
  end
end
