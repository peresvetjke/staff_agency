FactoryBot.define do
  factory :candidate do
    after(:build) { |candidate| candidate.skills.push(create(:skill)) }

    name        { "Петр" }
    surname     { "Петров" }
    middle_name { "Петрович" }
    desired_salary { 1 }
    status { 1 }
    phone_number { "7776665544" }
    email { "mail@example.com" }
  end
end
