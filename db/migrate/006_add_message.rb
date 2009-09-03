class AddMessage < ActiveRecord::Migration
  def self.up
    add_column(:histories, :message, :string, :limit => 256, :null=>true)
  end

  def self.down
    remove_column(:histories, :message)
  end
end
