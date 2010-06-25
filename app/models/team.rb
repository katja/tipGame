class Team < ActiveRecord::Base
  TEAM_GROUPS = %w[A B C D E F G H unklar]
  
  has_many :matches, :dependent => :destroy
  
  validates_presence_of :name, :group
  
  def self.team_groups
    TEAM_GROUPS
  end
  
  def self.team_names
    Team.all.collect do |team|
      [team.name, team.id]
    end
  end
  
  def self.groups
    TEAM_GROUPS
  end
  
  def points
    pts = Match.where(:team_1_id => self.id).inject(0){ |sum, match| sum += match.points(self) }
    Match.where(:team_2_id => self.id).inject(pts){ |sum, match| sum += match.points(self) }
  end
  
  def goals_self_and_opponent
    diff = Match.where(:team_1_id => self.id).inject([0,0]){ |sum, match| [sum.first + match.finished_goals_team_1, sum.last + match.finished_goals_team_2] }
    Match.where(:team_2_id => self.id).inject(diff){ |sum, match| [sum.first + match.finished_goals_team_2, sum.last + match.finished_goals_team_1] }
  end
  
  def goal_diff
    goals_self_and_opponent.first - goals_self_and_opponent.last
  end
  
  def goals
    goals_self_and_opponent.first
  end

end
