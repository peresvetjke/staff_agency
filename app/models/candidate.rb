class Candidate < ApplicationRecord
  include Contactable
  acts_as_taggable_on :skills
  enum status: [ :active_search, :employed ]
  
  validates :desired_salary, :name, :middle_name, :surname, :skill_list, presence: true
  validates :name, :middle_name, :surname, format: { with: /[а-я]+/i,
                                                     message: "only cyrillic letters without spaces" }

  def full_name
    "#{surname} #{name} #{middle_name}"
  end
end
