FactoryBot.define do
  factory :category, class: Category do
    name {'Category 1'}
    priority {1}
  end

  factory :category2, class: Category do
    name {'Category 2'}
    priority {2}
  end

  factory :category3, class: Category do
    name {'Category 3'}
    priority {3}
  end

  factory :category4, class: Category do
    name {'Category 4'}
    priority {4}
  end

  factory :category5, class: Category do
    name {'Category 5'}
    priority {5}
  end
end