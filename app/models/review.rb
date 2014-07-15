class Review < ActiveRecord::Base
  belongs_to :book

  validates :rating, presence: true
  validates :rating, inclusion: { in: 1..5 }
  validates :body, presence: true
end
