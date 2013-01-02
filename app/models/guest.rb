class Guest < ActiveRecord::Base
  belongs_to :event
  attr_accessible :email, :firstname, :lastname, :resume, :event_id
  
  validates :email, :firstname, :lastname, :resume, :presence => true
  validates :resume, :length => { :minimum => 10 }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  
  validates_uniqueness_of :email, :scope => [:email, :event_id],:message => "You're already registred to this event"
end