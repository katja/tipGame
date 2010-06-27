class Match < ActiveRecord::Base
  require 'match_format'
  include MatchFormat
  
  @@matches_updated = false

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
  
  scope :not_finished_matches, lambda {
    where(:finished => false)
  }
  def self.round_options
    ['Vorrunde', 'Achtelfinale', 'Viertelfinale', 'Halbfinale', 'Spiel um Platz Drei','Finale']
  end
  
  def finished?
    has_goals?
  end
  
  def finished_goals_team_1
    p "1: --  #{team_1.name} : #{team_2.name}"
    p "goals: --- #{goals_team_1 ? goals_team_1 : 0}"
    goals_team_1 ? goals_team_1 : 0
  end

  def finished_goals_team_2
    p "2: --  #{team_1.name} : #{team_2.name}"
    p "goals: --- #{goals_team_2 ? goals_team_2 : 0}"
    goals_team_2 ? goals_team_2 : 0
  end
  
  def points(team)
    if not finished?
      0
    elsif (team_1_id == team.id and winner == 1 ) or (team_2_id == team.id and winner == 2)
      3
    elsif winner == 0
      1
    else
      0
    end
  end
  
  def self.delete_goals_last_matches(number)
    for match in Match.last_matches.limit(number) do
      match.goals_team_1 = nil
      match.goals_team_2 = nil
      match.goals_first_half_team_1 = nil
      match.goals_first_half_team_2 = nil
      match.save
    end
  end
  
  def running?
    Time.now > self.starts_at and not self.finished
  end
  
  def update_score(soap_match)
    self.goals_first_half_team_1 = self.goals_team_1 = soap_match.matchResults.matchResult.last.pointsTeam1
    self.goals_first_half_team_2 = self.goals_team_2 = soap_match.matchResults.matchResult.last.pointsTeam2
    self.goals_team_1 = soap_match.matchResults.matchResult.first.pointsTeam1
    self.goals_team_2 = soap_match.matchResults.matchResult.first.pointsTeam2
    self.finished = soap_match.matchIsFinished

    if self.save
      p "updated successfull: #{soap_match.nameTeam1} : #{soap_match.nameTeam2} => #{self.goals_team_1} : #{self.goals_team_2}"
      @@matches_updated = true
    else
      p "update failed"
      @@matches_updated = false
    end
  end

  def self.update_matches
    @@matches_updated = false
    service = SoapWrapper.new
    service.update_results
    @@matches_updated
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
