class AddCompleteToSubmission < ActiveRecord::Migration[7.0]
  def change
    add_column :submissions, :completed, :boolean, default: false, null: false
  end
end
