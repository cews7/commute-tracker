require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should validate_presence_of(:commute_name) }
  it { should validate_presence_of(:address_one) }
  it { should validate_presence_of(:address_two) }
end
