require 'String'
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
    sum = Match.where(:team_1_id => self.id).inject(0){ |sum, match| sum += match.points(self) }
    sum += Match.where(:team_2_id => self.id).inject(0){ |sum, match| sum += match.points(self) }
  end

end
