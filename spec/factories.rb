FactoryBot.define do
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
