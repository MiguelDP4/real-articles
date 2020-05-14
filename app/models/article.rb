class Article < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :text, presence: true
  has_many :category_articles
  has_many :categories, through: :category_articles
end
