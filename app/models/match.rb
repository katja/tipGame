class Match < ActiveRecord::Base
  require 'match_format'
  include MatchFormat

  belongs_to :team_1, :class_name => 'Team'
  belongs_to :team_2, :class_name => 'Team'
  
  validates_presence_of :team_1_id, :team_2_id, :starts_at
  validates_uniqueness_of :round, :scope => [:team_1_id, :team_2_id] # forbid same matches (round + team_1 + team_2)
  validates_uniqueness_of :round, :scope => [:team_2_id, :team_1_id]
  validates_uniqueness_of :team_1_id, :scope => :team_2_id           # forbid game against yourselves

  scope :next_matches, lambda {
    order('matches.starts_at ASC').
    where("starts_at > ?", Time.now).
    limit(3)
  }
  
  scope :last_matches, lambda {
    order('matches.starts_at DESC').
    where("starts_at < ?", Time.now)
  }
  
  scope :matches_without_result, lambda {
    where("matches.goals_team_1 IS NULL AND matches.goals_team_2 IS NULL")
  }
  def self.round_options
    ['Vorrunde', 'Achtelfinale', 'Viertelfinale', 'Halbfinale', 'Spiel um Platz Drei','Finale']
  end
  
  def finished?
    has_goals?
  end
  
  def update_score(soap_match)
    self.goals_team_1 = soap_match.matchResults.matchResult.last.pointsTeam1
    self.goals_team_2 = soap_match.matchResults.matchResult.last.pointsTeam2
    self.goals_first_half_team_1 = soap_match.matchResults.matchResult.first.pointsTeam1
    self.goals_first_half_team_2 = soap_match.matchResults.matchResult.first.pointsTeam2
    if self.save
      flash[:notice] = "Ergebnisse ganz aktuell neu geholt :)"
    end
  end

  def self.update_matches
    service = SoapWrapper.new
    service.update_results
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
