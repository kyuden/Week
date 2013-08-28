class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :adress
      t.string :category
      t.text   :description

      t.timestamps
    end
  end
end
