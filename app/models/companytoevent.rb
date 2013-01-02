class Companytoevent < ActiveRecord::Base
  belongs_to :company
  belongs_to :event
  has_many :jobs
  has_many :badges
  attr_accessible :company_id, :event_id
end