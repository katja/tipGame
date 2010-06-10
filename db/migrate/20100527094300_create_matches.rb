class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.references :team_1, :null => false
      t.references :team_2, :null => false
      t.datetime :match_begin, :null => false
      t.integer :goals_first_half_team_1
      t.integer :goals_second_half_team_1
      t.integer :goals_first_half_team_2
      t.integer :goals_second_half_team_2

      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
