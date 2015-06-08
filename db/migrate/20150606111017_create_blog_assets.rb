class CreateBlogAssets < ActiveRecord::Migration
  def change
    create_table :blog_assets do |t|
      t.string :name, null: false
      t.string :description, default: ''

      t.string :asset

      t.references :blog_posts, index: true

      t.timestamps null: false
    end
  end
end
