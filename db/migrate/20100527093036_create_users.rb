class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false
      t.string :encrypted_password, :null => false
      t.string :salt, :null => false
      t.string :mail, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
