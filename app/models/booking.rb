class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :surfboard
  has_many :reviews

  validates :collection_date, :return_date, :price_per_day, presence: true
end
