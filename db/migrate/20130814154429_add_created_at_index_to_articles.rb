class AddCreatedAtIndexToArticles < ActiveRecord::Migration
  def change
    add_index :articles, [:location, :age]
    add_index :articles, [:user_id]
  end
end
