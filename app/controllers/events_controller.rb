class EventsController < ApplicationController
  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @event_detail = Event.find(params[:id]).event_detail

    subscription_open = @event_detail.where("key='ed:subscription_open'").first
    @subscription_open_value = subscription_open.value if subscription_open != nil

    customer_list_open = @event_detail.where("key='ed:customer_list_open'").first
    @customer_list_open_value = customer_list_open.value if customer_list_open != nil

    location = @event_detail.where("key='ed:location'").first
    @location_value = location.value if location != nil

    date = ''
  end

  # POST /events
  def create
    @event = Event.new(params[:event])

    if @event.save
      params.each do |key, value| 
        if (key.to_s[/ed:*/])
          ed =  EventDetail.new
          ed.event_id = @event.id
          ed.key = key
          ed.value = value
          ed.save
        end
      end
      redirect_to @event, notice: 'Event was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /events/1
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      @event.event_detail.destroy_all
      params.each do |key, value| 
        if (key.to_s[/ed:*/])
          ed =  EventDetail.new
          ed.event_id = @event.id
          ed.key = key
          ed.value = value
          ed.save
        end
      end
      redirect_to @event, notice: 'Event was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  # DELETE /events/1
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_url 
  end
end