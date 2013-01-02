class ContactMailer < ActionMailer::Base
	default :from => "salon@lesjeudis.com"
	def welcome_email()
		mail(:to => "ludo@lesjeudis.com", :subject => "Test Ludo")
	end
end