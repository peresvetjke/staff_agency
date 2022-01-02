class Candidate < ApplicationRecord
  include Contactable
  # include Skillable

  acts_as_taggable_on :skills
  
  validates :status, :desired_salary, :name, :middle_name, :surname, :skill_list, presence: true
  validates :name, :middle_name, :surname, format: { with: /[а-я]+/i,
                                                     message: "only cyrillic letters without spaces" }

  def full_name
    "#{surname} #{name} #{middle_name}"
  end
end
