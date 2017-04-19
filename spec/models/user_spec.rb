require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:token_expires_at) }
end
