module Contactable
  extend ActiveSupport::Concern

  included do
    validates :phone_number, format: { with: /\A(\d{3})\D*(\d{3})\D*(\d{2})\D*(\d{2})\z/,
                                       message: "wrong format" }
    validates :email, format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/, message: "wrong format" }
  end
end