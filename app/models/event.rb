class Event < ActiveRecord::Base
  attr_accessible :date, :hour_begin, :hour_end, :location, :site_id
end
