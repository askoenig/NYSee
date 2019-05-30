class AddReviewToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :review, :text
  end
end
