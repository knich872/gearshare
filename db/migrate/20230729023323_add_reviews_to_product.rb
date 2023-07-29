class AddReviewsToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :reviews, :text, array: true, default: []
  end
end
