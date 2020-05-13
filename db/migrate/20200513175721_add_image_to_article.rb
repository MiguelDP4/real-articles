class AddImageToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :image, :string, default: ""
  end
end
