class AddDayToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :disp_day, :string
    add_column :articles, :about_time, :string
    add_column :articles, :place_adress, :string
    add_column :articles, :place_name, :string
  end
end
