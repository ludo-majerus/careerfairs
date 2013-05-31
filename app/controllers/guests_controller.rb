class GuestsController < ApplicationController
  before_filter :require_admin_right, :except => [:new]
  # GET /guests
  # GET /guests.json
  def index
    if params[:status].present?
      @guests = Guest.all(:conditions => { :event_id => params[:event_id],:status => params[:status]})
    else
      @guests = Guest.all(:conditions => { :event_id => params[:event_id],:status => 0 })
    end  
    @event = Event.find(params[:event_id])
    respond_to do |format|
      format.html # index.html.erb
      format.js {}
    end
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
    @guest = Guest.find(params[:id])
    @event = Event.find(@guest.event_id) 
    respond_to do |format|
      format.html # show.html.erb
      format.json {}
    end
  end
    
  def validGuest
    begin
      @guest = Guest.find(params[:id])
      @guest.status = 1 
      respond_to do |format|
        @guest.save
        format.js {}
      end
    rescue
      @guest = Guest.new
      @guest.errors[:base] << "Y a une couille mec, c'est mort pour toi, pleure !"  
    end
  end
  
  def refuseGuest
    begin
      @guest = Guest.find(params[:id])
      @guest.status = -1 
      respond_to do |format|
        @guest.save
        format.js {}
      end
    rescue
      @guest = Guest.new
      @guest.errors[:base]<< "Y a une couille mec, c'est mort pour toi, pleure !"   
    end
  end
  
  def reinitializeGuest
    begin
      @guest = Guest.find(params[:id])
      @guest.status = 0 
      respond_to do |format|
        @guest.save
        format.js {}
      end
    rescue
      @guest = Guest.new
      @guest.errors[:base] << "Y a une couille mec, c'est mort pour toi, pleure !"  
    end
  end
  
  
 # GET /guests/new
  # GET /guests/new.json
  def new
    @guest = Guest.new
    if params[:event_id].present?
      @event = Event.find(params[:event_id])
    else
       @event = Event.find(:first)
    end  

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guest }
    end
  end

  # GET /guests/1/edit
  def edit
    @guest = Guest.find(params[:id])
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(params[:guest])
    @event = Event.find(@guest.event_id)    
    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'Guest was successfully created.' }
        format.json { render json: @guest, status: :created, location: @guest_event_new }
      else
        format.html { render action: "new" }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guests/1
  # PUT /guests/1.json
  def update
    @guest = Guest.find(params[:id])

    respond_to do |format|
      if @guest.update_attributes(params[:guest])
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy

    respond_to do |format|
      format.html { redirect_to guests_url }
      format.json { head :no_content }
    end
  end
end
