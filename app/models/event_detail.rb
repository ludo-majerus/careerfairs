class EventDetail < ActiveRecord::Base
  belongs_to :event
  attr_accessible :event_id, :key, :value
end
