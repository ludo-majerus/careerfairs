
class CompanytoeventsController < ApplicationController 
  
  before_filter :require_admin_right, :only => [:index, :new, :create, :destroy]
  before_filter :require_company_right

  # GET /companytoevent
  def index
    @companytoevents =Companytoevent.where(:company_id => session[:company_id], :event_id => session[:current_event])
    @stand = Stand.where(:company_id => session[:company_id], :event_id => session[:current_event])
  end

  def list
    @companytoevents = Companytoevent.all
    @sumlunch = Companytoevent.sum(:lunch)
    @sumdesk = Companytoevent.sum(:desk)
    @sumchair = Companytoevent.sum(:chair)
    @sumtable = Companytoevent.sum(:table)
    @sumtrash = Companytoevent.sum(:trash)
    @sumclothesrack = Companytoevent.sum(:clothesrack)
    @sumshelf = Companytoevent.sum(:shelf)
  end

  # GET /companytoevent/1/edit
  def edit
    @companytoevent = Companytoevent.find(params[:id])
  end

  # GET /companytoevent/1/edit
   def show
     @companytoevent = Companytoevent.find(params[:id])
  end

  # PUT /companytoevent/1
  def update
    
    params[:companytoevent][:company_id] = session[:company_id]
    params[:companytoevent][:event_id] = session[:current_event]

    @companytoevent = Companytoevent.find(params[:id])
    if @companytoevent.update_attributes(params[:companytoevent])
      redirect_to companytoevents_path, notice: 'Company was successfully updated.'
    else
      render action: "edit" 
    end
  end

 end
