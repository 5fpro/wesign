class CreatePetitionTags < ActiveRecord::Migration
  def change
    create_table :petition_tags do |t|
      t.integer :petition_id
      t.integer :tag_id
      t.timestamps
    end
    add_index :petition_tags, [:petition_id]
    add_index :petition_tags, [:tag_id]
    add_index :petition_tags, [:petition_id, :tag_id], :unique => true
  end
end
