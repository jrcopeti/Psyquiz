class Question < ApplicationRecord
  belongs_to :quiz
  validates :correct_answer, inclusion: { in: 1..4 }
  validates :content, :answer1, :answer2, :answer3, :answer4, presence: true
  has_one_attached :image
end
