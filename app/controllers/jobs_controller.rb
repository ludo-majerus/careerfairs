class JobsController < ApplicationController
  # GET /jobs
  def index
    @jobs = Job.where("companytoevent_id = '" + params[:companytoevent_id].to_s + "'")
    respond_to do |format|
      format.html
    end
  end

  # GET /jobs/new
  def new
    @companytoevent = Companytoevent.find(params[:companytoevent_id])
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  def create
    @job = Job.new(params[:job])

    if @job.save
      redirect_to companytoevent_jobs_path @job.companytoevent_id, notice: 'Job was successfully created.'
    else
      render action: "new" 
    end
    
  end

  # PUT /jobs/1
  def update
    @job = Job.find(params[:id])

    if @job.update_attributes(params[:job])
      redirect_to companytoevent_jobs_path @job.companytoevent_id, notice: 'Job was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /jobs/1
  def destroy
    @job = Job.find(params[:id])
    c2e_id = @job.companytoevent_id
    @job.destroy

    redirect_to companytoevent_jobs_path c2e_id
  end
end
