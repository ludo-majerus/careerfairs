class JobDetailsController < ApplicationController
  # GET /job_details
  # GET /job_details.json
  def index
    @job_details = JobDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_details }
    end
  end

  # GET /job_details/1
  # GET /job_details/1.json
  def show
    @job_detail = JobDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_detail }
    end
  end

  # GET /job_details/new
  # GET /job_details/new.json
  def new
    @job_detail = JobDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_detail }
    end
  end

  # GET /job_details/1/edit
  def edit
    @job_detail = JobDetail.find(params[:id])
  end

  # POST /job_details
  # POST /job_details.json
  def create
    @job_detail = JobDetail.new(params[:job_detail])

    respond_to do |format|
      if @job_detail.save
        format.html { redirect_to @job_detail, notice: 'Job detail was successfully created.' }
        format.json { render json: @job_detail, status: :created, location: @job_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @job_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_details/1
  # PUT /job_details/1.json
  def update
    @job_detail = JobDetail.find(params[:id])

    respond_to do |format|
      if @job_detail.update_attributes(params[:job_detail])
        format.html { redirect_to @job_detail, notice: 'Job detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_details/1
  # DELETE /job_details/1.json
  def destroy
    @job_detail = JobDetail.find(params[:id])
    @job_detail.destroy

    respond_to do |format|
      format.html { redirect_to job_details_url }
      format.json { head :no_content }
    end
  end
end
