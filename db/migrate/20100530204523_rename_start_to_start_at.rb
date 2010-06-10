class RenameStartToStartAt < ActiveRecord::Migration
  def self.up
    rename_column :matches, :start, :starts_at
  end

  def self.down
    rename_column :matches, :starts_at, :start
  end
end
