class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
  accepts_nested_attributes_for :author

  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :year, presence: true
  validates :year, length: { is: 4 }

end
