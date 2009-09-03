class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |t|
      t.column :email, :string, :limit => 256, :null => false
      t.column :invite_code, :string, :limit => 32, :null => false
      t.column :create_at, :datetime, :null => false
      t.column :regist_at, :datetime, :null => true
    end
  end

  def self.down
    drop_table :invites
  end
end
