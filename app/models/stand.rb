class Stand < ActiveRecord::Base
	belongs_to :event
	belongs_to :company
	attr_accessible :company_id, :event_id, :name, :size
	validates :event_id, :name, :size, :presence => true
end
