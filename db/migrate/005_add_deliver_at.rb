class AddDeliverAt < ActiveRecord::Migration
  def self.up
    add_column(:histories, :deliver_at, :datetime, :null=>true)
  end

  def self.down
    remove_column(:histories, :deliver_at)
  end
end
