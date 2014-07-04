class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :rating, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
