class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :cart_id
      t.integer :article_id

      t.timestamps
    end
  end
end
