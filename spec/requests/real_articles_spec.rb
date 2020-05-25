require 'rails_helper'

RSpec.describe 'real', type: :request do
  def log_in(user)
    sign_in user
  end

  context 'before login' do
    it 'ensures home page shows up to user' do
      get root_path
      expect(response.body).to include('Log in')
    end
  end

  context 'real-articles' do
    before :all do
      user = User.create!(name: 'Mike', email: 'mike@users.com', password: 'asdfasdf')
      log_in(user)
    end

    after :all do
      User.delete_all
    end

    it 'logs into session for user' do
      get root_path
      expect(response.body).to include('Account')
    end

    it 'opens article writer' do
      get articles_new_path
      expect(response.body).to include('Article Composer')
    end

    it 'creates an article' do
      other_user = User.create!(name: 'Mike2', email: 'mike2@users.com', password: 'asdfasdf')
      log_in(other_user)
      post articles_new_path, params: { title: 'Article title', text: 'article text', image: '', category: '1,3,' }
      follow_redirect!
      expect(response.body).to include('Your article was published.', 'Article title')
    end
  end
end
