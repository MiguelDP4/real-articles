require 'rails_helper'

RSpec.describe 'real', type: :request do
  def log_in(user)
    sign_in user
  end

  context 'real-articles' do
    let(:user) { User.create!(name: 'Mike', email: 'mike@users.com', password: 'asdfasdf') }
    
    it 'ensures home page shows up to user' do
      get root_path
      expect(response.body).to include('Log in')
    end

    it 'logs into session for user' do
      log_in(user)
      get root_path
      expect(response.body).to include('Account')
    end

    it 'opens article writer' do
      log_in(user)
      get articles_new_path
      expect(response.body).to include('Article Composer')
    end

    it 'creates an article' do
      log_in(user)
      post articles_new_path, params: {title: "Article title", text: "article text", image:"", category: "1,3,"}
      follow_redirect!
      expect(response.body).to include('Your article was published.', 'Article title')
    end
  end
end