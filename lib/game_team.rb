require 'pry'

class GameTeam
    attr_reader :game_id,
                :team_id,
                :hoa,
                :result,
                :settled_in,
                :head_coach,
                :goals,
                :shots,
                :tackles,
                :pim,
                :powerplayopportunities,
                :powerplaygoals,
                :faceoffwinpercentage,
                :giveaways,
                :takeaways

  def initialize(data)
    @game_id = data[:game_id].to_i
    @team_id = data[:team_id]
    @hoa = data[:hoa]
    @result = data[:result]
    @settled_in = data[:settled_in]
    @head_coach = data[:head_coach]
    @goals = data[:goals]
    @shots = data[:shots]
    @tackles = data[:tackles]
    @pim = data[:pim]
    @powerplayopportunities = data[:powerplayopportunities]
    @powerplaygoals = data[:powerplaygoals]
    @faceoffwinpercentage = data[:faceoffwinpercentage]
    @giveaways = data[:giveaways]
    @takeaways = data[:takeaways]
  end
end
