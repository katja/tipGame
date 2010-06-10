class CreateTips < ActiveRecord::Migration
  def self.up
    create_table :tips do |t|
      t.references :user, :null => false
      t.references :match, :null => false
      t.integer :goals_team_1, :null => false
      t.integer :goals_team_2, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :tips
  end
end
