class AddRoundsToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :round, :string, :default => 'Vorrunde', :null => false
  end

  def self.down
    remove_column :matches, :round
  end
end
