FactoryBot.define do
  factory :user, class: User do
    email {'user@users.com'}
    name {'user1'}
    password {'asdfasdf'}
  end

  factory :user2, class: User do
    email {'user2@users.com'}
    name {'user2'}
    password {'asdfasdf'}
  end

  factory :user3, class: User do
    email {'user3@users.com'}
    name {'user3'}
    password {'asdfasdf'}
  end

  factory :user4, class: User do
    email {'user4@users.com'}
    name {'user4'}
    password {'asdfasdf'}
  end
end