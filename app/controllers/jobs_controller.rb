require 'httparty'
require 'json'

class JobsController < ApplicationController


  # GET /jobs
  def index

    @DeveloperKey = 'WDH72KM760XDSHG6WMYB' #WD1B37Z74Y7BL07ZM89B
    @DeveloperKey = 'WDHH2VY6TLSDGVJF4S7J' 
    @jobDID = 'J3G0CK6SHTPJ4ZD2VS7'
    @UserDID = 'U8D17K6J4YVZP6R1VPQ'
    @HostSite = 'UK'
    @CountLimit = '5'
    #@url_with_param = 'http://api.careerbuilder.com/v1/recommendations/forjob?DeveloperKey='+@DeveloperKey+'&jobDID='+@jobDID+'&CountLimit='+@CountLimit
    @url_with_param = 'http://apitest.careerbuilder.com/INTLAPI/Feeds/GetFeeds.aspx?DeveloperKey='+@DeveloperKey+'&UserDID='+@UserDID+'&HostSite='+@HostSite
    @url_with_param = 'http://apitest.careerbuilder.com/INTLAPI/Feeds/GetFeeds.aspx?DeveloperKey=WDHH2VY6TLSDGVJF4S7J&UserDID=U8D17K6J4YVZP6R1VPQ&HostSite=UK'
    
    @resultJSON = HTTParty.get(@url_with_param.to_str)
    @resultXML = @resultJSON.response.body

    @jobs = Job.all


  end

  # GET /jobs/1
  def show
    @job = Job.find(params[:id])
  end

  # GET /jobs/new
  def new
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
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render action: "new" 
    end
  end

  # PUT /jobs/1
  def update
    @job = Job.find(params[:id])

    if @job.update_attributes(params[:job])
      redirect_to @job, notice: 'Job was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  # DELETE /jobs/1
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_url
  end
end
