class Author < ActiveRecord::Base
  has_many :books

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :first_name, scope: :last_name
end
