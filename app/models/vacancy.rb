class Vacancy < ApplicationRecord
  include Contactable
  # include Skillable
  acts_as_taggable_on :skills

  validates :title, :expiration_date, :salary, :skill_list, presence: true
end
