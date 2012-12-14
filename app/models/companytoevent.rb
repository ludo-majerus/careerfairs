class Companytoevent < ActiveRecord::Base
  belongs_to :company
  belongs_to :event
  attr_accessible :company_id, :event_id
end