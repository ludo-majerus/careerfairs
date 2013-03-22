class CompanytoeventsController < ApplicationController

  # GET /companytoevent
  def index
    @companytoevents = Companytoevent.where("company_id = '" + params[:company_id].to_s + "'" + " and event_id = '" + params[:event_id].to_s + "'")

  end

  # GET /companytoevent/1/edit
  def edit
    @companytoevent = Companytoevent.find(params[:id])
    @companytoevents = Companytoevent.where("company_id = '" + params[:company_id].to_s + "'"  + " and event_id = '" + params[:event_id].to_s + "'")
    render action: "index"
  end

  # GET /companytoevent/1/edit
   def show
     @companytoevent = Companytoevent.find(params[:id])
  end

  # GET /contacts/new
  def new
    @companytoevent = Companytoevent.new
  end

end
