require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'usage test' do
    let(:user) { User.create!(name: 'Mike', email: 'mike@users.com', password: 'asdfasdf') }
    let(:category) { Category.create!(name: 'Miscelaneus', priority: 1) }
    let(:category2) { Category.create!(name: 'World', priority: 1) }

    it 'ensures a category can be created' do
      cat = Category.new(name: 'Miscelaneus', priority: 1).save
      expect(cat).to eq(true)
    end

    it 'ensures articles can be searched by category' do
      article = Article.create!(text: 'Some content.', title: 'Some title', user_id: user.id)
      article.add_category(category.id)
      expect(category.articles.first).to eq(article)
    end
  end

  context 'associations' do
    let(:user) { User.create!(name: 'Mike', email: 'mike@users.com', password: 'asdfasdf') }
    let(:category_technology) { Category.create!(name: "Technology", priority: 1) }
    let(:article) { user.articles.build(text: "article text", title: "article title", image: "") }
    
    it 'ensures categories can be associated with articles' do
      article.add_category(category_technology.id)
      expect(article.categories.first).to eq(category_technology)
    end
  end
end
