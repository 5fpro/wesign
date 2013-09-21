class AddColumnFbIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_id, :string, :after => :email
    add_index :users, :fb_id
  end
end
