require './test/test_helper'
require 'CSV'

class CsvParser
  attr_reader :all_games,
              :all_teams,
              :all_game_stats

  def initialize
    @game_path = './data/games.csv'
    @team_path = './data/teams.csv'
    @game_stats_path = './data/game_stats.csv'
    @all_games = all_games
    @all_teams = all_teams
    @all_game_stats = all_game_stats
  end

  def create_game_data
    @all_games = []
    CSV.foreach(@game_path, headers: true, header_converters: :symbol) do |row|
      @all_games << Game.new(row)
    end
  end

  def create_team_data
    @all_games = []
    CSV.foreach(@team_path, headers: true, header_converters: :symbol) do |row|
      @all_teams << Team.new(row)
  end

  def create_game_stats_data
    @all_games = []
    CSV.foreach(@game_stats_path, headers: true, header_converters: :symbol) do |row|
      @all_game_stats << GameStats.new(row)
    end
  end
end
