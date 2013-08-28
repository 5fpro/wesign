class AddColumnUserIdToPetitions < ActiveRecord::Migration
  def change
    add_column :petitions, :user_id, :integer, :after => :category_id
    add_index :petitions, :user_id
  end
end
