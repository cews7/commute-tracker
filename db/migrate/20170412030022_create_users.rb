class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :provider
      t.string :token
      t.string :token_expires_at

      t.timestamps
    end
  end
end
