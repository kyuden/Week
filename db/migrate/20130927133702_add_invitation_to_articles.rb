class AddInvitationToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :invited, :boolean, default: false
  end
end
