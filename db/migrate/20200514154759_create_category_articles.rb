class CreateCategoryArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :category_articles do |t|
      t.belongs_to :category
      t.belongs_to :article

      t.timestamps
    end
  end
end
