class EventsController < ApplicationController
  
  # GET /events 
  def index
    @event = Event.find(session[:current_event])
    render action: "show"
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
    session[:current_event] = @event.id
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
      session[:current_event] = @event.id
      redirect_to @event, notice: 'Event was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /events/1
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /events/1
  def destroy
    @event = Event.find(params[:id])
    session[:current_event] = nil
    @event.destroy

    redirect_to events_url
  end
end
