class AddUserToArticle < ActiveRecord::Migration[6.0]
  def up
    add_reference :articles, :user
    add_foreign_key :articles, :users
    remove_column :articles, :author
  end
end
