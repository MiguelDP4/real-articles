require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'creation tests' do
    let(:user) {create(:user)}
    let(:article) {build(:article, user_id: user.id)}
    it 'tests if an article can be created' do
      # article = Article.new(title: 'some title', user_id: user.id, text: 'This is some content', image: '').save
      expect(article.save).to eq(true)
    end
  end

  context 'validation tests' do
    let(:user) {create(:user)}
    let(:article) {build(:article)}
    it 'ensures the article is not empty' do
      article.text = ''
      expect(article.save).to eq(false)
    end
  end

  context 'association tests' do
    let(:user) {create(:user)}
    let(:article) {build(:article)}
    it 'ensures article was created by a user' do
      expect(article.save).to eq(false)
    end
  end
end
