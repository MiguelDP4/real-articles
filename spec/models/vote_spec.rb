require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'creation test' do
    let(:user) { User.create!(name:"Mike",email:"mike@users.com",password:"asdfasdf") }
    let(:article) { Article.create!(text:"some text",title:"some title",image:"",user_id: user.id) }

    it 'makes sure user can vote for article' do
      vote = user.votes.build(user_id: user.id, article_id: article.id).save
      expect(vote).to eq(true)
    end
  end
end
