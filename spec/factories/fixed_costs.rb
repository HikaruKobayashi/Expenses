FactoryBot.define do
  factory :fixed_cost do
    sequence(:name) { |n| "TEST_NAME#{n}"}
  end
end
