class Candidate < ApplicationRecord
  include Contactable
  include Skillable

  validates :status, :desired_salary, :name, :middle_name, :surname, presence: true
  validates :name, :middle_name, :surname, format: { with: /[а-я]+/i,
                                                     message: "only cyrillic letters without spaces" }

  def full_name
    "#{surname} #{name} #{middle_name}"
  end
end
