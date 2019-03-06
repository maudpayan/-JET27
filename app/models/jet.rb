class Jet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :price_day, presence: true
  validates :pax, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :zipcode, presence: true
  validates :photo, presence: true
end
