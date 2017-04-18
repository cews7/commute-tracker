class Trip < ApplicationRecord
  validates :commute_name, :address_one, :address_two, presence: true
  geocoded_by :address_one
  geocoded_by :address_two

  after_validation :geocode
end
