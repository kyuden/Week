class AddCreatedAtIndexEntries < ActiveRecord::Migration
  def change
    add_index :entries, [:article_id, :watch_id]
    add_index :entries, [:article_id]
    add_index :entries, [:watch_id]
  end
end
