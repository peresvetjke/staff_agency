FactoryBot.define do
  factory :vacancy do
    after(:build) { |vacancy| vacancy.skills.push(create(:skill)) }

    title { "MyString" }
    expiration_date { "2021-12-30" }
    salary { 1 }
    phone_number { 9998887755 }
    email { "email@example.com" }
  end
end
