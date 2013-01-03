class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :set_locale, :select_event, :list_events

	def set_locale
		I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
		session[:locale] = I18n.locale
	end

	def select_event
		if session[:current_event].nil?
		    pickOneEvent = Event.where("date_event > ?", DateTime.now).order("created_at").first || Event.first
		    session[:current_event] = pickOneEvent.id
		end
	end

	def list_events
		@events = Event.order("created_at DESC")
	end

end
