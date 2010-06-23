class AddFinishedToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :finished, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :matches, :finished
  end
end
