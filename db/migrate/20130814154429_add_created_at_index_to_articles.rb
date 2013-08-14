class AddCreatedAtIndexToArticles < ActiveRecord::Migration
  def change
    add_index :articles, :user_id
    add_index :articles, [:title, :disp_day], length: {title: 410 }
    add_index :articles, [:id, :user_id]
  end
end
