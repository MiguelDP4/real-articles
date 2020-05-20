require 'rails_helper'

RSpec.describe User, type: :model do
  context 'creation test' do
    it 'ensures users can be created' do
      user = User.new(name: 'name', email: 'email@email.com', password: 'asdfasdf').save
      expect(user).to eq(true)
    end
  end

  context 'validations' do
    it 'ensures user emails are unique' do
      user = User.new(name: 'name', email: 'email@email.com', password: 'asdfasdf').save
      user2 = User.new(name: 'name2', email: 'email@email.com', password: 'asdfasdf').save
      expect(user).to eq(true)
      expect(user2).to eq(false)
    end

    it 'ensures user names are unique' do
      user = User.new(name: 'name', email: 'email@email.com', password: 'asdfasdf').save
      user2 = User.new(name: 'name', email: 'email2@email.com', password: 'asdfasdf').save
      expect(user).to eq(true)
      expect(user2).to eq(false)
    end
  end

  context 'public methods' do
    it 'tests if user hasnt voted for article' do
      user = User.create!(name: 'name', email: 'email@email.com', password: 'asdfasdf')
      article = user.articles.build(text: "text of article", title: "title of article", image: "")
      article.save
      expect(user.voted?(article)).to eq(false)
    end

    it 'tests if user voted for article' do
      user = User.create!(name: 'name', email: 'email@email.com', password: 'asdfasdf')
      article = user.articles.build(text: "text of article", title: "title of article", image: "")
      article.save
      vote = user.votes.build(article_id: article.id)
      vote.save
      expect(user.voted?(article)).to eq(true)
    end
  end

  context 'associations' do
    it 'tests association between user and article' do
      user = User.create!(name: 'name', email: 'email@email.com', password: 'asdfasdf')
      article = user.articles.build(text: "text of article", title: "title of article", image: "")
      article.save
      expect(user.articles.first).to eq(article)
    end

    it 'tests association between user and votes' do
      user = User.create!(name: 'name', email: 'email@email.com', password: 'asdfasdf')
      article = user.articles.build(text: "text of article", title: "title of article", image: "")
      article.save
      vote = user.votes.build(article_id: article.id)
      vote.save
      expect(user.votes.first).to eq(vote)
    end
  end
end
