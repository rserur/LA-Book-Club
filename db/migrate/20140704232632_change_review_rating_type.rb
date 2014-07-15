class ChangeReviewRatingType < ActiveRecord::Migration
  def change
    remove_column :reviews, :rating, :string
    add_column :reviews, :rating, :integer
  end

end
