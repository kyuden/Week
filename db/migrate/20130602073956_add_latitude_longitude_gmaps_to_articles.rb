class AddLatitudeLongitudeGmapsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :latitude, :float
    add_column :articles, :longitude, :float
    add_column :articles, :gmaps, :boolean
  end
end
