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

  def create
    if params[:company_id].blank? or params[:event_id].blank?
      # Return to previous page

    else
      companytoevent = Companytoevent.new
      companytoevent.company_id = params[:company_id]
      companytoevent.event_id = params[:event_id]
      event_id = params[:event_id]
      companytoevent.save
      redirect_to controller: 'companies', :event_id => event_id, action: 'index'
    end
  end

  def destroy
    if params[:id].blank?
      # Return to previous page

    else
      companytoevent = Companytoevent.find(params[:id])
      event_id = companytoevent.event_id
      companytoevent.destroy
      redirect_to controller: 'companies', :event_id => event_id, action: 'index'
    end
  end
end
