class RenameMatchBeginToBegin < ActiveRecord::Migration
  def self.up
    rename_column :matches, :match_begin, :start
  end

  def self.down
    rename_column :matches, :start, :match_begin
  end
end
