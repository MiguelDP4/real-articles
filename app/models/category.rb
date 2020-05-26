class Category < ApplicationRecord
  has_many :category_articles
  has_many :articles, through: :category_articles

  def self.all_categories_by_priority
    Category.all.sort_by(&:priority)
  end
end
