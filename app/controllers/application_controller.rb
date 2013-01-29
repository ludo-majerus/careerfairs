class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :set_locale, :select_event, :list_events

	def set_locale
		I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
		session[:locale] = I18n.locale
	end

	def select_event
		if params[:event_id].present?
			session[:current_event] = params[:event_id]
		elsif session[:current_event].nil?
		    nextEvent = Event.where("date_event > ?", DateTime.now).order("created_at").first || Event.first
		    session[:current_event] = nextEvent.id
		end
	end

	def list_events
		@events = Event.order("created_at DESC")
	end

	def require_admin_right
		if session[:current_user_admin].nil?
			redirect_to sessions_new_path, notice: 'You need to have admin rights to access this area.'
		end
	end

	def require_company_right
		if session[:current_user_authenticated].nil? 
			redirect_to sessions_new_path, notice: 'You need to be authenticated to access this area.'
		else
			session[:company_id] = Contact.find(session[:current_user_authenticated]).company_id
		end
	end

end
