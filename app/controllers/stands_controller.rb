#noinspection ALL
class StandsController < ApplicationController
  # GET /stands
  #noinspection RailsChecklist01
  def index
    @event = Event.find(params[:event_id])
    #noinspection RailsChecklist01
    @companies = @companies = Company.where(["id in (select company_id from companytoevents where event_id = ?)", params[:event_id]])
    @stand = Stand.new
    @stands = Stand.where("event_id = '" + params[:event_id].to_s + "'")
    
    respond_to do |format|
      format.html # index.html.erb
      format.xls 
    end
  end


  # GET /stands/1/edit
  def edit
    @stand = Stand.find(params[:id])
    @stands = Stand.where("event_id = '" + params[:event_id].to_s + "'")

    render action: "index"
  end

  # POST /stands
  def create
    @stand = Stand.new(params[:stand])

    if @stand.save
      redirect_to event_stands_path @stand.event_id, notice: 'Stand was successfully created.'
    else
      render action: "new" 
    end
    
  end

  # PUT /stands/1
  def update
    @stand = Stand.find(params[:id])

    if @stand.update_attributes(params[:stand])
      redirect_to event_stands_path @stand.event_id, notice: 'Stand was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /stands/1
  def destroy
    @stand = Stand.find(params[:id])
    c2e_id = @stand.event_id
    @stand.destroy

    redirect_to event_stands_path c2e_id
  end
end
