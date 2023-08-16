class Quiz < ApplicationRecord
  has many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  def correct_answer_text
    send("answer#{correct_answer}")
  end
end
