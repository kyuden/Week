class ChageTitleToArticles < ActiveRecord::Migration
  def change
    change_column :articles, :title, :text, null: false
  end
end
