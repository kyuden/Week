class AddCreatedAtIndexUsers < ActiveRecord::Migration
  def change
    add_index :users, [:location, :age]
  end
end
