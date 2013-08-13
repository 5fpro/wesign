class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.integer :petition_id
      t.datetime :happened_at
      t.string :title
      t.text :content
      t.timestamps
    end
    add_index :timelines, :petition_id
  end
end
