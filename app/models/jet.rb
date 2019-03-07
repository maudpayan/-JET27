class Jet < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings
  has_many :reviews
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :price_day, presence: true
  validates :pax, presence: true
  validates :address, presence: true
  validates :photo, presence: true
end
