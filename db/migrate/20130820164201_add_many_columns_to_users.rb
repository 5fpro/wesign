class AddManyColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :integer, :after => :name
    add_column :users, :location, :string, :after => :phone
    add_column :users, :birthday, :date, :after => :location
    add_column :users, :job, :string, :after => :birthday
  end
end
