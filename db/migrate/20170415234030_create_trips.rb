class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.float :longitude
      t.float :latitude
      t.string :address_one
      t.string :address_two
      t.string :commute_name

      t.timestamps
    end
  end
end
