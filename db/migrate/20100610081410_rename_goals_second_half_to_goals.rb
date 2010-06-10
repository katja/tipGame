class RenameGoalsSecondHalfToGoals < ActiveRecord::Migration
  def self.up
    rename_column :matches, :goals_second_half_team_1, :goals_team_1
    rename_column :matches, :goals_second_half_team_2, :goals_team_2
  end

  def self.down
    rename_column :matches, :goals_team_2, :goals_second_half_team_2
    rename_column :matches, :goals_team_1, :goals_second_half_team_1
  end
end
