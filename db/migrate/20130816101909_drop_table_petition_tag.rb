class DropTablePetitionTag < ActiveRecord::Migration
  def up
    drop_table :petition_tags
    remove_index :petitions, :column => :name
    add_index :tags, [:name], :unique => true
  end

  def down
  end
end
