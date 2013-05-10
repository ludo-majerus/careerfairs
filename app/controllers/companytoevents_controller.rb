
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
 
  # def create
  #   if params[:company_id].blank? or params[:event_id].blank?
  #     # Return to previous page

  #   else
  #     companytoevent = Companytoevent.new
  #     companytoevent.company_id = params[:company_id]
  #     companytoevent.event_id = params[:event_id]
  #     event_id = params[:event_id]
  #     companytoevent.save
  #     redirect_to controller: 'companies', :event_id => event_id, action: 'index'
  #   end
  # end

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
