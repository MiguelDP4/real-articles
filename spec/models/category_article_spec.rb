require 'rails_helper'

RSpec.describe CategoryArticle, type: :model do
  context 'creation test' do
    let(:user) { create(:user) }
    let(:article) {create(:article, user_id: user.id)}
    let(:category) { create(:category) }
    let(:category2) { create(:category2) }

    it 'makes sure an article can be associated to a category' do
      article.add_category(category.id)
      expect(article.categories.first.name).to eq('Category 1')
    end

    it 'makes sure an article can have more than one category' do
      article.add_category(category.id)
      article.add_category(category2.id)
      expect(article.categories.count).to eq(2)
    end
  end
end
