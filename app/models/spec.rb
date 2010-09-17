class Spec < ActiveRecord::Base
  belongs_to :user

  attr_accessible :user_id, :first_name, :last_name, :gender, :birthdate, :state_of_origin, :local_government_area, :residential_address, :city, :state, :zip_code, :occupation, :mobile_number, :home_number, :state_of_participation, :payment_method, :bank_name, :account_name, :account_number, :teller_number, :photo

  ALL_FIELDS = %w(first_name last_name gender birthdate state_of_origin local_government_area residential_address city state zip_code occupation mobile_number home_number state_of_participation payment_method bank_name account_name account_number teller_number)

  VALID_GENDERS = ["Male", "Female"]
  START_YEAR = 1900
  VALID_DATES = DateTime.new(START_YEAR)..DateTime.now
  ZIP_CODE_LENGTH = 5

  validates_inclusion_of  :gender,
                          :in => VALID_GENDERS,
                          :allow_nil => true,
                          :message => "must be male or female"

  validates_inclusion_of  :birthdate,
                          :in => VALID_DATES,
                          :allow_nil => true,
                          :message => "is invalid"

  validates_format_of     :zip_code, :with => /(^$|^[0-9]{#{ZIP_CODE_LENGTH}}$)/,
                          :message => "must be a five digit number"

  # Return the full name (first plus last)
  def full_name
    [first_name, last_name].join(" ")
  end

  # Return a sensibly formatted location string.
  def location
    [city, state, zip_code].join(" ")
  end
end

