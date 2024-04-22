class CreateBlogCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_categories do |t|
      t.integer :blog_id
      t.integer :category_id
    end
  end
end
