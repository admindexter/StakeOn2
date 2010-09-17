class User < ActiveRecord::Base
  has_one :spec

  attr_accessible :username, :email, :password, :password_confirmation, :photo
  acts_as_authentic

  has_attached_file :photo, :styles => { :thumbnail => "100x100>", :portrait => "150x150>",
                    :snapshot => "200x200", :medium => "180x180>", :standard => "300x300>",
                    :preview => "500x500>" },
  					        :url => "/assets/articles/:id/:style/:basename.:extension",
  					        :path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 500.kilobytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']
end

