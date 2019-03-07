class Review < ApplicationRecord
  belongs_to :jet
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
end
