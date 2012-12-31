class Guest < ActiveRecord::Base
  belongs_to :event
  attr_accessible :email, :firstname, :lastname, :resume, :event_id
end
