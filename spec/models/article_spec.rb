require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'creation tests' do
    it 'tests if an article can be created' do
      user = User.create!(name: 'user1', email: 'user@users.com', password: 'asdfasdf')
      article = Article.new(title: 'some title', user_id: user.id, text: 'This is some content', image: '').save
      expect(article).to eq(true)
    end
  end

  context 'validation tests' do
    it 'ensures the article is not empty' do
      user = User.create!(name: 'user1', email: 'user@users.com', password: 'asdfasdf')
      article = Article.new(title: 'some title', user_id: user.id, text: '', image: '').save
      expect(article).to eq(false)
    end
  end

  context 'association tests' do
    it 'ensures article was created by a user' do
      article = Article.new(title: 'some title', text: 'some text', image: '').save
      expect(article).to eq(false)
    end
  end

  context 'public methods' do
    let(:user) { User.create!(name: 'Mike', email: 'mike@users.com', password: 'asdfasdf') }
    let(:category_technology) { Category.create!(name: "Technology", priority: 1) }
    let(:article) { user.articles.build(text: "article text", title: "article title", image: "") }
  end
end
