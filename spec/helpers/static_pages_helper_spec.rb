require "rails_helper"

RSpec.describe StaticPagesHelper, :type => :helper do
  before(:each) do
    @user = User.create!(name: 'Mike', email: 'mike@users.com', password: 'asdfasdf')
    @user2 = User.create!(name: 'Mike2', email: 'mike2@users.com', password: 'asdfasdf')
    @user3 = User.create!(name: 'Mike3', email: 'mike3@users.com', password: 'asdfasdf')
    @user4 = User.create!(name: 'Mike4', email: 'mike4@users.com', password: 'asdfasdf')
    @article = @user.articles.build(text: 'article text', title: 'article title', image: '')
    @article.save
    @article2 = @user.articles.build(text: 'article text2', title: 'article title2', image: '')
    @article2.save
    @article3 = @user.articles.build(text: 'article text3', title: 'article title3', image: '')
    @article3.save
    @article4 = @user.articles.build(text: 'article text4', title: 'article title4', image: '')
    @article4.save
  end

  describe "most popular article" do
    it "returns the most popular article" do
      Vote.new(user_id: @user.id, article_id: @article3.id).save
      Vote.new(user_id: @user2.id, article_id: @article3.id).save
      Vote.new(user_id: @user3.id, article_id: @article3.id).save
      Vote.new(user_id: @user4.id, article_id: @article3.id).save
      expect(helper.most_popular_article).to eq(@article3)
    end
  end
end