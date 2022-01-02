module Contactable
  extend ActiveSupport::Concern

  included do
    validates :phone_number, format: { with: /\A(\d{3})\D*(\d{3})\D*(\d{2})\D*(\d{2})\z/, 
                                        message: "wrong format", allow_blank: true }
    validates :email, format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/, 
                                  message: "wrong format", allow_blank: true }
                                  
    validates :phone_number, presence: true, if: -> { email.blank? }
    validates :email,        presence: true, if: -> { phone_number.blank? }

    def contact_number
      n = phone_number

      unless n.blank?
        "+7 (#{n[0..2]}) #{n[3..5]}-#{n[6..7]}-#{n[8..9]}"
      end
    end
  end
end