class Vacancy < ApplicationRecord
  include Contactable
  include Skillable

  validates :title, :expiration_date, :salary, presence: true
end
