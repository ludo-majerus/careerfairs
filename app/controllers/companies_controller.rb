class CompaniesController < ApplicationController
  before_filter :require_admin_right, :only => [:index, :new, :create, :destroy]
  before_filter :require_company_right

  # GET /companies
  def index
    if params[:search].present?
      @search = Company.search(params[:search])
      @companies = @search.paginate(:page => params[:page], :per_page => 10)   # or @search.relation to lazy load in view // @search.paginate(:page => params[:page])
    elsif params[:event_id].present?
      @companies =
    else
      @companies = Company.where("", params[:event_id]).paginate(:page => params[:page], :per_page => 10)
    end
    @events = Event.where("date_event > ?", DateTime.now)
    @companytoevent = Companytoevent.new

  end

  # GET /companies/1
  def show
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  def create
    @company = Company.new(params[:company])

    if @company.save
      redirect_to companies_url, notice: 'Company was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /companies/1
  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to companies_url, notice: 'Company was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /companies/1
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    redirect_to companies_url
  end

  # SUBSCRIBE /events/1/companies/1/subscribe
  def subscribe
    companytoevent = Companytoevent.new
    companytoevent.event_id = params[:event_id]
    companytoevent.company_id = params[:company_id]
    if companytoevent.save
      redirect_to event_companies_url params[:event_id], notice: 'Company was successfully subscribed.'
    else
      redirect_to event_companies_url params[:event_id], notice: 'Company was not successfully subscribed.'
    end
  end

  # UNSUBSCRIBE /events/1/companies/1/unsubscribe
  def unsubscribe
    companytoeventlist = Companytoevent.where("company_id = ? and event_id = ?", params[:company_id], params[:event_id])
    companytoevent = companytoeventlist.first

    if companytoevent.destroy
      redirect_to event_companies_url params[:event_id], notice: 'Company was successfully unsubscribed.'
    else
      redirect_to event_companies_url params[:event_id], notice: 'Company was not successfully unsubscribed.'
    end
  end

end

