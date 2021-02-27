require './test/test_helper'
require 'CSV'

class CsvParser
  attr_reader :all_games,
              :dummy_game_data

  def initialize(game_path)
    @game_path = './data/games.csv'
    @dummy_game_path = './test/games_dummy.csv'
    @team_path = './data/teams.csv'
    @game_stats_path = './data/game_stats.csv'
    @dummy_game_data = []
    @all_games = all_games
  end

  def create_game_data
    @all_games = []
    CSV.foreach(@game_path, headers: true, header_converters: :symbol) do |row|
      game_id = row[:game_id]
      season = row[:season]
      type = row[:type]
      date_time = row[:date_time]
      away_team_id = row[:away_team_id].to_i
      home_team_id = row[:home_team_id].to_i
      away_goals = row[:away_goals].to_i
      home_goals = row[:home_goals].to_i
      venue = row[:venue]
      venue_link = row[:venue_link]
      @all_games << Game.new(game_id, season, type, date_time, away_team_id,
        home_team_id, away_goals, home_goals, venue, venue_link)
    end
    x = GameData.new(@all_games)
  end

  def create_dummy_game_data
    CSV.foreach(@dummy_game_path, headers: true, header_converters: :symbol) do |row|
      game_id = row[:game_id]
      season = row[:season]
      type = row[:type]
      date_time = row[:date_time]
      away_team_id = row[:away_team_id].to_i
      home_team_id = row[:home_team_id].to_i
      away_goals = row[:away_goals].to_i
      home_goals = row[:home_goals].to_i
      venue = row[:venue]
      venue_link = row[:venue_link]
      @dummy_game_path << Game.new(game_id, season, type, date_time, away_team_id,
        home_team_id, away_goals, home_goals, venue, venue_link)
    end
    y = GameData.new(@dummy_game_path)
  end
end
