class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.integer :comment_id
      t.integer :user_id
      t.integer :entry_id

      t.timestamps
    end
  end
end
