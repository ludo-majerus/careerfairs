class JobseekersController < ApplicationController
  # GET /jobseekers
  # GET /jobseekers.json
  def index
    @jobseekers = Jobseeker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobseekers }
    end
  end

  # GET /jobseekers/1
  # GET /jobseekers/1.json
  def show
    @jobseeker = Jobseeker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jobseeker }
    end
  end

  # GET /jobseekers/new
  # GET /jobseekers/new.json
  def new
    @jobseeker = Jobseeker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jobseeker }
    end
  end

  # GET /jobseekers/1/edit
  def edit
    @jobseeker = Jobseeker.find(params[:id])
  end

  # POST /jobseekers
  # POST /jobseekers.json
  def create
    @jobseeker = Jobseeker.new(params[:jobseeker])

    respond_to do |format|
      if @jobseeker.save
        format.html { redirect_to @jobseeker, notice: 'Jobseeker was successfully created.' }
        format.json { render json: @jobseeker, status: :created, location: @jobseeker }
      else
        format.html { render action: "new" }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobseekers/1
  # PUT /jobseekers/1.json
  def update
    @jobseeker = Jobseeker.find(params[:id])

    respond_to do |format|
      if @jobseeker.update_attributes(params[:jobseeker])
        format.html { redirect_to @jobseeker, notice: 'Jobseeker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobseekers/1
  # DELETE /jobseekers/1.json
  def destroy
    @jobseeker = Jobseeker.find(params[:id])
    @jobseeker.destroy

    respond_to do |format|
      format.html { redirect_to jobseekers_url }
      format.json { head :no_content }
    end
  end
end
