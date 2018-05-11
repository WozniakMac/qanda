FactoryBot.define do
  factory :answer do
    body 'MyText'
    association :question
    association :user
  end

  factory :question do
    title 'Title'
    body 'Body'
    association :user
  end

  factory :user do
    provider 'provider'
    uid 'randomUid'
    first_name 'Grzegoz'
    last_name 'Kovalsky'
    email 'grzegorz@kovalsky@test.test'
  end
end
