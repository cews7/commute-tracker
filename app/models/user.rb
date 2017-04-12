class User < ApplicationRecord
  def self.from_omniauth(auth)
    binding.pry
  end
end
