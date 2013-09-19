class CreatePetitionUsers < ActiveRecord::Migration
  def change
    create_table :petition_users do |t|
      t.integer :petition_id
      t.integer :user_id
      t.text :comment
      t.timestamps
    end
    add_index :petition_users, :petition_id
    add_index :petition_users, :user_id
    add_index :petition_users, [:petition_id, :user_id]
  end
end
