class Company < ActiveRecord::Base
	has_many :contacts
	has_many :stands
	has_many :companytoevents
	has_many :events, :through => :companytoevents
	has_many :badges, :through => :companytoevents
	has_many :jobs, :through => :companytoevents

	attr_accessible :name, :description, :address, :website, :formlocked, :badgeslocked, :lunch, :logo, :comment
end
