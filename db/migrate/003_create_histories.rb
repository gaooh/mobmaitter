class CreateHistories < ActiveRecord::Migration
  def self.up
    create_table :histories do |t|
      t.column :user_id, :integer, :null => false
      t.column :message_id, :integer, :null => false
      t.column :send_at, :datetime, :null => false
    end
  end

  def self.down
    drop_table :histories
  end
end
