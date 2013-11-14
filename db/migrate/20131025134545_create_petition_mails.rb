class CreatePetitionMails < ActiveRecord::Migration
  def change
    create_table :petition_mails do |t|
      t.integer :petition_id
      t.string :title
      t.text :body
      t.timestamps
    end

    add_index :petition_mails, :petition_id
  end
end
