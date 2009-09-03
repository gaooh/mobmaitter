class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :twitter_id, :string, :limit => 256, :null => false
      t.column :twitter_pass, :string, :limit => 256, :null => false
      t.column :email, :string, :limit => 256, :null => false
      t.column :regist_at, :datetime, :null => false
      t.column :delete_flag, :boolean, :null=> true
    end
  end

  def self.down
    drop_table :users
  end
end
