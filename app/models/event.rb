class Event < ActiveRecord::Base
	has_many :event_detail
	has_many :companytoevent
end
