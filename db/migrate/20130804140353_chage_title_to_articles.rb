class ChageTitleToArticles < ActiveRecord::Migration
  def change
    change_column :articles, :title, :text
  end
end
