require_relative './stat_tracker'
require_relative './team_data'
require_relative './game_data'
require_relative './game_stats_data'
require_relative './csv_parser'

game_path = './data/games.csv'
team_path = './data/teams.csv'
game_stats_path = './data/game_stats.csv'

csv_file_path = {
  games: game_path,
  teams: team_path,
  game_stats: game_stats_path
}

CsvParser.new(game_path).create_game_data
stat_tracker = StatTracker.from_csv(csv_file_path)
