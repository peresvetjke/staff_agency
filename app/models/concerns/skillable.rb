module Skillable
  extend ActiveSupport::Concern

  included do
    acts_as_taggable_on :skills
  
    # has_many :assigned_skills, as: :skillable, dependent: :destroy
    # has_many :skills, through: :assigned_skills, class_name: "Skill"

    # validates :skills, presence: true
  end
end