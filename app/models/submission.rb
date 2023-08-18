class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  validates :user_answers, presence: true
  

  def init
    self.user_answers ||= {}
  end

  def percentage_score
    ((self.score / quiz.questions.count) * 100).to_i
  end
end
