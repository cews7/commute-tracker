require 'rails_helper'
describe "A user" do
  it "can login using google" do
    VCR.use_cassette("login") do
      Trip.create!(commute_name: "Dad's", address_one: "1017 Dogwood Drive Golden CO", address_two: "6925 east Dickenson place denver CO")

      visit '/'

      expect(page).to have_content("CommuteTracker")
      expect(page).to have_content("Welcome!")
      expect(page).to have_content("Sign in With Google")
    end
  end
end
