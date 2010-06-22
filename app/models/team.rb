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
  
  def short
    
  end
end
