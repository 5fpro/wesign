class AddColumnPicAndTargetingCountToPetition < ActiveRecord::Migration
  def change
    add_column :petitions, :pic, :string, :after => :content
    add_column :petitions, :targeting_count, :integer, :after => :name
  end
end
