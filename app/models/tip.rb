class Tip < ActiveRecord::Base
  require 'match_format'
  include MatchFormat
  
  belongs_to :user
  belongs_to :match
  
  validates_presence_of :user_id, :match_id
  
  #attr_accessible :goals_team_1, :goals_team_2
  
  def has_goals?
    goals_team_1 && goals_team_2
    
  end
  
end
