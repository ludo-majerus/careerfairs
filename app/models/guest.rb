class Guest < ActiveRecord::Base
  VALID_STATUS = {0=> 'a checker',1=> 'valide',-1 => 'refuse'}
  
  belongs_to :event
  attr_accessible :email, :firstname, :lastname, :resume, :event_id, :status
  validates :email, :firstname, :lastname, :resume, :presence => true
  validates :resume, :length => { :minimum => 10 }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates_inclusion_of :status, :in => VALID_STATUS.keys  
  validates_uniqueness_of :email, :scope => [:email, :event_id],:message => "You're already registred to this event"
  
  def self.status
     VALID_STATUS
  end
end