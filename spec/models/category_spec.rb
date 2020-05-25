require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'usage test' do
    let(:user) { create(:user) }
    let(:article) { create(:article, user_id: user.id) }
    let(:category) { build(:category) }

    it 'ensures a category can be created' do
      expect(category.save).to eq(true)
    end

    it 'ensures articles can be searched by category' do
      category.save
      article.add_category(category.id)
      expect(category.articles.first).to eq(article)
    end
  end

  context 'associations' do
    let(:user) { create(:user) }
    let(:article) { create(:article, user_id: user.id) }
    let(:category) { build(:category) }

    it 'ensures categories can be associated with articles' do
      category.save
      article.add_category(category.id)
      expect(article.categories.first).to eq(category)
    end
  end
end
