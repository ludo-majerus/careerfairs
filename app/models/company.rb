class Company < ActiveRecord::Base
	has_many :companytoevent
	has_many :contact
	attr_accessible :name, :description, :address, :website, :formlocked, :badgeslocked, :lunch, :logo, :comment
end
