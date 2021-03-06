class Place < ApplicationRecord
  belongs_to :user
  validates :name, :address, :description, presence: true
  validates :name, length: { minimum: 3 }

  has_many :comments
  has_many :photos

  geocoded_by :address
  after_validation :geocode
end
