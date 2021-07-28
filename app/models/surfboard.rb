class Surfboard < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo
  # We will need to add the line below once we incorporate cloudinary
  # has_one_attached :photo

  validates :length, :volume, :price_per_day, presence: true, numericality: { only_integer: true }
  validates :name, :board_type, :fin_type, :brand, :description, presence: true
end
