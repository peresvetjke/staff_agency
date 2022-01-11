class Vacancy < ApplicationRecord
  include Contactable
  acts_as_taggable_on :skills  
  
  ThinkingSphinx::Callbacks.append(self, :tag, :behaviours => [:real_time], :path => [:skills])

  validates :title, :expiration_date, :salary, :skill_list, presence: true

  default_scope { order(salary: :desc) }
end
