require 'rails_helper'

RSpec.describe User, type: :model do
  context 'creation test' do
    it 'ensures users can be created' do
      user = User.new(name: 'name', email: 'email@email.com', password: 'asdfasdf').save
      expect(user).to eq(true)
    end

    it 'ensures user names are unique' do
      user = User.new(name: 'name', email: 'email@email.com', password: 'asdfasdf').save
      user2 = User.new(name: 'name', email: 'email2@email.com', password: 'asdfasdf').save
      expect(user2).to eq(false)
    end

    it 'ensures user emails are unique' do
      user = User.new(name: 'name', email: 'email@email.com', password: 'asdfasdf').save
      user2 = User.new(name: 'name2', email: 'email@email.com', password: 'asdfasdf').save
      expect(user2).to eq(false)
    end

    it 'ensures users can be created' do
      user = User.new(name: 'name', email: 'email@email.com', password: 'asdfasdf').save
      expect(user).to eq(true)
    end
  end
end
