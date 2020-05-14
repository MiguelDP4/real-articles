class Category < ApplicationRecord
  has_many :category_articles
  has_many :articles, through: :category_articles
end
