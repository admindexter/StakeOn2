class Spec < ActiveRecord::Base
  belongs_to :user

  attr_accessible :user_id, :first_name, :last_name, :gender, :birthdate, :state_of_origin, :local_government_area, :residential_address, :city, :state, :zip_code, :occupation, :mobile_number, :home_number, :state_of_participation, :payment_method, :bank_name, :account_name, :account_number, :teller_number, :photo

  has_attached_file :photo, :styles => { :thumbnail => "100x100>", :portrait => "150x150>",
                    :snapshot => "200x200", :medium => "180x180>", :standard => "300x300>",
                    :preview => "500x500>" },
  					        :url => "/assets/articles/:id/:style/:basename.:extension",
  					        :path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"

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

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 500.kilobytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']

  # Return the full name (first plus last)
  def full_name
    [first_name, last_name].join(" ")
  end

  # Return a sensibly formatted location string.
  def location
    [city, state, zip_code].join(" ")
  end
end

