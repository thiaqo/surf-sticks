class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Bookings and reviews should maybe not be dependent destroy in final
  has_many :bookings, dependent: :destroy
  has_many :surfboards, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
end
