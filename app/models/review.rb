class Review < ActiveRecord::Base
  belongs_to :book

  validates :rating, presence: true
  validates :rating, inclusion: { in: 1..5 }
  validates :body, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
