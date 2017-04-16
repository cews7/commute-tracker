class Trip < ApplicationRecord
  geocoded_by :address_one
  geocoded_by :address_two

  after_validation :geocode 
end
