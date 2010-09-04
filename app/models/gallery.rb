class Gallery < ActiveRecord::Base
  attr_accessible :title, :location, :date_of_event, :photographer, :photo

  has_attached_file :photo, :styles => { :thumbnail => "130x130>", :portrait => "150x150>",
                    :snapshot => "200x200", :medium => "180x180>", :standard => "300x300>",
                    :preview => "500x500>" },
  					        :url => "/assets/articles/:id/:style/:basename.:extension",
  					        :path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"

  validates_uniqueness_of :title
  validates_presence_of :title

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 500.kilobytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']
end

