require 'rails_helper'

RSpec.describe CategoryArticle, type: :model do
  context 'creation test' do
    let(:user) { User.create!(name:"Mike",email:"mike@users.com",password:"asdfasdf") }
    let(:category) { Category.create!(name:"Miscelaneus",priority:1) }
    let(:category2) { Category.create!(name:"World",priority:1) }
    it 'makes sure an article can be associated to a category' do
      article = Article.create(text:"Some content.",title:"Some title",user_id: user.id)
      article.add_category(category.id)
      expect(article.categories.first.name).to eq("Miscelaneus")
    end

    it 'makes sure an article can have more than one category' do
      article = Article.create(text:"Some content.",title:"Some title",user_id: user.id)
      article.add_category(category.id)
      article.add_category(category2.id)
      expect(article.categories.count).to eq(2)
    end
  end
end
