class AddAnswer4ToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :answer4, :string
  end
end
