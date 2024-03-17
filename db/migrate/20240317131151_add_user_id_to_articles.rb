class AddUserIdToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :user_id, :int
  end
end
