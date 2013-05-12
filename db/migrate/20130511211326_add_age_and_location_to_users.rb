class AddAgeAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :integer
    add_column :users, :age, :integer
  end
end
