class Job < ActiveRecord::Base
	belongs_to :companytoevent
	has_one :company, :through => :companytoevent
	has_one :event, :through => :companytoevent
	attr_accessible :companytoevent_id, :title, :category, :experience
	validates :companytoevent_id, :presence => true
end
