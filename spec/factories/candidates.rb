FactoryBot.define do
  factory :candidate do
    name        { "Петр" }
    surname     { "Петров" }
    middle_name { "Петрович" }
    desired_salary { 1 }
    status { 1 }
    phone_number { "7776665544" }
    email { "mail@example.com" }
    skill_list { ["good", "bad", "evil"] }
  end
end
