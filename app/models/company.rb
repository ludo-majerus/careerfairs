class Company < ActiveRecord::Base
	has_many :contacts
	has_many :companytoevents
	has_many :events, :through => :companytoevents
	attr_accessible :name, :description, :address, :website, :formlocked, :badgeslocked, :lunch, :logo, :comment
end
