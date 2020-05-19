class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_many :votes
  validates :name, uniqueness: true

  def voted?(article)
    !votes.find_by(article_id: article.id).nil?
  end
end
