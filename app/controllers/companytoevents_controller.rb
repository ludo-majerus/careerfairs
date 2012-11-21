class CompanytoeventsController < ApplicationController
  # GET /companytoevents
  # GET /companytoevents.json
  def index
    @companytoevents = Companytoevent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companytoevents }
    end
  end

  # GET /companytoevents/1
  # GET /companytoevents/1.json
  def show
    @companytoevent = Companytoevent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @companytoevent }
    end
  end

  # GET /companytoevents/new
  # GET /companytoevents/new.json
  def new
    @companytoevent = Companytoevent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @companytoevent }
    end
  end

  # GET /companytoevents/1/edit
  def edit
    @companytoevent = Companytoevent.find(params[:id])
  end

  # POST /companytoevents
  # POST /companytoevents.json
  def create
    @companytoevent = Companytoevent.new(params[:companytoevent])

    respond_to do |format|
      if @companytoevent.save
        format.html { redirect_to @companytoevent, notice: 'Companytoevent was successfully created.' }
        format.json { render json: @companytoevent, status: :created, location: @companytoevent }
      else
        format.html { render action: "new" }
        format.json { render json: @companytoevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companytoevents/1
  # PUT /companytoevents/1.json
  def update
    @companytoevent = Companytoevent.find(params[:id])

    respond_to do |format|
      if @companytoevent.update_attributes(params[:companytoevent])
        format.html { redirect_to @companytoevent, notice: 'Companytoevent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @companytoevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companytoevents/1
  # DELETE /companytoevents/1.json
  def destroy
    @companytoevent = Companytoevent.find(params[:id])
    @companytoevent.destroy

    respond_to do |format|
      format.html { redirect_to companytoevents_url }
      format.json { head :no_content }
    end
  end
end
