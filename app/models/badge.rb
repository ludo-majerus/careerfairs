class Badge < ActiveRecord::Base
	belongs_to :companytoevent
	has_one :company, :through => :companytoevent
	has_one :event, :through => :companytoevent
	attr_accessible :companytoevent_id, :name
	validates :companytoevent_id, :name, :presence => true
end
