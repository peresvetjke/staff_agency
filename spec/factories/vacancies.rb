FactoryBot.define do
  factory :vacancy do
    title { "MyString" }
    expiration_date { "2021-12-30" }
    salary { 1 }
    phone_number { 9998887755 }
    email { "email@example.com" }
    skill_list { ["good", "bad", "evil"] }
  end
end
