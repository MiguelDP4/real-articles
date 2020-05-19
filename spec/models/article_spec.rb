require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validation tests' do
    it 'ensures the article is not empty' do
      user = User.create!(name:"user1",email:"user@users.com",password:"asdfasdf")
      article = Article.new(title:"some title",user_id:user.id,text:"",image:"").save
      expect(article).to eq(false)
    end

    it 'ensures a user made the article' do
      article = Article.new(title:"some title",text:"some text",image:"").save
      expect(article).to eq(false)
    end

    it 'tests if an article can be created' do
      user = User.create!(name:"user1", email: "user@users.com", password:"asdfasdf")
      article = Article.new(title:"some title",user_id:user.id,text:"This is some content",image:"").save
      expect(article).to eq(true)
    end
  end
end
