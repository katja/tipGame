class Tip < ActiveRecord::Base
  require 'match_format'
  include MatchFormat
  
  belongs_to :user
  belongs_to :match
  
  validates_presence_of :user_id, :match_id
  
  #attr_accessible :goals_team_1, :goals_team_2
    
  # richtiger Gewinner => 1 Punkt
  # richtige Tordifferenz => 2 Punkte
  # richtiger Tipp => 4 Punkte
  def points
    return 0 unless match.finished?
    return 4 if self.score == match.score
    return 2 if self.goals_diff == match.goals_diff
    return 1 if self.winner == match.winner
    return 0
  end
  
end
