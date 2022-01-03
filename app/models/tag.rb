class Tag < ApplicationRecord
  ThinkingSphinx::Callbacks.append(self, :behaviours => [:real_time])
end