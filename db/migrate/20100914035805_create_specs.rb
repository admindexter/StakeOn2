class CreateSpecs < ActiveRecord::Migration
  def self.up
    create_table :specs do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.datetime :birthdate
      t.string :state_of_origin
      t.string :local_government_area
      t.text :residential_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :mobile_number
      t.string :home_number
      t.string :state_of_participation
      t.string :payment_method
      t.string :account_name
      t.string :account_number
      t.string :teller_number
      t.timestamps
    end
  end

  def self.down
    drop_table :specs
  end
end

