module EventsHelper
	def prepare_form

	    if @event_detail != nil
	      subscription_open = @event_detail.where("key='ed:subscription_open'").first
	      if subscription_open != nil
	        subscription_open_choice = subscription_open.value
	      end

	      customer_list_open = @event_detail.where("key='ed:customer_list_open'").first
	      if customer_list_open != nil
	        customer_list_open_choice = customer_list_open.value
	      end

	      location = @event_detail.where("key='ed:location'").first.value
	    end
	end
end
