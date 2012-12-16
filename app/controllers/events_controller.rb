class EventsController < ApplicationController
  
  # GET /events 
  def index
    @events = Event.order("created_at DESC")
    if params["event_id"].present?
      @current_event = Event.find(params["event_id"])
    else
      @current_event = Event.where("date_event > ?", DateTime.now).order("created_at").first || Event.first
    end
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
  end

  # POST /events
  def create
    @event = Event.new(params[:event])

    if @event.save
      redirect_to events_url, notice: 'Event was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /events/1
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to events_url, notice: 'Event was successfully updated.'
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
