class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.string :auth_type
      t.integer :auth_id
      t.text :auth_data

      t.timestamps
    end
  end
end
