class AddWatchIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :watch_id, :integer
  end
end
