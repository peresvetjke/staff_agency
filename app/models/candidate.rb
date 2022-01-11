class Candidate < ApplicationRecord
  include Contactable
  acts_as_taggable_on :skills
  enum status: [ :active_search, :employed ]

  ThinkingSphinx::Callbacks.append(self, :tag, :behaviours => [:real_time], :path => [:skills])
    
  validates :desired_salary, :name, :middle_name, :surname, :skill_list, :status, presence: true
  validates :name, :middle_name, :surname, format: { with: /[а-я]+/i,
                                                     message: "only cyrillic letters without spaces" }

  def full_name
    "#{surname} #{name} #{middle_name}"
  end
end
