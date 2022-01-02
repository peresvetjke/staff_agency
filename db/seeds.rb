# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |v| 
  vacancy = Vacancy.create!(title: "Vacancy #{v+1}", 
                         expiration_date: Time.now + 90.days, 
                         salary: 10000 + 1000 * (v + 1),
                         email: "hh#{v+1}@mail.ru",
                         skill_list: ["good", "bad", "evil"] )
end

10.times do |c| 
  candidate = Candidate.create!(name: "Имя", 
                           middle_name: "Фамилия", 
                           surname: "Отчество", 
                           desired_salary: 10000 + 1000 * (c + 1),
                           status: rand(2),
                           email: "candidate#{c+1}@mail.ru",
                           skill_list: ["good", "bad", "evil"] )
end