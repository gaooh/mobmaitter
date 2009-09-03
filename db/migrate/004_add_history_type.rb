class AddHistoryType < ActiveRecord::Migration
  def self.up
    add_column(:histories, :message_type, :integer, :default => 1, :null=>false)
  end

  def self.down
    remove_column(:histories, :message_type)
  end
end
