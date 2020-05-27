class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  def self.find_vote(user_id, article_id)
    Vote.find_by(user_id: user_id, article_id: article_id)
  end
end
