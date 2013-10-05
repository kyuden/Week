class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "uid",           :null => false
      t.string   "access_token",  :null => false
      t.string   "name",          :null => false
      t.string   "email",         :null => false
      t.string   "gender"
      t.string   "image"
      t.string   "url"

      t.timestamps
    end
  end
end
