class Event < ActiveRecord::Base
	has_many :companytoevents
	has_many :companies, :through => :companytoevents
	has_many :badges, :through => :companytoevents
	has_many :jobs, :through => :companytoevents
	has_many :guests
	attr_accessible :city, :address, :date_event, :time_start, :time_end, :subscription_open, :list_customers_open, :date_end_badges, :date_end_customers, :url_event_plan, :url_catalog, :url_technical_info

	validates :city, :date_event, :presence => true
	validates :city, :length => { :minimum => 2 }

  def event_name
      "#{city} - #{date_event.strftime("%d/%m/%Y")}"
  end 
end