class AddIndexes < ActiveRecord::Migration
  def change
    add_index :authors, [:first_name, :last_name], unique: true
    add_index :books, [:title, :author_id], unique: true
  end
end
