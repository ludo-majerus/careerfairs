class Event < ActiveRecord::Base
	has_many :companytoevents
	has_many :companies, :through => :companytoevents
end
