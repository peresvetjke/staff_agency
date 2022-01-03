class Vacancy < ApplicationRecord
  include Contactable
  
  default_scope { order(salary: :desc) }

  acts_as_taggable_on :skills

  validates :title, :expiration_date, :salary, :skill_list, presence: true
end
