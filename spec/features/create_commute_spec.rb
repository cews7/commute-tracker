require 'rails_helper'

describe "User" do
  it "visits dashboard page" do
    VCR.use_cassette("create_commute") do
      Trip.create!(commute_name: "Dad's", address_one: "1017 Dogwood Drive Golden CO", address_two: "6925 east Dickenson place denver CO")
      user = OpenStruct.new(
      first_name: 'Eric',
      last_name: 'Wahlgren-Sauro',
      oauth_token: ENV['GOOGLE_TOKEN']
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/trips/new'

      expect(page).to have_content("Welcome, Eric!")
      expect(page).to have_content("New Commute")
      expect(page).to have_content("Commute name")
      expect(page).to have_content("Origin point")
      expect(page).to have_content("Destination")


      fill_in('trip_commute_name', :with => 'Work')
      fill_in('trip_address_one', :with => '1017 Dogwood Drive Golden CO')
      fill_in('trip_address_two', :with => '6925 east Dickenson place denver CO')
      within(".new_trip") do
        click_on("Create Commute")
      end

      expect(current_path).to eq "/"
      expect(Trip.count).to eq 2
    end
  end
end
