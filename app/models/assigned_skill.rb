class AssignedSkill < ApplicationRecord
  belongs_to :skillable, polymorphic: true
  belongs_to :skill
end