class Match < ActiveRecord::Base
  require 'match_format'
  include MatchFormat

  belongs_to :team_1, :class_name => 'Team'
  belongs_to :team_2, :class_name => 'Team'
  
  validates_presence_of :team_1_id, :team_2_id, :starts_at
  validates_uniqueness_of :round, :scope => [:team_1_id, :team_2_id] # forbid same matches (round + team_1 + team_2)
  validates_uniqueness_of :round, :scope => [:team_2_id, :team_1_id]
  validates_uniqueness_of :team_1_id, :scope => :team_2_id           # forbid game against yourselves

  def self.round_options
    ['Vorrunde', 'Viertelfinale', 'Halbfinale', 'Spiel um Platz Drei','Finale']
  end
  
  def self.matches_by_group(group)
    Match.joins(:team_1).where("teams.group" => group)
  end
  
  def self.all_first_round_matches_by_group
    groups = Hash.new
    Team.team_groups.each do |group|
      groups[group] = matches_by_group(group) #groups << :group => (matches_by_group(group))
    end
    groups
  end
  
  def self.all_matches_by_round
    matches = Hash.new
    round_options.each do |round|
      matches[round] = Match.where(:round => round)
    end
    matches['Vorrunde'] = all_first_round_matches_by_group
    matches
  end
end
