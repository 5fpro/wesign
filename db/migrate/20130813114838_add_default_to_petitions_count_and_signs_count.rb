class AddDefaultToPetitionsCountAndSignsCount < ActiveRecord::Migration
  def change
    change_column :categories, :petitions_count, :integer, :default => 0
    change_column :petitions, :signs_count, :integer, :default => 0
  end
end
