class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :surfboard
  has_many :reviews

  validates :collection_date, :return_date, :price_per_day, presence: true
  before_validation :add_price_per_day

  def add_price_per_day
    # raise
    self.price_per_day = surfboard.price_per_day
  end
end
