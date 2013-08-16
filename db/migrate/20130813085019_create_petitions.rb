class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.integer :category_id
      t.string :name
      t.string :target
      t.text :intro
      t.text :content
      t.string :signed_mail_title
      t.text :signed_mail_body
      t.integer :signs_count
      t.timestamps
    end
    add_index :petitions, :category_id
    add_index :petitions, :name
  end
end
