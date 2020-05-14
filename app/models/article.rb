class Article < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :text, presence: true
  has_many :category_articles
  has_many :categories, through: :category_articles

  def add_category(category_id)
    category_articles.new(article_id: self.id, category_id: category_id).save
  end

end
