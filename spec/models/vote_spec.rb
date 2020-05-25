require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'creation test' do
    let(:user) { create(:user) }
    let(:article) { create(:article, user_id: user.id) }
    let(:vote) { user.votes.build(user_id: user.id, article_id: article.id) }
    it 'makes sure user can vote for article' do
      expect(vote.save).to eq(true)
    end
  end

  context 'association test' do
    let(:user) { create(:user) }
    let(:article) { create(:article, user_id: user.id) }
    let(:vote) { user.votes.build(user_id: user.id, article_id: article.id) }
    it 'makes sure a vote belongs to a user' do
      vote.save
      expect(vote.user).to eq(user)
    end
  end
end
