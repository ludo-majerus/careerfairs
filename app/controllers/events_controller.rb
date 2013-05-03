class EventsController < ApplicationController
  before_filter :require_admin_right, :except => [:index, :show, :documents]
  before_filter :require_company_right, :except => [:show]

  # GET /events
  #Gérer le cas de authentifié mais pas de salon
  def index
    if session[:current_user_authenticated].present?
      @event = Event.where("id in (select event_id from companytoevents where company_id = '?')", session[:company_id]).first
    else     
    end
    if @event == nil
       @event = Event.find(session[:current_event])
     end
    render action: "show"
  end

  # GET /events/1/documents
  def documents
    @event = Event.find(params[:event_id])
  end

  # GET /events/1
  def show
    if params[:id].present?
      @event = Event.find(params[:id])
    elsif session[:current_event].present?
      @event = Event.find(session[:current_event])
    else
      @event = Event.first
    end  
   
    session[:current_event] = @event.id
    respond_to do |format|
      format.html
      format.json { render json: @event }
    end
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
