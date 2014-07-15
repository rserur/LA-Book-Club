class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :author_id, null: false
      t.integer :year, null: false
      t.text :description
      t.integer :category_id

      t.timestamps
    end
  end
end
