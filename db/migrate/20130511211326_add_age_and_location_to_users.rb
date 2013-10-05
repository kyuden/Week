class AddAgeAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :integer,  :null => false
    add_column :users, :age, :integer,       :null => false
  end
end
