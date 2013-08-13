class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :weight
      t.integer :petitions_count
      t.timestamps
    end
    add_index :categories, :name
    add_index :categories, :weight
  end
end
