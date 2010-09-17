class Press < ActiveRecord::Base
  attr_accessible :title, :location, :date_of_event, :emphasis, :author, :information, :photo

  acts_as_textiled :information

  validates_uniqueness_of :title
  validates_presence_of :title, :information
end

