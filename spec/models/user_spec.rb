require 'rails_helper'

RSpec.describe User, type: :model do
  context 'creation test' do
    let(:user) { create(:user) }
    it 'ensures users can be created' do
      expect(user.save).to eq(true)
    end
  end

  context 'validations' do
    let(:user) { build(:user) }
    let(:user2) { build(:user2, email: user.email) }
    let(:user3) { build(:user3, name: user.name) }
    it 'ensures user emails are unique' do
      expect(user.save).to eq(true)
      expect(user2.save).to eq(false)
    end

    it 'ensures user names are unique' do
      expect(user.save).to eq(true)
      expect(user3.save).to eq(false)
    end
  end

  context 'public methods' do
    let(:user) { create(:user) }
    let(:article) { build(:article) }
    let(:vote) { user.votes.build(article_id: article.id) }
    it 'tests if user hasnt voted for article' do
      expect(user.voted?(article)).to eq(false)
    end

    it 'tests if user voted for article' do
      article.user_id = user.id
      article.save
      vote.save
      expect(user.voted?(article)).to eq(true)
    end
  end

  context 'associations' do
    let(:user) { create(:user) }
    let(:article) { build(:article, user_id: user.id) }
    let(:vote) { user.votes.build(article_id: article.id) }
    it 'tests association between user and article' do
      article.save
      expect(user.articles.first).to eq(article)
    end

    it 'tests association between user and votes' do
      article.save
      vote.save
      expect(user.votes.first).to eq(vote)
    end
  end
end
