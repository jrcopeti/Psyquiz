class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  def init
    self.user_answers ||= {}
  end
end
