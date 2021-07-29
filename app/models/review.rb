class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  has_one :surfboard, through: :bookings

  validates :comment, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..5 }
end
