class Goal < ApplicationRecord
  validates :title, :description, presence: true
end
