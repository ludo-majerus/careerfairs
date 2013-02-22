class Company < ActiveRecord::Base
	has_many :contacts
	has_many :stands
	has_many :companytoevents
	has_many :events, :through => :companytoevents
	has_many :badges, :through => :companytoevents
	has_many :jobs, :through => :companytoevents

	attr_accessible :name, :description, :address, :website, :formlocked, :badgeslocked, :lunch, :pic, :comment

	has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>"}

	validates_attachment_content_type :pic, :content_type => ['image/jpeg', 'image/png','image/gif']
    
end
