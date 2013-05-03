
class CompanytoeventsController < ApplicationController 
  
  before_filter :require_admin_right, :only => [:index, :new, :create, :destroy]
  before_filter :require_company_right

  # GET /companytoevent
  def index
    @companytoevents = Companytoevent.all
    @stand = Stand.where(:company_id => session[:company_id], :event_id => session[:current_event])  
  end

  # GET /companytoevent/1/edit
  def edit
    @companytoevent = Companytoevent.find(params[:id])
    #render action: "index"
  end

  # GET /companytoevent/1/edit
   def show
     @companytoevent = Companytoevent.find(params[:id])
  end

  # GET /companytoevent/new
  def new
    @companytoevent = Companytoevent.new
  end


  # POST /companytoevent
  def create
    params[:companytoevent][:company_id] = session[:company_id]
    params[:companytoevent][:event_id] = session[:current_event]
    @companytoevent = Companytoevent.new(params[:companytoevent])

    if @companytoevent.save 
      redirect_to companytoevents_path     
    else
      render action: "new"
    end
  end

  # DELETE /companytoevent/1
  def destroy
    @companytoevent = Companytoevent.find(params[:id])
    @companytoevent.destroy

    redirect_to companytoevents_path     
  end

    
end
