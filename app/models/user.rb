class User < ApplicationRecord
  validates :uid, :provider, :first_name, :last_name, :image, :token, :token_expires_at, presence: true
  def self.from_omniauth(auth)
    user                  = User.find_or_create_by(uid:auth["uid"])
    user.uid              = auth["uid"]
    user.provider         = auth["provider"]
    user.first_name       = auth["info"]["first_name"]
    user.last_name        = auth["info"]["last_name"]
    user.image            = auth["info"]["image"]
    user.token            = auth["credentials"]["token"]
    user.token_expires_at = auth["credentials"]["expires_at"]
    user.save
    user
  end
end
